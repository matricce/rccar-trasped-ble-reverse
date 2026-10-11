#!/usr/bin/python3
"""Scan with BlueZ; print only RCCar candidates. No connection or control writes."""
import argparse
import json
import time

import dbus
import dbus.mainloop.glib
from gi.repository import GLib


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--seconds", type=int, default=30)
    args = parser.parse_args()
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
    bus = dbus.SystemBus()
    manager = dbus.Interface(bus.get_object("org.bluez", "/"), "org.freedesktop.DBus.ObjectManager")
    objects = manager.GetManagedObjects()
    adapter_path = next(p for p, i in objects.items() if "org.bluez.Adapter1" in i)
    adapter = dbus.Interface(bus.get_object("org.bluez", adapter_path), "org.bluez.Adapter1")
    adapter.SetDiscoveryFilter(dbus.Dictionary({"Transport": "le", "DuplicateData": True}, signature="sv"))
    seen = set()
    matches = {}
    loop = GLib.MainLoop()
    started = time.monotonic()

    def inspect():
        for path, interfaces in manager.GetManagedObjects().items():
            dev = interfaces.get("org.bluez.Device1")
            if dev is None or "RSSI" not in dev:
                continue
            address = str(dev["Address"])
            seen.add(address)
            name = str(dev.get("Name", ""))
            uuids = [str(x) for x in dev.get("UUIDs", [])]
            manufacturers = dev.get("ManufacturerData", {})
            if not ("rccar" in name.lower() or "trasped" in name.lower()
                    or any(x.lower().startswith("0000fff0-") for x in uuids)
                    or 0 in manufacturers):
                continue
            result = {"address": address, "name": name, "rssi": int(dev["RSSI"]),
                      "uuids": uuids, "connected": bool(dev.get("Connected", False)),
                      "manufacturer": {str(k): bytes(v).hex(" ") for k, v in manufacturers.items()}}
            signature = json.dumps({k: v for k, v in result.items() if k != "rssi"}, sort_keys=True)
            if matches.get(address) != signature:
                print(json.dumps(result, ensure_ascii=False), flush=True)
                matches[address] = signature
        if time.monotonic() - started >= args.seconds:
            loop.quit()
            return False
        return True

    adapter.StartDiscovery()
    try:
        GLib.timeout_add(500, inspect)
        loop.run()
    finally:
        adapter.StopDiscovery()
    print(json.dumps({"devices_seen": len(seen), "candidate_count": len(matches)}), flush=True)


if __name__ == "__main__":
    main()
