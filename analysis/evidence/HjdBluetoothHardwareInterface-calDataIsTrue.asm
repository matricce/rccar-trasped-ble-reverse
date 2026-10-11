System.Boolean calDataIsTrue(System.Byte[] codes, System.Byte machine_type, System.Byte revice_duima, System.Byte machine_a, System.Byte machine_b, System.Byte machine_c)


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000e19610 <__start_il2cpp@@Base+0x7728>:
  e19610:	f81f0ffe 	str	x30, [sp, #-16]!
  e19614:	b40004a0 	cbz	x0, e196a8 <__start_il2cpp@@Base+0x77c0>
  e19618:	f9400c08 	ldr	x8, [x0, #24]
  e1961c:	b40003e8 	cbz	x8, e19698 <__start_il2cpp@@Base+0x77b0>
  e19620:	34000428 	cbz	w8, e196a4 <__start_il2cpp@@Base+0x77bc>
  e19624:	39408009 	ldrb	w9, [x0, #32]
  e19628:	7100593f 	cmp	w9, #0x16
  e1962c:	54000361 	b.ne	e19698 <__start_il2cpp@@Base+0x77b0>  // b.any
  e19630:	7100111f 	cmp	w8, #0x4
  e19634:	54000389 	b.ls	e196a4 <__start_il2cpp@@Base+0x77bc>  // b.plast
  e19638:	39409009 	ldrb	w9, [x0, #36]
  e1963c:	6b21013f 	cmp	w9, w1, uxtb
  e19640:	540002c1 	b.ne	e19698 <__start_il2cpp@@Base+0x77b0>  // b.any
  e19644:	7100151f 	cmp	w8, #0x5
  e19648:	540002e9 	b.ls	e196a4 <__start_il2cpp@@Base+0x77bc>  // b.plast
  e1964c:	39409409 	ldrb	w9, [x0, #37]
  e19650:	6b22013f 	cmp	w9, w2, uxtb
  e19654:	54000221 	b.ne	e19698 <__start_il2cpp@@Base+0x77b0>  // b.any
  e19658:	7100251f 	cmp	w8, #0x9
  e1965c:	54000249 	b.ls	e196a4 <__start_il2cpp@@Base+0x77bc>  // b.plast
  e19660:	3940a409 	ldrb	w9, [x0, #41]
  e19664:	6b23013f 	cmp	w9, w3, uxtb
  e19668:	54000181 	b.ne	e19698 <__start_il2cpp@@Base+0x77b0>  // b.any
  e1966c:	7100291f 	cmp	w8, #0xa
  e19670:	540001a9 	b.ls	e196a4 <__start_il2cpp@@Base+0x77bc>  // b.plast
  e19674:	3940a809 	ldrb	w9, [x0, #42]
  e19678:	6b24013f 	cmp	w9, w4, uxtb
  e1967c:	540000e1 	b.ne	e19698 <__start_il2cpp@@Base+0x77b0>  // b.any
  e19680:	71002d1f 	cmp	w8, #0xb
  e19684:	54000109 	b.ls	e196a4 <__start_il2cpp@@Base+0x77bc>  // b.plast
  e19688:	3940ac08 	ldrb	w8, [x0, #43]
  e1968c:	6b25011f 	cmp	w8, w5, uxtb
  e19690:	1a9f17e0 	cset	w0, eq	// eq = none
  e19694:	14000002 	b	e1969c <__start_il2cpp@@Base+0x77b4>
  e19698:	2a1f03e0 	mov	w0, wzr
  e1969c:	f84107fe 	ldr	x30, [sp], #16
  e196a0:	d65f03c0 	ret
  e196a4:	97fd5a88 	bl	d700c4 <JNI_OnUnload@@Base+0x17d10>
  e196a8:	97fd5a85 	bl	d700bc <JNI_OnUnload@@Base+0x17d08>
