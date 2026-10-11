#!/usr/bin/python3
"""Local RCCar web controller. Start with /usr/bin/python3 web/server.py."""
import argparse
import json
import secrets
import signal
import threading
import time
from collections import deque
from functools import reduce
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from operator import xor
from pathlib import Path
from urllib.parse import urlsplit

import dbus
import dbus.service
import dbus.mainloop.glib
from gi.repository import GLib

ROOT = Path(__file__).resolve().parent
ADV = 'org.bluez.LEAdvertisement1'
NEUTRAL = dict(throttle=0, steering=0, speed=30, lights=False, horn=False, led1=False, led2=False, extra=False)


def validate_control(value):
    if not isinstance(value, dict) or set(value) - set(NEUTRAL):
        raise ValueError('Comando inválido.')
    result = {**NEUTRAL, **value}
    for key in ('throttle', 'steering'):
        if type(result[key]) is not int or result[key] not in (-1, 0, 1):
            raise ValueError('Direção inválida.')
    if type(result['speed']) is not int or not 0 <= result['speed'] <= 100:
        raise ValueError('Velocidade deve estar entre 0 e 100.')
    for key in ('lights', 'horn', 'led1', 'led2', 'extra'):
        if type(result[key]) is not bool:
            raise ValueError('Função inválida.')
    return result


def packet(car, controller, control, counter, pairing=False):
    b = bytearray(19)
    b[:2] = bytes((4, 6 if pairing else 7))
    b[5:8] = controller
    if not pairing:
        b[2:5] = car
        t, s = control['throttle'], control['steering']
        b[8] = (1 if t > 0 else 2 if t < 0 else 0) | (4 if s < 0 else 8 if s > 0 else 0)
        b[9] = control['speed'] if t else 0
        b[10] = (1 if t > 0 else 0) | (4 if control['lights'] else 0) | (8 if control['horn'] else 0) | (16 if control['led1'] else 0) | (32 if control['led2'] else 0)
        b[11] = 100
        b[12] = int(control['extra'])
        b[14] = counter
    b[18] = reduce(xor, b[:18], 0xE9)
    return bytes(b)


class Advertisement(dbus.service.Object):
    def __init__(self, bus, path, payload):
        self.payload = payload
        self.path = path
        super().__init__(bus, path)

    @dbus.service.method('org.freedesktop.DBus.Properties', in_signature='s', out_signature='a{sv}')
    def GetAll(self, interface):
        if interface != ADV:
            return {}
        return {'Type': dbus.String('broadcast'), 'ManufacturerData': dbus.Dictionary({dbus.UInt16(0): dbus.Array(self.payload, signature='y')}, signature='qv'), 'MinInterval': dbus.UInt32(50), 'MaxInterval': dbus.UInt32(50), 'Timeout': dbus.UInt16(2)}

    @dbus.service.method(ADV, in_signature='', out_signature='')
    def Release(self):
        pass


class BlueZ:
    def __init__(self):
        self.bus = dbus.SystemBus()
        self.objects = dbus.Interface(self.bus.get_object('org.bluez', '/'), 'org.freedesktop.DBus.ObjectManager')
        paths = [p for p, i in self.objects.GetManagedObjects().items() if 'org.bluez.LEAdvertisingManager1' in i]
        if not paths:
            raise RuntimeError('Nenhum adaptador com anúncios BLE disponível.')
        self.path = paths[0]
        self.adapter = dbus.Interface(self.bus.get_object('org.bluez', self.path), 'org.bluez.Adapter1')
        self.manager = dbus.Interface(self.bus.get_object('org.bluez', self.path), 'org.bluez.LEAdvertisingManager1')
        self.ad = None
        self.index = 0
        self.scanning = False

    def scan(self, enabled):
        if enabled and not self.scanning:
            self.adapter.SetDiscoveryFilter(dbus.Dictionary({'Transport': 'le', 'DuplicateData': True}, signature='sv'))
            self.adapter.StartDiscovery(timeout=2)
            self.scanning = True
        elif not enabled and self.scanning:
            self.adapter.StopDiscovery(timeout=2)
            self.scanning = False

    def responses(self):
        for interfaces in self.objects.GetManagedObjects(timeout=2).values():
            data = interfaces.get('org.bluez.Device1', {}).get('ManufacturerData', {}).get(0)
            if data is not None:
                yield bytes(data)

    def clear(self):
        if self.ad:
            ad, self.ad = self.ad, None
            try:
                self.manager.UnregisterAdvertisement(ad.path, timeout=2)
            except dbus.DBusException as exc:
                if exc.get_dbus_name() != 'org.bluez.Error.DoesNotExist':
                    raise
            finally:
                ad.remove_from_connection()

    def replace(self, payload, callback):
        self.clear()
        self.index += 1
        self.ad = Advertisement(self.bus, f'/org/rccar/web_{self.index}', payload)
        self.manager.RegisterAdvertisement(self.ad.path, dbus.Dictionary({}, signature='sv'),
            reply_handler=lambda: callback(None), error_handler=lambda e: callback(str(e)), timeout=2)


