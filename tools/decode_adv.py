#!/usr/bin/env python3
"""Decode RCCar's observed 19-byte broadcast format; does not transmit anything."""
import argparse
import json
from functools import reduce
from operator import xor


def decode(payload: bytes) -> dict:
    if len(payload) != 19:
        raise ValueError("O payload deve ter exatamente 19 bytes.")
    expected = reduce(xor, payload[:18], 0xE9)
    return {
        "payload_hex": payload.hex(" "),
        "machine_type": payload[0],
        "opcode": payload[1],
        "car_id_hex": payload[2:5].hex(" "),
        "controller_id_hex": payload[5:8].hex(" "),
        "control_bytes_hex": payload[8:18].hex(" "),
        "checksum_received": f"{payload[18]:02x}",
        "checksum_expected": f"{expected:02x}",
        "checksum_valid": payload[18] == expected,
        "scope": "Layout observado em ContainerRemoveCarOperUIController; validar no carrinho.",
    }


def manufacturer_payload(ad: bytes) -> bytes:
    offset = 0
    matches = []
    while offset < len(ad):
        size = ad[offset]
        if size == 0:
            break
        end = offset + 1 + size
        if end > len(ad):
            raise ValueError("Estrutura AD truncada.")
        field = ad[offset + 1:end]
        if len(field) == 22 and field[:3] == b"\xff\x00\x00":
            matches.append(field[3:])
        offset = end
    if len(matches) != 1:
        raise ValueError("Esperada uma estrutura AD de fabricante 0000 com payload de 19 bytes.")
    return matches[0]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("hex", help="Bytes hexadecimais, entre aspas se houver espaços.")
    parser.add_argument("--ad", action="store_true", help="Entrada contém o Advertising Data completo, sem cabeçalho HCI.")
    args = parser.parse_args()
    try:
        raw = bytes.fromhex(args.hex.replace(":", " "))
        print(json.dumps(decode(manufacturer_payload(raw) if args.ad else raw), indent=2, ensure_ascii=False))
    except ValueError as error:
        parser.error(str(error))


if __name__ == "__main__":
    main()
