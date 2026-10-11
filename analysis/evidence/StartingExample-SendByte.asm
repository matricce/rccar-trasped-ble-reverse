System.Void SendByte(System.Byte[] value)


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000f94514 <__start_il2cpp@@Base+0x18262c>:
  f94514:	f81b0ffe 	str	x30, [sp, #-80]!
  f94518:	a90167fa 	stp	x26, x25, [sp, #16]
  f9451c:	a9025ff8 	stp	x24, x23, [sp, #32]
  f94520:	a90357f6 	stp	x22, x21, [sp, #48]
  f94524:	a9044ff4 	stp	x20, x19, [sp, #64]
  f94528:	f0009215 	adrp	x21, 21d7000 <__cxa_unexpected_handler@@Base+0x460>
  f9452c:	b0008734 	adrp	x20, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  f94530:	395876a8 	ldrb	w8, [x21, #1565]
  f94534:	f9450a94 	ldr	x20, [x20, #2576]
  f94538:	aa0003f3 	mov	x19, x0
  f9453c:	370001e8 	tbnz	w8, #0, f94578 <__start_il2cpp@@Base+0x182690>
  f94540:	b0008720 	adrp	x0, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  f94544:	f9450c00 	ldr	x0, [x0, #2584]
  f94548:	97f76e48 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f9454c:	b0008720 	adrp	x0, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  f94550:	f9450800 	ldr	x0, [x0, #2576]
  f94554:	97f76e45 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f94558:	f0008740 	adrp	x0, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f9455c:	f940f400 	ldr	x0, [x0, #488]
  f94560:	97f76e42 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f94564:	f0008740 	adrp	x0, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f94568:	f940d000 	ldr	x0, [x0, #416]
  f9456c:	97f76e3f 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f94570:	52800028 	mov	w8, #0x1                   	// #1
  f94574:	391876a8 	strb	w8, [x21, #1565]
  f94578:	f9400280 	ldr	x0, [x20]
  f9457c:	b940e008 	ldr	w8, [x0, #224]
  f94580:	35000068 	cbnz	w8, f9458c <__start_il2cpp@@Base+0x1826a4>
  f94584:	97f76e86 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  f94588:	f9400280 	ldr	x0, [x20]
  f9458c:	f9405c08 	ldr	x8, [x0, #184]
  f94590:	39414509 	ldrb	w9, [x8, #81]
  f94594:	34000729 	cbz	w9, f94678 <__start_il2cpp@@Base+0x182790>
  f94598:	b940e009 	ldr	w9, [x0, #224]
  f9459c:	35000089 	cbnz	w9, f945ac <__start_il2cpp@@Base+0x1826c4>
  f945a0:	97f76e7f 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  f945a4:	f9400288 	ldr	x8, [x20]
  f945a8:	f9405d08 	ldr	x8, [x8, #184]
  f945ac:	3901451f 	strb	wzr, [x8, #81]
  f945b0:	b4000713 	cbz	x19, f94690 <__start_il2cpp@@Base+0x1827a8>
  f945b4:	f000875a 	adrp	x26, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f945b8:	f940d35a 	ldr	x26, [x26, #416]
  f945bc:	f9403114 	ldr	x20, [x8, #96]
  f945c0:	a9415516 	ldp	x22, x21, [x8, #16]
  f945c4:	f9400340 	ldr	x0, [x26]
  f945c8:	b940e009 	ldr	w9, [x0, #224]
  f945cc:	35000069 	cbnz	w9, f945d8 <__start_il2cpp@@Base+0x1826f0>
  f945d0:	97f76e73 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  f945d4:	f9400340 	ldr	x0, [x26]
  f945d8:	f9405c08 	ldr	x8, [x0, #184]
  f945dc:	b9401a77 	ldr	w23, [x19, #24]
  f945e0:	f9403518 	ldr	x24, [x8, #104]
  f945e4:	b50002f8 	cbnz	x24, f94640 <__start_il2cpp@@Base+0x182758>
  f945e8:	b940e008 	ldr	w8, [x0, #224]
  f945ec:	35000068 	cbnz	w8, f945f8 <__start_il2cpp@@Base+0x182710>
  f945f0:	97f76e6b 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  f945f4:	f9400340 	ldr	x0, [x26]
  f945f8:	b0008729 	adrp	x9, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  f945fc:	f9405c08 	ldr	x8, [x0, #184]
  f94600:	f9450d29 	ldr	x9, [x9, #2584]
  f94604:	f9400119 	ldr	x25, [x8]
  f94608:	f9400120 	ldr	x0, [x9]
  f9460c:	97f76ea9 	bl	d700b0 <JNI_OnUnload@@Base+0x17cfc>
  f94610:	f0008748 	adrp	x8, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f94614:	f940f508 	ldr	x8, [x8, #488]
  f94618:	aa1903e1 	mov	x1, x25
  f9461c:	aa1f03e3 	mov	x3, xzr
  f94620:	aa0003f8 	mov	x24, x0
  f94624:	f9400102 	ldr	x2, [x8]
  f94628:	940bfae6 	bl	12931c0 <__start_il2cpp@@Base+0x4812d8>
  f9462c:	f9400348 	ldr	x8, [x26]
  f94630:	aa1803e1 	mov	x1, x24
  f94634:	f9405d00 	ldr	x0, [x8, #184]
  f94638:	f8068c18 	str	x24, [x0, #104]!
  f9463c:	97f76df6 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  f94640:	aa1403e0 	mov	x0, x20
  f94644:	aa1603e1 	mov	x1, x22
  f94648:	aa1503e2 	mov	x2, x21
  f9464c:	aa1303e3 	mov	x3, x19
  f94650:	2a1703e4 	mov	w4, w23
  f94654:	aa1803e6 	mov	x6, x24
  f94658:	a9444ff4 	ldp	x20, x19, [sp, #64]
  f9465c:	a94357f6 	ldp	x22, x21, [sp, #48]
  f94660:	a9425ff8 	ldp	x24, x23, [sp, #32]
  f94664:	a94167fa 	ldp	x26, x25, [sp, #16]
  f94668:	52800025 	mov	w5, #0x1                   	// #1
  f9466c:	aa1f03e7 	mov	x7, xzr
  f94670:	f84507fe 	ldr	x30, [sp], #80
  f94674:	17fa0628 	b	e15f14 <__start_il2cpp@@Base+0x402c>
  f94678:	a9444ff4 	ldp	x20, x19, [sp, #64]
  f9467c:	a94357f6 	ldp	x22, x21, [sp, #48]
  f94680:	a9425ff8 	ldp	x24, x23, [sp, #32]
  f94684:	a94167fa 	ldp	x26, x25, [sp, #16]
  f94688:	f84507fe 	ldr	x30, [sp], #80
  f9468c:	d65f03c0 	ret
  f94690:	97f76e8b 	bl	d700bc <JNI_OnUnload@@Base+0x17d08>
