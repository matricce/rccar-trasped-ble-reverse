System.Void sendData(System.Byte[] data)


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000f94694 <__start_il2cpp@@Base+0x1827ac>:
  f94694:	f81b0ffe 	str	x30, [sp, #-80]!
  f94698:	a90167fa 	stp	x26, x25, [sp, #16]
  f9469c:	a9025ff8 	stp	x24, x23, [sp, #32]
  f946a0:	a90357f6 	stp	x22, x21, [sp, #48]
  f946a4:	a9044ff4 	stp	x20, x19, [sp, #64]
  f946a8:	f0009215 	adrp	x21, 21d7000 <__cxa_unexpected_handler@@Base+0x460>
  f946ac:	b0008734 	adrp	x20, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  f946b0:	39587aa8 	ldrb	w8, [x21, #1566]
  f946b4:	f9450a94 	ldr	x20, [x20, #2576]
  f946b8:	aa0003f3 	mov	x19, x0
  f946bc:	370001e8 	tbnz	w8, #0, f946f8 <__start_il2cpp@@Base+0x182810>
  f946c0:	b0008720 	adrp	x0, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  f946c4:	f9450c00 	ldr	x0, [x0, #2584]
  f946c8:	97f76de8 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f946cc:	b0008720 	adrp	x0, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  f946d0:	f9450800 	ldr	x0, [x0, #2576]
  f946d4:	97f76de5 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f946d8:	f0008740 	adrp	x0, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f946dc:	f940f800 	ldr	x0, [x0, #496]
  f946e0:	97f76de2 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f946e4:	f0008740 	adrp	x0, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f946e8:	f940d000 	ldr	x0, [x0, #416]
  f946ec:	97f76ddf 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f946f0:	52800028 	mov	w8, #0x1                   	// #1
  f946f4:	39187aa8 	strb	w8, [x21, #1566]
  f946f8:	f9400280 	ldr	x0, [x20]
  f946fc:	b940e008 	ldr	w8, [x0, #224]
  f94700:	35000068 	cbnz	w8, f9470c <__start_il2cpp@@Base+0x182824>
  f94704:	97f76e26 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  f94708:	f9400280 	ldr	x0, [x20]
  f9470c:	b4000673 	cbz	x19, f947d8 <__start_il2cpp@@Base+0x1828f0>
  f94710:	f000875a 	adrp	x26, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f94714:	f940d35a 	ldr	x26, [x26, #416]
  f94718:	f9405c08 	ldr	x8, [x0, #184]
  f9471c:	f9400340 	ldr	x0, [x26]
  f94720:	f9403114 	ldr	x20, [x8, #96]
  f94724:	a9415516 	ldp	x22, x21, [x8, #16]
  f94728:	b940e009 	ldr	w9, [x0, #224]
  f9472c:	35000069 	cbnz	w9, f94738 <__start_il2cpp@@Base+0x182850>
  f94730:	97f76e1b 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  f94734:	f9400340 	ldr	x0, [x26]
  f94738:	f9405c08 	ldr	x8, [x0, #184]
  f9473c:	f9400e77 	ldr	x23, [x19, #24]
  f94740:	f9403918 	ldr	x24, [x8, #112]
  f94744:	b50002f8 	cbnz	x24, f947a0 <__start_il2cpp@@Base+0x1828b8>
  f94748:	b940e008 	ldr	w8, [x0, #224]
  f9474c:	35000068 	cbnz	w8, f94758 <__start_il2cpp@@Base+0x182870>
  f94750:	97f76e13 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  f94754:	f9400340 	ldr	x0, [x26]
  f94758:	b0008729 	adrp	x9, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  f9475c:	f9405c08 	ldr	x8, [x0, #184]
  f94760:	f9450d29 	ldr	x9, [x9, #2584]
  f94764:	f9400119 	ldr	x25, [x8]
  f94768:	f9400120 	ldr	x0, [x9]
  f9476c:	97f76e51 	bl	d700b0 <JNI_OnUnload@@Base+0x17cfc>
  f94770:	f0008748 	adrp	x8, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f94774:	f940f908 	ldr	x8, [x8, #496]
  f94778:	aa1903e1 	mov	x1, x25
  f9477c:	aa1f03e3 	mov	x3, xzr
  f94780:	aa0003f8 	mov	x24, x0
  f94784:	f9400102 	ldr	x2, [x8]
  f94788:	940bfa8e 	bl	12931c0 <__start_il2cpp@@Base+0x4812d8>
  f9478c:	f9400348 	ldr	x8, [x26]
  f94790:	aa1803e1 	mov	x1, x24
  f94794:	f9405d00 	ldr	x0, [x8, #184]
  f94798:	f8070c18 	str	x24, [x0, #112]!
  f9479c:	97f76d9e 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  f947a0:	aa1403e0 	mov	x0, x20
  f947a4:	aa1603e1 	mov	x1, x22
  f947a8:	aa1503e2 	mov	x2, x21
  f947ac:	aa1303e3 	mov	x3, x19
  f947b0:	2a1703e4 	mov	w4, w23
  f947b4:	aa1803e6 	mov	x6, x24
  f947b8:	a9444ff4 	ldp	x20, x19, [sp, #64]
  f947bc:	a94357f6 	ldp	x22, x21, [sp, #48]
  f947c0:	a9425ff8 	ldp	x24, x23, [sp, #32]
  f947c4:	a94167fa 	ldp	x26, x25, [sp, #16]
  f947c8:	2a1f03e5 	mov	w5, wzr
  f947cc:	aa1f03e7 	mov	x7, xzr
  f947d0:	f84507fe 	ldr	x30, [sp], #80
  f947d4:	17fa05d0 	b	e15f14 <__start_il2cpp@@Base+0x402c>
  f947d8:	97f76e39 	bl	d700bc <JNI_OnUnload@@Base+0x17d08>
