System.Void ProcessBroadcastConnection()


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000ee659c <__start_il2cpp@@Base+0xd46b4>:
  ee659c:	d10143ff 	sub	sp, sp, #0x50
  ee65a0:	a9025ffe 	stp	x30, x23, [sp, #32]
  ee65a4:	a90357f6 	stp	x22, x21, [sp, #48]
  ee65a8:	a9044ff4 	stp	x20, x19, [sp, #64]
  ee65ac:	b0009795 	adrp	x21, 21d7000 <__cxa_unexpected_handler@@Base+0x460>
  ee65b0:	d0008c94 	adrp	x20, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee65b4:	39461ea8 	ldrb	w8, [x21, #391]
  ee65b8:	f946ca94 	ldr	x20, [x20, #3472]
  ee65bc:	aa0003f3 	mov	x19, x0
  ee65c0:	370002a8 	tbnz	w8, #0, ee6614 <__start_il2cpp@@Base+0xd472c>
  ee65c4:	f0008c80 	adrp	x0, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee65c8:	f9450c00 	ldr	x0, [x0, #2584]
  ee65cc:	97fa2627 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee65d0:	d0008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee65d4:	f946c800 	ldr	x0, [x0, #3472]
  ee65d8:	97fa2624 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee65dc:	d0008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee65e0:	f946a000 	ldr	x0, [x0, #3392]
  ee65e4:	97fa2621 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee65e8:	d0008ca0 	adrp	x0, 207c000 <_ZTISt10bad_typeid@@Base+0x3db8>
  ee65ec:	f9432800 	ldr	x0, [x0, #1616]
  ee65f0:	97fa261e 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee65f4:	d0008ca0 	adrp	x0, 207c000 <_ZTISt10bad_typeid@@Base+0x3db8>
  ee65f8:	f9432c00 	ldr	x0, [x0, #1624]
  ee65fc:	97fa261b 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee6600:	d0008ca0 	adrp	x0, 207c000 <_ZTISt10bad_typeid@@Base+0x3db8>
  ee6604:	f9433000 	ldr	x0, [x0, #1632]
  ee6608:	97fa2618 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee660c:	52800028 	mov	w8, #0x1                   	// #1
  ee6610:	39061ea8 	strb	w8, [x21, #391]
  ee6614:	f9400280 	ldr	x0, [x20]
  ee6618:	52800141 	mov	w1, #0xa                   	// #10
  ee661c:	390073ff 	strb	wzr, [sp, #28]
  ee6620:	390063ff 	strb	wzr, [sp, #24]
  ee6624:	390053ff 	strb	wzr, [sp, #20]
  ee6628:	390043ff 	strb	wzr, [sp, #16]
  ee662c:	390033ff 	strb	wzr, [sp, #12]
  ee6630:	97fa2637 	bl	d6ff0c <JNI_OnUnload@@Base+0x17b58>
  ee6634:	aa1303f4 	mov	x20, x19
  ee6638:	f8028e80 	str	x0, [x20, #40]!
  ee663c:	aa0003e1 	mov	x1, x0
  ee6640:	aa1403e0 	mov	x0, x20
  ee6644:	97fa25f4 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  ee6648:	910073e1 	add	x1, sp, #0x1c
  ee664c:	910063e2 	add	x2, sp, #0x18
  ee6650:	910053e3 	add	x3, sp, #0x14
  ee6654:	910043e4 	add	x4, sp, #0x10
  ee6658:	910033e5 	add	x5, sp, #0xc
  ee665c:	aa1303e0 	mov	x0, x19
  ee6660:	940008e0 	bl	ee89e0 <__start_il2cpp@@Base+0xd6af8>
  ee6664:	f9400288 	ldr	x8, [x20]
  ee6668:	b40012c8 	cbz	x8, ee68c0 <__start_il2cpp@@Base+0xd49d8>
  ee666c:	b9401909 	ldr	w9, [x8, #24]
  ee6670:	340012a9 	cbz	w9, ee68c4 <__start_il2cpp@@Base+0xd49dc>
  ee6674:	394073e9 	ldrb	w9, [sp, #28]
  ee6678:	39008109 	strb	w9, [x8, #32]
  ee667c:	f9400288 	ldr	x8, [x20]
  ee6680:	b4001208 	cbz	x8, ee68c0 <__start_il2cpp@@Base+0xd49d8>
  ee6684:	b9401909 	ldr	w9, [x8, #24]
  ee6688:	7100053f 	cmp	w9, #0x1
  ee668c:	540011c9 	b.ls	ee68c4 <__start_il2cpp@@Base+0xd49dc>  // b.plast
  ee6690:	394063e9 	ldrb	w9, [sp, #24]
  ee6694:	39008509 	strb	w9, [x8, #33]
  ee6698:	f9400288 	ldr	x8, [x20]
  ee669c:	b4001128 	cbz	x8, ee68c0 <__start_il2cpp@@Base+0xd49d8>
  ee66a0:	b9401909 	ldr	w9, [x8, #24]
  ee66a4:	7100093f 	cmp	w9, #0x2
  ee66a8:	540010e9 	b.ls	ee68c4 <__start_il2cpp@@Base+0xd49dc>  // b.plast
  ee66ac:	394053e9 	ldrb	w9, [sp, #20]
  ee66b0:	39008909 	strb	w9, [x8, #34]
  ee66b4:	f9400288 	ldr	x8, [x20]
  ee66b8:	b4001048 	cbz	x8, ee68c0 <__start_il2cpp@@Base+0xd49d8>
  ee66bc:	b9401909 	ldr	w9, [x8, #24]
  ee66c0:	71000d3f 	cmp	w9, #0x3
  ee66c4:	54001009 	b.ls	ee68c4 <__start_il2cpp@@Base+0xd49dc>  // b.plast
  ee66c8:	394043e9 	ldrb	w9, [sp, #16]
  ee66cc:	39008d09 	strb	w9, [x8, #35]
  ee66d0:	f9400288 	ldr	x8, [x20]
  ee66d4:	b4000f68 	cbz	x8, ee68c0 <__start_il2cpp@@Base+0xd49d8>
  ee66d8:	b9401909 	ldr	w9, [x8, #24]
  ee66dc:	7100113f 	cmp	w9, #0x4
  ee66e0:	54000f29 	b.ls	ee68c4 <__start_il2cpp@@Base+0xd49dc>  // b.plast
  ee66e4:	394033e9 	ldrb	w9, [sp, #12]
  ee66e8:	39009109 	strb	w9, [x8, #36]
  ee66ec:	f9400288 	ldr	x8, [x20]
  ee66f0:	b4000e88 	cbz	x8, ee68c0 <__start_il2cpp@@Base+0xd49d8>
  ee66f4:	b9401909 	ldr	w9, [x8, #24]
  ee66f8:	7100193f 	cmp	w9, #0x6
  ee66fc:	54000e49 	b.ls	ee68c4 <__start_il2cpp@@Base+0xd49dc>  // b.plast
  ee6700:	b9404a69 	ldr	w9, [x19, #72]
  ee6704:	aa1f03e2 	mov	x2, xzr
  ee6708:	39009909 	strb	w9, [x8, #38]
  ee670c:	a9428660 	ldp	x0, x1, [x19, #40]
  ee6710:	94031929 	bl	facbb4 <__start_il2cpp@@Base+0x19accc>
  ee6714:	37000220 	tbnz	w0, #0, ee6758 <__start_il2cpp@@Base+0xd4870>
  ee6718:	b9404268 	ldr	w8, [x19, #64]
  ee671c:	350001e8 	cbnz	w8, ee6758 <__start_il2cpp@@Base+0xd4870>
  ee6720:	a9428660 	ldp	x0, x1, [x19, #40]
  ee6724:	aa1f03e2 	mov	x2, xzr
  ee6728:	94031960 	bl	facca8 <__start_il2cpp@@Base+0x19adc0>
  ee672c:	aa1303e0 	mov	x0, x19
  ee6730:	940006e2 	bl	ee82b8 <__start_il2cpp@@Base+0xd63d0>
  ee6734:	aa1303f4 	mov	x20, x19
  ee6738:	f8020e80 	str	x0, [x20, #32]!
  ee673c:	aa0003e1 	mov	x1, x0
  ee6740:	aa1403e0 	mov	x0, x20
  ee6744:	97fa25b4 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  ee6748:	52800028 	mov	w8, #0x1                   	// #1
  ee674c:	52800069 	mov	w9, #0x3                   	// #3
  ee6750:	3901aa88 	strb	w8, [x20, #106]
  ee6754:	b9002289 	str	w9, [x20, #32]
  ee6758:	39422a68 	ldrb	w8, [x19, #138]
  ee675c:	34000a48 	cbz	w8, ee68a4 <__start_il2cpp@@Base+0xd49bc>
  ee6760:	d0008cb6 	adrp	x22, 207c000 <_ZTISt10bad_typeid@@Base+0x3db8>
  ee6764:	f94332d6 	ldr	x22, [x22, #1632]
  ee6768:	39022a7f 	strb	wzr, [x19, #138]
  ee676c:	f94002c0 	ldr	x0, [x22]
  ee6770:	b940e008 	ldr	w8, [x0, #224]
  ee6774:	35000068 	cbnz	w8, ee6780 <__start_il2cpp@@Base+0xd4898>
  ee6778:	97fa2609 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee677c:	f94002c0 	ldr	x0, [x22]
  ee6780:	f9405c08 	ldr	x8, [x0, #184]
  ee6784:	d0008c97 	adrp	x23, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee6788:	f9401d14 	ldr	x20, [x8, #56]
  ee678c:	f946a2f7 	ldr	x23, [x23, #3392]
  ee6790:	b50002f4 	cbnz	x20, ee67ec <__start_il2cpp@@Base+0xd4904>
  ee6794:	b940e008 	ldr	w8, [x0, #224]
  ee6798:	35000068 	cbnz	w8, ee67a4 <__start_il2cpp@@Base+0xd48bc>
  ee679c:	97fa2600 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee67a0:	f94002c0 	ldr	x0, [x22]
  ee67a4:	f0008c89 	adrp	x9, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee67a8:	f9405c08 	ldr	x8, [x0, #184]
  ee67ac:	f9450d29 	ldr	x9, [x9, #2584]
  ee67b0:	f9400115 	ldr	x21, [x8]
  ee67b4:	f9400120 	ldr	x0, [x9]
  ee67b8:	97fa263e 	bl	d700b0 <JNI_OnUnload@@Base+0x17cfc>
  ee67bc:	d0008ca8 	adrp	x8, 207c000 <_ZTISt10bad_typeid@@Base+0x3db8>
  ee67c0:	f9432908 	ldr	x8, [x8, #1616]
  ee67c4:	aa1503e1 	mov	x1, x21
  ee67c8:	aa1f03e3 	mov	x3, xzr
  ee67cc:	aa0003f4 	mov	x20, x0
  ee67d0:	f9400102 	ldr	x2, [x8]
  ee67d4:	940eb27b 	bl	12931c0 <__start_il2cpp@@Base+0x4812d8>
  ee67d8:	f94002c8 	ldr	x8, [x22]
  ee67dc:	aa1403e1 	mov	x1, x20
  ee67e0:	f9405d00 	ldr	x0, [x8, #184]
  ee67e4:	f8038c14 	str	x20, [x0, #56]!
  ee67e8:	97fa258b 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  ee67ec:	f94002e0 	ldr	x0, [x23]
  ee67f0:	b940e008 	ldr	w8, [x0, #224]
  ee67f4:	35000048 	cbnz	w8, ee67fc <__start_il2cpp@@Base+0xd4914>
  ee67f8:	97fa25e9 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee67fc:	aa1403e0 	mov	x0, x20
  ee6800:	aa1f03e1 	mov	x1, xzr
  ee6804:	97fcca2b 	bl	e190b0 <__start_il2cpp@@Base+0x71c8>
  ee6808:	f94002c0 	ldr	x0, [x22]
  ee680c:	b940e008 	ldr	w8, [x0, #224]
  ee6810:	35000068 	cbnz	w8, ee681c <__start_il2cpp@@Base+0xd4934>
  ee6814:	97fa25e2 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee6818:	f94002c0 	ldr	x0, [x22]
  ee681c:	f9405c08 	ldr	x8, [x0, #184]
  ee6820:	f9402114 	ldr	x20, [x8, #64]
  ee6824:	b50002f4 	cbnz	x20, ee6880 <__start_il2cpp@@Base+0xd4998>
  ee6828:	b940e008 	ldr	w8, [x0, #224]
  ee682c:	35000068 	cbnz	w8, ee6838 <__start_il2cpp@@Base+0xd4950>
  ee6830:	97fa25db 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee6834:	f94002c0 	ldr	x0, [x22]
  ee6838:	f0008c89 	adrp	x9, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee683c:	f9405c08 	ldr	x8, [x0, #184]
  ee6840:	f9450d29 	ldr	x9, [x9, #2584]
  ee6844:	f9400115 	ldr	x21, [x8]
  ee6848:	f9400120 	ldr	x0, [x9]
  ee684c:	97fa2619 	bl	d700b0 <JNI_OnUnload@@Base+0x17cfc>
  ee6850:	d0008ca8 	adrp	x8, 207c000 <_ZTISt10bad_typeid@@Base+0x3db8>
  ee6854:	f9432d08 	ldr	x8, [x8, #1624]
  ee6858:	aa1503e1 	mov	x1, x21
  ee685c:	aa1f03e3 	mov	x3, xzr
  ee6860:	aa0003f4 	mov	x20, x0
  ee6864:	f9400102 	ldr	x2, [x8]
  ee6868:	940eb256 	bl	12931c0 <__start_il2cpp@@Base+0x4812d8>
  ee686c:	f94002c8 	ldr	x8, [x22]
  ee6870:	aa1403e1 	mov	x1, x20
  ee6874:	f9405d00 	ldr	x0, [x8, #184]
  ee6878:	f8040c14 	str	x20, [x0, #64]!
  ee687c:	97fa2566 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  ee6880:	f94002e0 	ldr	x0, [x23]
  ee6884:	f9401275 	ldr	x21, [x19, #32]
  ee6888:	b940e008 	ldr	w8, [x0, #224]
  ee688c:	35000048 	cbnz	w8, ee6894 <__start_il2cpp@@Base+0xd49ac>
  ee6890:	97fa25c3 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee6894:	aa1403e0 	mov	x0, x20
  ee6898:	aa1503e1 	mov	x1, x21
  ee689c:	aa1f03e2 	mov	x2, xzr
  ee68a0:	97fcc998 	bl	e18f00 <__start_il2cpp@@Base+0x7018>
  ee68a4:	aa1303e0 	mov	x0, x19
  ee68a8:	a9444ff4 	ldp	x20, x19, [sp, #64]
  ee68ac:	a94357f6 	ldp	x22, x21, [sp, #48]
  ee68b0:	a9425ffe 	ldp	x30, x23, [sp, #32]
  ee68b4:	52800181 	mov	w1, #0xc                   	// #12
  ee68b8:	910143ff 	add	sp, sp, #0x50
  ee68bc:	14000a65 	b	ee9250 <__start_il2cpp@@Base+0xd7368>
  ee68c0:	97fa25ff 	bl	d700bc <JNI_OnUnload@@Base+0x17d08>
  ee68c4:	97fa2600 	bl	d700c4 <JNI_OnUnload@@Base+0x17d10>
