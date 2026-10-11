System.Void .cctor()


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000f948c0 <__start_il2cpp@@Base+0x1829d8>:
  f948c0:	f81a0ffe 	str	x30, [sp, #-96]!
  f948c4:	a9016ffc 	stp	x28, x27, [sp, #16]
  f948c8:	a90267fa 	stp	x26, x25, [sp, #32]
  f948cc:	a9035ff8 	stp	x24, x23, [sp, #48]
  f948d0:	a90457f6 	stp	x22, x21, [sp, #64]
  f948d4:	a9054ff4 	stp	x20, x19, [sp, #80]
  f948d8:	f000921c 	adrp	x28, 21d7000 <__cxa_unexpected_handler@@Base+0x460>
  f948dc:	b0008734 	adrp	x20, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  f948e0:	f000875b 	adrp	x27, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f948e4:	f000875a 	adrp	x26, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f948e8:	f0008759 	adrp	x25, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f948ec:	f0008758 	adrp	x24, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f948f0:	f0008757 	adrp	x23, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f948f4:	90008736 	adrp	x22, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  f948f8:	f0008753 	adrp	x19, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f948fc:	90008735 	adrp	x21, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  f94900:	f9450a94 	ldr	x20, [x20, #2576]
  f94904:	f941037b 	ldr	x27, [x27, #512]
  f94908:	f941075a 	ldr	x26, [x26, #520]
  f9490c:	f9410b39 	ldr	x25, [x25, #528]
  f94910:	39588388 	ldrb	w8, [x28, #1568]
  f94914:	f9410f18 	ldr	x24, [x24, #536]
  f94918:	f94112f7 	ldr	x23, [x23, #544]
  f9491c:	f946cad6 	ldr	x22, [x22, #3472]
  f94920:	f9411673 	ldr	x19, [x19, #552]
  f94924:	f94506b5 	ldr	x21, [x21, #2568]
  f94928:	370003c8 	tbnz	w8, #0, f949a0 <__start_il2cpp@@Base+0x182ab8>
  f9492c:	90008720 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  f94930:	f946c800 	ldr	x0, [x0, #3472]
  f94934:	97f76d4d 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f94938:	b0008720 	adrp	x0, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  f9493c:	f9450800 	ldr	x0, [x0, #2576]
  f94940:	97f76d4a 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f94944:	f0008740 	adrp	x0, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f94948:	f9411400 	ldr	x0, [x0, #552]
  f9494c:	97f76d47 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f94950:	f0008740 	adrp	x0, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f94954:	f9410c00 	ldr	x0, [x0, #536]
  f94958:	97f76d44 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f9495c:	f0008740 	adrp	x0, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f94960:	f9410000 	ldr	x0, [x0, #512]
  f94964:	97f76d41 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f94968:	f0008740 	adrp	x0, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f9496c:	f9410800 	ldr	x0, [x0, #528]
  f94970:	97f76d3e 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f94974:	f0008740 	adrp	x0, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f94978:	f9410400 	ldr	x0, [x0, #520]
  f9497c:	97f76d3b 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f94980:	90008720 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  f94984:	f9450400 	ldr	x0, [x0, #2568]
  f94988:	97f76d38 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f9498c:	f0008740 	adrp	x0, 207f000 <_ZTISt10bad_typeid@@Base+0x6db8>
  f94990:	f9411000 	ldr	x0, [x0, #544]
  f94994:	97f76d35 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  f94998:	52800028 	mov	w8, #0x1                   	// #1
  f9499c:	39188388 	strb	w8, [x28, #1568]
  f949a0:	f9400288 	ldr	x8, [x20]
  f949a4:	f9405d00 	ldr	x0, [x8, #184]
  f949a8:	b900001f 	str	wzr, [x0]
  f949ac:	f9400361 	ldr	x1, [x27]
  f949b0:	f8008c01 	str	x1, [x0, #8]!
  f949b4:	97f76d18 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  f949b8:	f9400288 	ldr	x8, [x20]
  f949bc:	f9400341 	ldr	x1, [x26]
  f949c0:	f9405d00 	ldr	x0, [x8, #184]
  f949c4:	f8010c01 	str	x1, [x0, #16]!
  f949c8:	97f76d13 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  f949cc:	f9400288 	ldr	x8, [x20]
  f949d0:	f9400321 	ldr	x1, [x25]
  f949d4:	f9405d00 	ldr	x0, [x8, #184]
  f949d8:	f8018c01 	str	x1, [x0, #24]!
  f949dc:	97f76d0e 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  f949e0:	f9400288 	ldr	x8, [x20]
  f949e4:	f9400301 	ldr	x1, [x24]
  f949e8:	f9405d00 	ldr	x0, [x8, #184]
  f949ec:	f8020c01 	str	x1, [x0, #32]!
  f949f0:	97f76d09 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  f949f4:	f9400288 	ldr	x8, [x20]
  f949f8:	f94002e1 	ldr	x1, [x23]
  f949fc:	f9405d00 	ldr	x0, [x8, #184]
  f94a00:	f8028c01 	str	x1, [x0, #40]!
  f94a04:	97f76d04 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  f94a08:	f94002c0 	ldr	x0, [x22]
  f94a0c:	528001e1 	mov	w1, #0xf                   	// #15
  f94a10:	97f76d3f 	bl	d6ff0c <JNI_OnUnload@@Base+0x17b58>
  f94a14:	f9400261 	ldr	x1, [x19]
  f94a18:	aa1f03e2 	mov	x2, xzr
  f94a1c:	aa0003f3 	mov	x19, x0
  f94a20:	94273a9d 	bl	1963494 <__start_il2cpp@@Base+0xb515ac>
  f94a24:	f9400288 	ldr	x8, [x20]
  f94a28:	aa1303e1 	mov	x1, x19
  f94a2c:	f9405d00 	ldr	x0, [x8, #184]
  f94a30:	f8030c13 	str	x19, [x0, #48]!
  f94a34:	97f76cf8 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  f94a38:	f9400288 	ldr	x8, [x20]
  f94a3c:	f9405d00 	ldr	x0, [x8, #184]
  f94a40:	3901001f 	strb	wzr, [x0, #64]
  f94a44:	f9001c1f 	str	xzr, [x0, #56]
  f94a48:	f94002a1 	ldr	x1, [x21]
  f94a4c:	f8048c01 	str	x1, [x0, #72]!
  f94a50:	97f76cf1 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  f94a54:	f9400288 	ldr	x8, [x20]
  f94a58:	90ffab2b 	adrp	x11, 4f8000 <_ZTSNSt6__ndk117bad_function_callE@@Base-0x2396fb>
  f94a5c:	fd40e960 	ldr	d0, [x11, #464]
  f94a60:	a9454ff4 	ldp	x20, x19, [sp, #80]
  f94a64:	f9405d08 	ldr	x8, [x8, #184]
  f94a68:	a94457f6 	ldp	x22, x21, [sp, #64]
  f94a6c:	a9435ff8 	ldp	x24, x23, [sp, #48]
  f94a70:	a94267fa 	ldp	x26, x25, [sp, #32]
  f94a74:	a9416ffc 	ldp	x28, x27, [sp, #16]
  f94a78:	52802009 	mov	w9, #0x100                 	// #256
  f94a7c:	52a7f00a 	mov	w10, #0x3f800000            	// #1065353216
  f94a80:	7900a109 	strh	w9, [x8, #80]
  f94a84:	f9002d1f 	str	xzr, [x8, #88]
  f94a88:	b900551f 	str	wzr, [x8, #84]
  f94a8c:	f900351f 	str	xzr, [x8, #104]
  f94a90:	3901c11f 	strb	wzr, [x8, #112]
  f94a94:	b900750a 	str	w10, [x8, #116]
  f94a98:	fd003d00 	str	d0, [x8, #120]
  f94a9c:	f84607fe 	ldr	x30, [sp], #96
  f94aa0:	d65f03c0 	ret
