#!/usr/bin/python3
"""One bounded forward/reverse test for the previously identified RCCar.

Requires wheels raised and explicit operator authorization. Uses the saved car ID
and requires a fresh pairing response for a new controller identity. Emits neutral
before/between/after 600 ms pulses; no repeated test loop.
"""
import json
import time
import secrets
from pathlib import Path
from functools import reduce
from operator import xor

import dbus
import dbus.service
import dbus.mainloop.glib
from gi.repository import GLib

ROOT = Path(__file__).resolve().parents[1]
IFACE = "org.bluez.LEAdvertisement1"


def packet(car, controller, direction, counter):
    data = bytearray(19)
    data[:2] = b"\x04\x07"
    data[2:5] = car
    data[5:8] = controller
    data[8] = {"neutral": 0, "forward": 1, "reverse": 2}[direction]
    data[9] = 0 if direction == "neutral" else 30
    data[10] = 1 if direction == "forward" else 0
    data[11] = 100  # BuildControlData data4
    data[14] = counter
    data[18] = reduce(xor, data[:18], 0xE9)
    return bytes(data)


class Advertisement(dbus.service.Object):
    def __init__(self, bus, payload, index):
        self.path = f"/org/rccar/movement_{index}"
        self.payload = payload
        super().__init__(bus, self.path)

    @dbus.service.method("org.freedesktop.DBus.Properties", in_signature="s", out_signature="a{sv}")
    def GetAll(self, interface):
        if interface != IFACE:
            return {}
        return {"Type": dbus.String("broadcast"),
                "ManufacturerData": dbus.Dictionary({dbus.UInt16(0): dbus.Array(self.payload, signature="y")}, signature="qv"),
                "MinInterval": dbus.UInt32(50), "MaxInterval": dbus.UInt32(50),
                "Timeout": dbus.UInt16(4)}

    @dbus.service.method(IFACE, in_signature="", out_signature="")
    def Release(self):
        pass


def main():
    pairing = json.loads((ROOT / "analysis/evidence/live-pairing-test.json").read_text())
    car = bytes.fromhex(pairing["response"]["car_id_hex"])
    controller = secrets.token_bytes(3)
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
    bus = dbus.SystemBus()
    objects = dbus.Interface(bus.get_object("org.bluez", "/"), "org.freedesktop.DBus.ObjectManager")
    path = next(p for p, i in objects.GetManagedObjects().items() if "org.bluez.LEAdvertisingManager1" in i)
    manager = dbus.Interface(bus.get_object("org.bluez", path), "org.bluez.LEAdvertisingManager1")
    adapter = dbus.Interface(bus.get_object("org.bluez", path), "org.bluez.Adapter1")
    events = []
    paired = [False]
    seen_responses = set()

    def emit(event):
        event["monotonic"] = time.monotonic()
        events.append(event)
        print(json.dumps(event), flush=True)

    def inspect():
        for _, interfaces in objects.GetManagedObjects().items():
            device = interfaces.get("org.bluez.Device1", {})
            raw = device.get("ManufacturerData", {}).get(0)
            if raw is None:
                continue
            data = bytes(raw)
            if len(data) != 19 or data[2:5] != car or data[5:8] != controller:
                continue
            if data not in seen_responses:
                seen_responses.add(data)
                emit({"event": "car_response", "payload": data.hex(" ")})
            if data[:2] == b"\x04\x0a":
                paired[0] = True
        return True

    def send(direction, duration, counter):
        if direction == "pair":
            data = bytearray(19)
            data[:2] = b"\x04\x06"
            data[5:8] = controller
            data[18] = reduce(xor, data[:18], 0xE9)
            payload = bytes(data)
        else:
            payload = packet(car, controller, direction, counter)
        ad = Advertisement(bus, payload, counter)
        loop = GLib.MainLoop()
        state = {"registered": False, "error": None, "timer": None}

        def ok():
            state["registered"] = True
            emit({"event": "advertisement_registered", "direction": direction,
                  "duration_seconds": duration, "payload": payload.hex(" ")})
            state["timer"] = GLib.timeout_add(int(duration * 1000), finish)

        def finish():
            state["timer"] = None
            loop.quit()
            return False

        def error(exc):
            state["error"] = str(exc)
            loop.quit()

        def timeout():
            state["error"] = "Advertisement registration/duration timeout"
            loop.quit()
            return False

        watchdog = GLib.timeout_add(6000, timeout)
        manager.RegisterAdvertisement(ad.path, dbus.Dictionary({}, signature="sv"),
                                      reply_handler=ok, error_handler=error, timeout=5)
        try:
            loop.run()
        finally:
            if state["timer"] is not None:
                GLib.source_remove(state["timer"])
            if state["error"] != "Advertisement registration/duration timeout":
                GLib.source_remove(watchdog)
            if state["registered"]:
                try:
                    manager.UnregisterAdvertisement(ad.path, timeout=3)
                except dbus.DBusException as exc:
                    if exc.get_dbus_name() != "org.bluez.Error.DoesNotExist":
                        raise
            ad.remove_from_connection()
        if state["error"]:
            raise RuntimeError(state["error"])

    adapter.SetDiscoveryFilter(dbus.Dictionary({"Transport": "le", "DuplicateData": True}, signature="sv"))
    adapter.StartDiscovery()
    poll = GLib.timeout_add(100, inspect)
    try:
        send("pair", 1.5, 0)
        if not paired[0]:
            raise RuntimeError("No fresh matching pairing response; movement aborted")
        send("neutral", 1.0, 1)
        send("forward", 0.6, 2)
        send("neutral", 2.0, 3)
        send("reverse", 0.6, 4)
    finally:
        try:
            send("neutral", 3.0, 5)
            emit({"event": "final_neutral_sent"})
        finally:
            GLib.source_remove(poll)
            adapter.StopDiscovery()
            (ROOT / "analysis/evidence/live-movement-test-2.json").write_text(json.dumps({
                "events": events, "car_id": car.hex(" "), "controller_id": controller.hex(" "),
                "fresh_pairing_response": paired[0],
                "physical_result": "awaiting user observation",
                "note": "Registration confirms BlueZ accepted the data; physical movement requires observation."
            }, indent=2))


if __name__ == "__main__":
    main()
