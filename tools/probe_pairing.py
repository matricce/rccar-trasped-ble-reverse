#!/usr/bin/python3
"""Bounded RCCar broadcast pairing probe. Sends opcode 06 only, no driving commands."""
import json
import secrets
from functools import reduce
from operator import xor

import dbus
import dbus.service
import dbus.mainloop.glib
from gi.repository import GLib

ADVERTISEMENT = "org.bluez.LEAdvertisement1"
PROPERTIES = "org.freedesktop.DBus.Properties"


class Advertisement(dbus.service.Object):
    def __init__(self, bus, payload):
        self.path = "/org/rccar/pairing_probe"
        self.payload = payload
        super().__init__(bus, self.path)

    @dbus.service.method(PROPERTIES, in_signature="s", out_signature="a{sv}")
    def GetAll(self, interface):
        if interface != ADVERTISEMENT:
            return {}
        return {
            "Type": dbus.String("broadcast"),
            "ManufacturerData": dbus.Dictionary({dbus.UInt16(0): dbus.Array(self.payload, signature="y")}, signature="qv"),
            "Timeout": dbus.UInt16(12),
        }

    @dbus.service.method(ADVERTISEMENT, in_signature="", out_signature="")
    def Release(self):
        pass


def main():
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
    bus = dbus.SystemBus()
    objects = dbus.Interface(bus.get_object("org.bluez", "/"), "org.freedesktop.DBus.ObjectManager")
    path = next(p for p, interfaces in objects.GetManagedObjects().items()
                if "org.bluez.LEAdvertisingManager1" in interfaces)
    adapter = dbus.Interface(bus.get_object("org.bluez", path), "org.bluez.Adapter1")
    advertiser = dbus.Interface(bus.get_object("org.bluez", path), "org.bluez.LEAdvertisingManager1")
    identity = secrets.token_bytes(3)
    payload = bytearray(19)
    payload[:2] = b"\x04\x06"
    payload[5:8] = identity
    payload[18] = reduce(xor, payload[:18], 0xE9)
    advertisement = Advertisement(bus, payload)
    loop = GLib.MainLoop()
    state = {"registered": False, "response": False, "error": None}
    seen = set()

    def success():
        state["registered"] = True
        print(json.dumps({"event": "pairing_request_registered", "payload": payload.hex(" "),
                          "controller_id": identity.hex(" "), "timeout_seconds": 12}), flush=True)

    def failure(error):
        state["error"] = str(error)
        print(json.dumps({"event": "error", "message": str(error)}), flush=True)
        loop.quit()

    def inspect():
        for _, interfaces in objects.GetManagedObjects().items():
            device = interfaces.get("org.bluez.Device1", {})
            value = device.get("ManufacturerData", {}).get(0)
            if value is None:
                continue
            data = bytes(value)
            key = (str(device.get("Address", "")), data)
            if key in seen:
                continue
            seen.add(key)
            match = len(data) >= 8 and data[:2] == b"\x04\x0a" and data[5:8] == identity
            print(json.dumps({"event": "manufacturer_0000", "address": key[0],
                              "payload": data.hex(" "), "matching_pair_response": match}), flush=True)
            if match:
                state["response"] = True
                loop.quit()
        return True

    adapter.SetDiscoveryFilter(dbus.Dictionary({"Transport": "le", "DuplicateData": True}, signature="sv"))
    adapter.StartDiscovery()
    try:
        advertiser.RegisterAdvertisement(advertisement.path, dbus.Dictionary({}, signature="sv"),
                                         reply_handler=success, error_handler=failure)
        GLib.timeout_add(200, inspect)
        GLib.timeout_add_seconds(13, lambda: (loop.quit(), False)[1])
        loop.run()
    finally:
        if state["registered"]:
            try:
                advertiser.UnregisterAdvertisement(advertisement.path)
            except dbus.DBusException as error:
                if error.get_dbus_name() != "org.bluez.Error.DoesNotExist":
                    print(json.dumps({"cleanup_error": str(error)}), flush=True)
        adapter.StopDiscovery()
        advertisement.remove_from_connection()
    print(json.dumps({"event": "finished", **state}), flush=True)


if __name__ == "__main__":
    main()