class Simulation:
    def scan(self, enabled):
        pass
    def responses(self):
        return []
    def clear(self):
        pass
    def replace(self, payload, callback):
        callback(None)


class Controller:
    """All mutations run on GLib's thread; HTTP reads a copied snapshot."""
    def __init__(self, radio, car=None, simulated=False, clock=time.monotonic):
        self.radio, self.car, self.simulated, self.clock = radio, car, simulated, clock
        self.target = car
        self.candidates = set()
        self.first_response = None
        self.state = 'disconnected'
        self.identity = b'\0' * 3
        self.control = NEUTRAL.copy()
        self.owner = ''
        self.sequence = -1
        self.lease = 0
        self.last_input = 0
        self.started = 0
        self.deadline = 0
        self.counter = 0
        self.last_tx = -100
        self.last_payload = None
        self.busy = False
        self.error = ''
        self.events = deque(maxlen=30)
        self.lock = threading.Lock()
        self.view = {}
        self.log('Painel pronto. Ligue o carrinho e clique em conectar.')
        self.publish()

    def log(self, message):
        self.events.append({'time': time.strftime('%H:%M:%S'), 'message': message})

    def publish(self):
        with self.lock:
            self.view = {'state': self.state, 'simulated': self.simulated, 'car_id': self.car.hex(' ').upper() if self.car else 'A descobrir',
                'candidates': [c.hex(' ').upper() for c in sorted(self.candidates)],
                'controller_id': self.identity.hex(' ').upper() if self.owner else '—', 'owner': self.owner,
                'control': dict(self.control), 'packet': self.last_payload.hex(' ').upper() if self.last_payload else '',
                'error': self.error, 'events': list(self.events), 'counter': self.counter}

    def snapshot(self):
        with self.lock:
            return dict(self.view)

    def action(self, action, client, seq, control=None, car_id=None):
        now = self.clock()
        if action == 'connect':
            if self.state in ('pairing', 'selecting', 'ready', 'stopping'):
                raise ValueError('Já existe uma sessão ativa. Pare e desconecte antes de reconectar.')
            self.owner, self.sequence = client, seq
            self.identity = secrets.token_bytes(3)
            self.car = self.target
            self.candidates.clear()
            self.first_response = None
            self.state, self.error = 'pairing', ''
            self.control = NEUTRAL.copy()
            self.started = self.last_input = now
            self.last_payload = None
            self.last_tx = -100
            try:
                self.radio.scan(True)
            except Exception as exc:
                self.sent(str(exc))
                raise
            self.log('Procurando resposta ao pareamento…')
        else:
            if client != self.owner:
                raise ValueError('Esta aba não é dona da conexão.')
            if seq <= self.sequence:
                raise ValueError('Comando antigo descartado.')
            self.sequence = seq
            if action == 'select':
                if self.state != 'selecting' or car_id not in self.candidates:
                    raise ValueError('Escolha um carrinho que respondeu à busca atual.')
                self.activate(car_id, now)
            elif action == 'control':
                if self.state != 'ready':
                    raise ValueError('Conecte o carrinho primeiro.')
                self.control = validate_control(control)
                self.lease = now + 0.4
                self.last_input = now
            elif action in ('stop', 'disconnect'):
                self.control = NEUTRAL.copy()
                self.lease = 0
                self.last_input = now
                self.log('Parada solicitada.' if action == 'stop' else 'Enviando neutro antes de desconectar…')
                if action == 'disconnect' or self.state in ('pairing', 'selecting'):
                    self.begin_stop(now)
            else:
                raise ValueError('Ação inválida.')
        self.publish()

    def activate(self, car, now):
        self.car = car
        self.state = 'ready'
        self.last_input = now
        self.radio.scan(False)
        self.log('Pareamento confirmado com ' + car.hex(' ').upper() + '. Controles liberados.')

    def begin_stop(self, now):
        self.radio.scan(False)
        self.control = NEUTRAL.copy()
        self.state = 'stopping'
        # Before selecting a destination, only pairing packets have been sent.
        # Wait for any in-flight registration, then clear it without a control packet.
        self.deadline = now + 2.5 if self.car else now

    def tick(self):
        now = self.clock()
        try:
            if self.state in ('pairing', 'selecting'):
                responses = list(self.radio.responses())
                if self.simulated and now - self.started > 0.4:
                    b = bytearray(packet(self.target or bytes.fromhex('f985b7'), self.identity, NEUTRAL, 1))
                    b[1] = 10
                    b[18] = reduce(xor, b[:18], 0xE9)
                    responses.append(bytes(b))
                for b in responses:
                    # Checksum is NOT verified on responses: the official app only checks
                    # length/type/opcode plus the echo of our per-search random identity
                    # (calDataIsTrue). One observed car answers with a different checksum.
                    if (len(b) == 19 and b[:2] == b'\x04\x0a' and b[5:8] == self.identity
                            and (self.target is None or b[2:5] == self.target)):
                        car = b[2:5]
                        if car not in self.candidates:
                            self.candidates.add(car)
                            if self.first_response is None:
                                self.first_response = now
                            self.log('Carrinho encontrado: ' + car.hex(' ').upper())
                if self.state == 'pairing' and self.first_response is not None and now - self.first_response >= 1.5:
                    if len(self.candidates) == 1:
                        self.activate(next(iter(self.candidates)), now)
                    else:
                        self.state = 'selecting'
                        self.deadline = now + 30
                        self.log('Mais de um carrinho respondeu. Escolha o ID no painel ou refaça a busca com apenas um ligado.')
                elif (self.state == 'pairing' and not self.candidates and now - self.started > 8) or (self.state == 'selecting' and now > self.deadline):
                    self.radio.scan(False)
                    self.state = 'error'
                    self.error = 'Busca encerrada. Ligue apenas o carrinho desejado, deixe a luz piscando e conecte novamente.'
                    self.log(self.error)
            if self.state == 'ready':
                if now > self.lease and (self.control['throttle'] or self.control['steering'] or self.control['horn'] or self.control['extra']):
                    self.control.update(throttle=0, steering=0, horn=False, extra=False)
                    self.log('Neutro automático: comando sem renovação.')
                if now - self.last_input > 5:
                    self.control = NEUTRAL.copy()
                    self.state, self.deadline = 'stopping', now + 2.5
                    self.log('Aba sem comunicação. Parando e encerrando sessão.')
            if self.state == 'stopping' and now >= self.deadline and not self.busy:
                self.radio.clear()
                self.state, self.owner = 'disconnected', ''
                self.last_payload = None
                self.log('Sessão encerrada.')
            if self.state in ('pairing', 'selecting', 'ready', 'stopping') and not self.busy:
                pairing = self.state in ('pairing', 'selecting')
                b = packet(self.car, self.identity, self.control, self.counter, pairing)
                changed = self.last_payload is None or b[:14] + b[15:18] != self.last_payload[:14] + self.last_payload[15:18]
                if changed or now - self.last_tx >= 0.5:
                    self.counter = self.counter % 250 + 1
                    b = packet(self.car, self.identity, self.control, self.counter, pairing)
                    self.busy = True
                    self.last_payload, self.last_tx = b, now
                    self.radio.replace(b, self.sent)
            elif self.state == 'error' and not self.busy:
                self.radio.clear()
        except Exception as exc:
            self.sent(str(exc))
        self.publish()
        return True

    def sent(self, error):
        self.busy = False
        if error:
            self.state, self.error = 'error', str(error)
            self.control = NEUTRAL.copy()
            self.log('Erro Bluetooth: ' + str(error))
            try:
                self.radio.clear()
                self.radio.scan(False)
            except Exception:
                pass
        self.publish()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--port', type=int, default=8767)
    parser.add_argument('--simulate', action='store_true', help='No Bluetooth transmissions')
    parser.add_argument('--car-id', help='Optional three-byte car ID filter; default discovers responding cars')
    args = parser.parse_args()
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
    try:
        car = bytes.fromhex(args.car_id) if args.car_id else None
        if car is not None and len(car) != 3:
            raise ValueError()
    except ValueError:
        parser.error('--car-id deve conter exatamente 3 bytes hexadecimais.')
    controller = Controller(Simulation() if args.simulate else BlueZ(), car, args.simulate)
    token = secrets.token_urlsafe(32)
    allowed_hosts = {f'127.0.0.1:{args.port}', f'localhost:{args.port}'}

    class Handler(BaseHTTPRequestHandler):
        def log_message(self, fmt, *values):
            pass
        def reply(self, status, value, mime='application/json'):
            data = json.dumps(value).encode() if mime == 'application/json' else value
            self.send_response(status)
            self.send_header('Content-Type', mime + '; charset=utf-8')
            self.send_header('Content-Length', str(len(data)))
            self.send_header('Cache-Control', 'no-store')
            self.send_header('X-Content-Type-Options', 'nosniff')
            self.send_header('Content-Security-Policy', "default-src 'self'; style-src 'self'; script-src 'self'; connect-src 'self'; frame-ancestors 'none'")
            self.end_headers()
            self.wfile.write(data)
        def valid_host(self):
            return self.headers.get('Host') in allowed_hosts
        def do_GET(self):
            if not self.valid_host():
                return self.reply(403, {'error': 'Host inválido.'})
            path = urlsplit(self.path).path
            if path == '/api/status':
                return self.reply(200, controller.snapshot())
            resources = {'/': ('index.html', 'text/html'), '/app.js': ('app.js', 'text/javascript'), '/style.css': ('style.css', 'text/css')}
            if path not in resources:
                return self.reply(404, {'error': 'Não encontrado.'})
            name, mime = resources[path]
            data = (ROOT / name).read_bytes().replace(b'__TOKEN__', token.encode())
            self.reply(200, data, mime)
        def do_POST(self):
            if (not self.valid_host() or self.headers.get('X-RCCar-Token') != token
                    or self.headers.get('Origin', '') not in ('', *(f'http://{h}' for h in allowed_hosts))):
                return self.reply(403, {'error': 'Origem inválida.'})
            if self.path != '/api/action':
                return self.reply(404, {'error': 'Não encontrado.'})
            try:
                size = int(self.headers.get('Content-Length', '0'))
                if not 0 < size <= 2048:
                    raise ValueError('Tamanho inválido.')
                req = json.loads(self.rfile.read(size))
                action, client, seq = req['action'], req['client'], req['seq']
                if action not in ('connect', 'select', 'control', 'stop', 'disconnect') or not isinstance(client, str) or not 8 <= len(client) <= 100 or type(seq) is not int or seq < 0:
                    raise ValueError('Requisição inválida.')
                control = validate_control(req.get('control', {})) if action == 'control' else None
                car_id = bytes.fromhex(req['car_id']) if action == 'select' else None
                if car_id is not None and len(car_id) != 3:
                    raise ValueError('ID inválido.')
            except (ValueError, KeyError, TypeError) as exc:
                return self.reply(400, {'error': str(exc)})
            done, result = threading.Event(), {}
            received = time.monotonic()
            def invoke():
                try:
                    if action == 'control' and time.monotonic() - received > 0.4:
                        raise ValueError('Comando expirado antes do processamento.')
                    controller.action(action, client, seq, control, car_id)
                    result['ok'] = True
                except Exception as exc:
                    result['error'] = str(exc)
                finally:
                    done.set()
                return False
            GLib.idle_add(invoke)
            if not done.wait(3):
                return self.reply(503, {'error': 'Bluetooth ocupado; comando pode estar pendente.'})
            self.reply(200 if 'ok' in result else 409, result)

    server = ThreadingHTTPServer(('127.0.0.1', args.port), Handler)
    server.daemon_threads = True
    threading.Thread(target=server.serve_forever, daemon=True).start()
    loop = GLib.MainLoop()
    GLib.timeout_add(50, controller.tick)
    def shutdown(*unused):
        if controller.state in ('ready', 'pairing', 'selecting', 'stopping'):
            controller.begin_stop(time.monotonic())
            GLib.timeout_add(3000, lambda: (loop.quit(), False)[1])
        else:
            loop.quit()
    signal.signal(signal.SIGINT, shutdown)
    signal.signal(signal.SIGTERM, shutdown)
    print(f"RCCar {'SIMULAÇÃO' if args.simulate else 'Bluetooth real'}: http://127.0.0.1:{args.port}", flush=True)
    try:
        loop.run()
    finally:
        controller.radio.clear()
        controller.radio.scan(False)
        server.shutdown()


if __name__ == '__main__':
    main()
