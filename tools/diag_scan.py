#!/usr/bin/env python3
"""Diagnostic: send the RCCar pairing request (opcode 06) and log EVERY BLE
advertisement carrying any payload, not just the expected response format.
Reveals cars that answer with a different type/opcode, other manufacturer IDs,
or GATT-style connectable advertisements. Passive mode (--no-advertise) logs
what cars transmit on their own. Read-only towards the car otherwise."""
import argparse
import json
import secrets
import time
from functools import reduce
from operator import xor

import dbus
import dbus.service
import dbus.mainloop.glib
from gi.repository import GLib

ADVERTISEMENT = "org.bluez.LEAdvertisement1"
PROPERTIES = "org.freedesktop.DBus.Properties"


def checksum(data):
    return reduce(xor, data, 0xE9)


class Advertisement(dbus.service.Object):
    def __init__(self, bus, payload, timeout):
        self.path = "/org/rccar/diag_probe"
        self.payload = payload
        self.timeout = timeout
        super().__init__(bus, self.path)

    @dbus.service.method(PROPERTIES, in_signature="s", out_signature="a{sv}")
    def GetAll(self, interface):
        if interface != ADVERTISEMENT:
            return {}
        return {
            "Type": dbus.String("broadcast"),
            "ManufacturerData": dbus.Dictionary({dbus.UInt16(0): dbus.Array(self.payload, signature="y")}, signature="qv"),
            "MinInterval": dbus.UInt32(50),
            "MaxInterval": dbus.UInt32(50),
            "Timeout": dbus.UInt16(self.timeout),
        }

    @dbus.service.method(ADVERTISEMENT, in_signature="", out_signature="")
    def Release(self):
        pass


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--seconds", type=int, default=45)
    parser.add_argument("--no-advertise", action="store_true", help="Passive: send no pairing request")
    args = parser.parse_args()
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
    payload[18] = checksum(payload[:18])
    advertisement = None if args.no_advertise else Advertisement(bus, bytes(payload), args.seconds)
    loop = GLib.MainLoop()
    started = time.monotonic()
    seen = {}
    problems = []

    def describe(key, raw):
        """Classify a manufacturer payload relative to our identity and RCCar protocol."""
        data = bytes(raw)
        info = {
            "manufacturer_id": int(key),
            "raw_hex": data.hex(" "),
            "length": len(data),
            "contains_our_identity": identity in data,
        }
        if len(data) >= 2:
            info["type"] = data[0]
            info["opcode"] = data[1]
        if len(data) >= 5:
            info["car_id"] = data[2:5].hex(" ").upper()
        if len(data) >= 8:
            info["controller_id_field"] = data[5:8].hex(" ").upper()
            info["mentions_our_identity"] = (data[5:8] == identity)
        if len(data) == 19:
            info["checksum_ok_19"] = (checksum(data) == 0)
        return info

    def inspect():
        for path_, interfaces in objects.GetManagedObjects().items():
            device = interfaces.get("org.bluez.Device1", {})
            manufacturers = device.get("ManufacturerData", {})
            service_data = device.get("ServiceData", {})
            name = str(device.get("Name", ""))
            uuids = [str(u) for u in device.get("UUIDs", [])]
            if not manufacturers and not service_data and not name and not uuids:
                continue
            address = str(device.get("Address", ""))
            rssi = int(device.get("RSSI", 0))
            entry = {
                "address": address, "name": name, "rssi": rssi,
                "services": uuids,
                "manufacturer": {str(k): bytes(v).hex(" ") for k, v in manufacturers.items()},
                "service_data": {str(k): bytes(v).hex(" ") for k, v in service_data.items()},
            }
            is_candidate = False
            analyses = []
            for key, raw in manufacturers.items():
                inf = describe(key, raw)
                analyses.append(inf)
                if int(key) == 0 or inf.get("contains_our_identity") or inf.get("mentions_our_identity"):
                    is_candidate = True
            if "rccar" in name.lower() or any("fff0" in u.lower() for u in uuids):
                is_candidate = True
            if analyses:
                entry["manufacturer_analysis"] = analyses
            if is_candidate:
                problems.append(entry)

            signature = json.dumps({k: v for k, v in entry.items() if k != "rssi"}, sort_keys=True)
            previous = seen.get(address + signature)
            if previous is None:
                print(json.dumps({"event": "device", "is_candidate": is_candidate, **entry}, ensure_ascii=False), flush=True)
                seen[address + signature] = time.monotonic()
        if time.monotonic() - started >= args.seconds:
            loop.quit()
            return False
        return True

    adapter.SetDiscoveryFilter(dbus.Dictionary({"Transport": "le", "DuplicateData": True}, signature="sv"))
    adapter.StartDiscovery()
    registered = False

    def success():
        nonlocal registered
        registered = True
        print(json.dumps({"event": "pairing_request_registered",
                          "payload": payload.hex(" "), "controller_id": identity.hex(" "),
                          "mode": "passive" if args.no_advertise else "active",
                          "duration_seconds": args.seconds}), flush=True)

    def failure(error):
        print(json.dumps({"event": "advertise_error", "message": str(error)}), flush=True)
        loop.quit()

    try:
        if advertisement is not None:
            advertiser.RegisterAdvertisement(advertisement.path, dbus.Dictionary({}, signature="sv"),
                                             reply_handler=success, error_handler=failure)
        else:
            success()
        GLib.timeout_add(300, inspect)
        loop.run()
    finally:
        if registered and advertisement is not None:
            try:
                advertiser.UnregisterAdvertisement(advertisement.path)
            except dbus.DBusException as error:
                if error.get_dbus_name() != "org.bluez.Error.DoesNotExist":
                    print(json.dumps({"event": "cleanup_error", "message": str(error)}), flush=True)
        adapter.StopDiscovery()
        if advertisement is not None:
            advertisement.remove_from_connection()
    print(json.dumps({"event": "finished", "devices_logged": len(seen),
                      "candidates": len(problems)}, ensure_ascii=False), flush=True)
    for entry in problems:
        print(json.dumps({"event": "candidate", **entry}, ensure_ascii=False), flush=True)


if __name__ == "__main__":
    main()
