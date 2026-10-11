import unittest
from web.server import Controller, NEUTRAL, packet, validate_control

CAR=bytes.fromhex('f985b7')
IDENTITY=bytes.fromhex('914314')

class Radio:
    def __init__(self):self.packets=[];self.cleared=False;self.replies=[]
    def scan(self,value):pass
    def responses(self):return self.replies
    def replace(self,payload,callback):self.packets.append(payload);callback(None)
    def clear(self):self.cleared=True

class ControlTests(unittest.TestCase):
    def test_observed_vectors(self):
        for direction,counter,expected in [(1,2,'0407f985b7914314011e01640000020000009f'),(-1,4,'0407f985b7914314021e00640000040000009b'),(0,5,'0407f985b79143140000006400000500000086')]:
            self.assertEqual(packet(CAR,IDENTITY,{**NEUTRAL,'throttle':direction},counter).hex(),expected)
    def test_steering_and_functions(self):
        b=packet(CAR,IDENTITY,{**NEUTRAL,'steering':-1,'lights':True,'horn':True,'led1':True,'led2':True,'extra':True},1)
        self.assertEqual(b[8],4);self.assertEqual(b[9],0);self.assertEqual(b[10],60);self.assertEqual(b[12],1)
    def test_bad_controls(self):
        for control in [{'speed':101},{'speed':True},{'throttle':2},{'extra':1},{'bogus':0}]:
            with self.assertRaises(ValueError):validate_control(control)
    def ready(self):
        self.now=10
        radio=Radio();c=Controller(radio,CAR,True,lambda:self.now)
        c.action('connect','client-one',1);c.tick();self.now+=.6;c.tick()
        self.now+=1.6;c.tick()
        self.assertEqual(c.state,'ready')
        return c,radio
    def test_lease_stops_without_browser(self):
        c,r=self.ready();c.action('control','client-one',2,{**NEUTRAL,'throttle':1,'horn':True});c.tick()
        self.assertEqual(r.packets[-1][8],1)
        self.now+=.41;c.tick()
        self.assertEqual(r.packets[-1][8:11],b'\0\0\0')
    def test_stale_and_other_tab_cannot_restart(self):
        c,r=self.ready();c.action('control','client-one',2,{**NEUTRAL,'throttle':1});c.action('stop','client-one',4)
        with self.assertRaises(ValueError):c.action('control','client-one',3,{**NEUTRAL,'throttle':1})
        with self.assertRaises(ValueError):c.action('control','client-two',5,{**NEUTRAL,'throttle':1})
        c.tick();self.assertEqual(r.packets[-1][8],0)
    def test_abandoned_page_disconnects_after_neutral(self):
        c,r=self.ready();self.now+=5.1;c.tick();self.assertEqual(c.state,'stopping')
        self.assertEqual(r.packets[-1][8],0)
        self.now+=2.6;c.tick();self.assertEqual(c.state,'disconnected');self.assertTrue(r.cleared)
    def test_disconnect_cancels_pairing(self):
        c=Controller(Radio(),CAR,True,lambda:10)
        c.action('connect','client-one',1);c.action('disconnect','client-one',2);c.tick()
        self.assertEqual(c.state,'stopping')
        self.assertEqual(c.last_payload[1],7)

    def discovery(self, target=None):
        self.now=10
        r=Radio();c=Controller(r,target,clock=lambda:self.now)
        c.action('connect','client-one',1);c.tick()
        return c,r

    def reply(self, c, car, checksum=None):
        b=bytearray(19)
        b[:2]=b'\x04\x0a';b[2:5]=car;b[5:8]=c.identity
        if checksum is None:
            checksum=0xe9
            for value in b[:18]:checksum^=value
        b[18]=checksum
        return bytes(b)

    def finish_discovery(self, c):
        c.tick();self.now+=1.6;c.tick()

    def test_discovers_different_car_without_known_id(self):
        c,r=self.discovery();other=bytes.fromhex('aabbcc')
        r.replies=[self.reply(c,other)];self.finish_discovery(c)
        self.assertEqual(c.state,'ready');self.assertEqual(c.car,other)
        self.assertEqual(r.packets[-1][2:5],other)
        self.assertEqual(r.packets[-1][8:11],b'\0\0\0')

    def test_multiple_cars_require_selection_and_only_selected_id_is_controlled(self):
        c,r=self.discovery();other=bytes.fromhex('aabbcc')
        r.replies=[self.reply(c,CAR),self.reply(c,other)]
        self.finish_discovery(c)
        self.assertEqual(c.state,'selecting');self.assertIsNone(c.car)
        self.assertTrue(all(b[1]==6 for b in r.packets))
        with self.assertRaises(ValueError):c.action('control','client-one',2,{'throttle':1})
        with self.assertRaises(ValueError):c.action('select','client-one',3,car_id=b'\x01\x02\x03')
        with self.assertRaises(ValueError):c.action('select','another-tab',4,car_id=other)
        c.action('select','client-one',5,car_id=other)
        c.action('control','client-one',6,{'throttle':1});c.tick()
        self.assertEqual(r.packets[-1][2:5],other);self.assertEqual(r.packets[-1][8],1)

    def test_discovery_rejects_stale_corrupt_and_unrelated_responses(self):
        c,r=self.discovery()
        good=self.reply(c,CAR)
        stale=Controller(Radio());stale.identity=b'old'
        # Stale identity, truncated length, and wrong opcode (0x07 instead of 0x0A) must be rejected
        r.replies=[self.reply(stale,CAR),good[:-1],b'\x04\x07'+good[2:]]
        self.finish_discovery(c)
        self.assertEqual(c.state,'pairing');self.assertFalse(c.candidates)

    def test_discovery_accepts_responses_with_different_checksum(self):
        # As observed live with car AE 96 C4 and confirmed in calDataIsTrue disassembly:
        # car responses are validated by identity echo and opcode, not checksum.
        c,r=self.discovery()
        other_checksum_reply=self.reply(c,CAR,checksum=0x35)
        r.replies=[other_checksum_reply]
        self.finish_discovery(c)
        self.assertEqual(c.state,'ready');self.assertEqual(c.car,CAR)

    def test_optional_filter_is_still_respected(self):
        c,r=self.discovery(CAR)
        r.replies=[self.reply(c,bytes.fromhex('aabbcc'))];self.finish_discovery(c)
        self.assertFalse(c.candidates);self.assertEqual(c.state,'pairing')

    def test_new_search_forgets_previous_car_and_responses(self):
        c,r=self.discovery();r.replies=[self.reply(c,CAR)];self.finish_discovery(c)
        old_identity=c.identity
        c.action('disconnect','client-one',2);self.now+=3;c.tick()
        c.action('connect','client-one',3);c.tick()
        self.assertNotEqual(c.identity,old_identity);self.assertIsNone(c.car)
        self.assertFalse(c.candidates);self.assertEqual(c.state,'pairing')

    def test_cancel_discovery_sends_no_control_to_unknown_destination(self):
        c,r=self.discovery();c.action('disconnect','client-one',2);c.tick()
        self.assertEqual(c.state,'disconnected');self.assertTrue(r.cleared)
        self.assertTrue(all(b[1]==6 for b in r.packets))

    def test_selection_expires_without_releasing_motion(self):
        c,r=self.discovery();r.replies=[self.reply(c,CAR),self.reply(c,bytes.fromhex('aabbcc'))]
        self.finish_discovery(c);self.now+=31;c.tick()
        self.assertEqual(c.state,'error');self.assertTrue(r.cleared)
        self.assertTrue(all(b[1]==6 for b in r.packets))

if __name__=='__main__':unittest.main()
