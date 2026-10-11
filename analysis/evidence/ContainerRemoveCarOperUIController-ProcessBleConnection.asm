System.Void ProcessBleConnection()


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000ee6418 <__start_il2cpp@@Base+0xd4530>:
  ee6418:	d10103ff 	sub	sp, sp, #0x40
  ee641c:	a90257fe 	stp	x30, x21, [sp, #32]
  ee6420:	a9034ff4 	stp	x20, x19, [sp, #48]
  ee6424:	b0009794 	adrp	x20, 21d7000 <__cxa_unexpected_handler@@Base+0x460>
  ee6428:	d0008c95 	adrp	x21, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee642c:	39461a88 	ldrb	w8, [x20, #390]
  ee6430:	f946cab5 	ldr	x21, [x21, #3472]
  ee6434:	aa0003f3 	mov	x19, x0
  ee6438:	370000c8 	tbnz	w8, #0, ee6450 <__start_il2cpp@@Base+0xd4568>
  ee643c:	d0008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee6440:	f946c800 	ldr	x0, [x0, #3472]
  ee6444:	97fa2689 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee6448:	52800028 	mov	w8, #0x1                   	// #1
  ee644c:	39061a88 	strb	w8, [x20, #390]
  ee6450:	f94002a0 	ldr	x0, [x21]
  ee6454:	52800141 	mov	w1, #0xa                   	// #10
  ee6458:	390073ff 	strb	wzr, [sp, #28]
  ee645c:	390063ff 	strb	wzr, [sp, #24]
  ee6460:	390053ff 	strb	wzr, [sp, #20]
  ee6464:	390043ff 	strb	wzr, [sp, #16]
  ee6468:	390033ff 	strb	wzr, [sp, #12]
  ee646c:	97fa26a8 	bl	d6ff0c <JNI_OnUnload@@Base+0x17b58>
  ee6470:	aa1303f4 	mov	x20, x19
  ee6474:	f8028e80 	str	x0, [x20, #40]!
  ee6478:	aa0003e1 	mov	x1, x0
  ee647c:	aa1403e0 	mov	x0, x20
  ee6480:	97fa2665 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  ee6484:	910073e1 	add	x1, sp, #0x1c
  ee6488:	910063e2 	add	x2, sp, #0x18
  ee648c:	910053e3 	add	x3, sp, #0x14
  ee6490:	910043e4 	add	x4, sp, #0x10
  ee6494:	910033e5 	add	x5, sp, #0xc
  ee6498:	aa1303e0 	mov	x0, x19
  ee649c:	94000951 	bl	ee89e0 <__start_il2cpp@@Base+0xd6af8>
  ee64a0:	f9400288 	ldr	x8, [x20]
  ee64a4:	b4000788 	cbz	x8, ee6594 <__start_il2cpp@@Base+0xd46ac>
  ee64a8:	b9401909 	ldr	w9, [x8, #24]
  ee64ac:	34000769 	cbz	w9, ee6598 <__start_il2cpp@@Base+0xd46b0>
  ee64b0:	394073e9 	ldrb	w9, [sp, #28]
  ee64b4:	39008109 	strb	w9, [x8, #32]
  ee64b8:	f9400288 	ldr	x8, [x20]
  ee64bc:	b40006c8 	cbz	x8, ee6594 <__start_il2cpp@@Base+0xd46ac>
  ee64c0:	b9401909 	ldr	w9, [x8, #24]
  ee64c4:	7100053f 	cmp	w9, #0x1
  ee64c8:	54000689 	b.ls	ee6598 <__start_il2cpp@@Base+0xd46b0>  // b.plast
  ee64cc:	394063e9 	ldrb	w9, [sp, #24]
  ee64d0:	39008509 	strb	w9, [x8, #33]
  ee64d4:	f9400288 	ldr	x8, [x20]
  ee64d8:	b40005e8 	cbz	x8, ee6594 <__start_il2cpp@@Base+0xd46ac>
  ee64dc:	b9401909 	ldr	w9, [x8, #24]
  ee64e0:	7100093f 	cmp	w9, #0x2
  ee64e4:	540005a9 	b.ls	ee6598 <__start_il2cpp@@Base+0xd46b0>  // b.plast
  ee64e8:	394053e9 	ldrb	w9, [sp, #20]
  ee64ec:	39008909 	strb	w9, [x8, #34]
  ee64f0:	f9400288 	ldr	x8, [x20]
  ee64f4:	b4000508 	cbz	x8, ee6594 <__start_il2cpp@@Base+0xd46ac>
  ee64f8:	b9401909 	ldr	w9, [x8, #24]
  ee64fc:	71000d3f 	cmp	w9, #0x3
  ee6500:	540004c9 	b.ls	ee6598 <__start_il2cpp@@Base+0xd46b0>  // b.plast
  ee6504:	394043e9 	ldrb	w9, [sp, #16]
  ee6508:	39008d09 	strb	w9, [x8, #35]
  ee650c:	f9400288 	ldr	x8, [x20]
  ee6510:	b4000428 	cbz	x8, ee6594 <__start_il2cpp@@Base+0xd46ac>
  ee6514:	b9401909 	ldr	w9, [x8, #24]
  ee6518:	7100113f 	cmp	w9, #0x4
  ee651c:	540003e9 	b.ls	ee6598 <__start_il2cpp@@Base+0xd46b0>  // b.plast
  ee6520:	394033e9 	ldrb	w9, [sp, #12]
  ee6524:	39009109 	strb	w9, [x8, #36]
  ee6528:	f9400288 	ldr	x8, [x20]
  ee652c:	b4000348 	cbz	x8, ee6594 <__start_il2cpp@@Base+0xd46ac>
  ee6530:	b9401909 	ldr	w9, [x8, #24]
  ee6534:	7100193f 	cmp	w9, #0x6
  ee6538:	54000309 	b.ls	ee6598 <__start_il2cpp@@Base+0xd46b0>  // b.plast
  ee653c:	b9404a69 	ldr	w9, [x19, #72]
  ee6540:	39009909 	strb	w9, [x8, #38]
  ee6544:	39422668 	ldrb	w8, [x19, #137]
  ee6548:	34000108 	cbz	w8, ee6568 <__start_il2cpp@@Base+0xd4680>
  ee654c:	f94002a0 	ldr	x0, [x21]
  ee6550:	52800141 	mov	w1, #0xa                   	// #10
  ee6554:	97fa266e 	bl	d6ff0c <JNI_OnUnload@@Base+0x17b58>
  ee6558:	aa0003e1 	mov	x1, x0
  ee655c:	f9000280 	str	x0, [x20]
  ee6560:	aa1403e0 	mov	x0, x20
  ee6564:	97fa262c 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  ee6568:	a9428660 	ldp	x0, x1, [x19, #40]
  ee656c:	aa1f03e2 	mov	x2, xzr
  ee6570:	94031991 	bl	facbb4 <__start_il2cpp@@Base+0x19accc>
  ee6574:	aa1303e0 	mov	x0, x19
  ee6578:	94000ae7 	bl	ee9114 <__start_il2cpp@@Base+0xd722c>
  ee657c:	aa1303e0 	mov	x0, x19
  ee6580:	a9434ff4 	ldp	x20, x19, [sp, #48]
  ee6584:	a94257fe 	ldp	x30, x21, [sp, #32]
  ee6588:	52800041 	mov	w1, #0x2                   	// #2
  ee658c:	910103ff 	add	sp, sp, #0x40
  ee6590:	14000b30 	b	ee9250 <__start_il2cpp@@Base+0xd7368>
  ee6594:	97fa26ca 	bl	d700bc <JNI_OnUnload@@Base+0x17d08>
  ee6598:	97fa26cb 	bl	d700c4 <JNI_OnUnload@@Base+0x17d10>
