System.Void OnScanDataReceived(System.String data)


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000ee7f18 <__start_il2cpp@@Base+0xd6030>:
  ee7f18:	f81c0ffe 	str	x30, [sp, #-64]!
  ee7f1c:	a9015ff8 	stp	x24, x23, [sp, #16]
  ee7f20:	a90257f6 	stp	x22, x21, [sp, #32]
  ee7f24:	a9034ff4 	stp	x20, x19, [sp, #48]
  ee7f28:	90009796 	adrp	x22, 21d7000 <__cxa_unexpected_handler@@Base+0x460>
  ee7f2c:	b0008c95 	adrp	x21, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee7f30:	3945f6c8 	ldrb	w8, [x22, #381]
  ee7f34:	f9447ab5 	ldr	x21, [x21, #2288]
  ee7f38:	aa0103f4 	mov	x20, x1
  ee7f3c:	aa0003f3 	mov	x19, x0
  ee7f40:	370002a8 	tbnz	w8, #0, ee7f94 <__start_il2cpp@@Base+0xd60ac>
  ee7f44:	b0008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee7f48:	f946c800 	ldr	x0, [x0, #3472]
  ee7f4c:	97fa1fc7 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee7f50:	d0008c80 	adrp	x0, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee7f54:	f944fc00 	ldr	x0, [x0, #2552]
  ee7f58:	97fa1fc4 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee7f5c:	b0008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee7f60:	f9447800 	ldr	x0, [x0, #2288]
  ee7f64:	97fa1fc1 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee7f68:	b0008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee7f6c:	f946a000 	ldr	x0, [x0, #3392]
  ee7f70:	97fa1fbe 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee7f74:	b0008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee7f78:	f9478400 	ldr	x0, [x0, #3848]
  ee7f7c:	97fa1fbb 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee7f80:	d0008c80 	adrp	x0, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee7f84:	f9450800 	ldr	x0, [x0, #2576]
  ee7f88:	97fa1fb8 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee7f8c:	52800028 	mov	w8, #0x1                   	// #1
  ee7f90:	3905f6c8 	strb	w8, [x22, #381]
  ee7f94:	f94002a0 	ldr	x0, [x21]
  ee7f98:	b0008c95 	adrp	x21, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee7f9c:	b940e008 	ldr	w8, [x0, #224]
  ee7fa0:	f946a2b5 	ldr	x21, [x21, #3392]
  ee7fa4:	35000048 	cbnz	w8, ee7fac <__start_il2cpp@@Base+0xd60c4>
  ee7fa8:	97fa1ffd 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee7fac:	aa1403e0 	mov	x0, x20
  ee7fb0:	aa1f03e1 	mov	x1, xzr
  ee7fb4:	942b64d9 	bl	19c1318 <__start_il2cpp@@Base+0xbaf430>
  ee7fb8:	f94002a8 	ldr	x8, [x21]
  ee7fbc:	aa0003f4 	mov	x20, x0
  ee7fc0:	b940e109 	ldr	w9, [x8, #224]
  ee7fc4:	35000089 	cbnz	w9, ee7fd4 <__start_il2cpp@@Base+0xd60ec>
  ee7fc8:	aa0803e0 	mov	x0, x8
  ee7fcc:	97fa1ff4 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee7fd0:	f94002a8 	ldr	x8, [x21]
  ee7fd4:	f9405d08 	ldr	x8, [x8, #184]
  ee7fd8:	52800081 	mov	w1, #0x4                   	// #4
  ee7fdc:	52800142 	mov	w2, #0xa                   	// #10
  ee7fe0:	aa1403e0 	mov	x0, x20
  ee7fe4:	39405105 	ldrb	w5, [x8, #20]
  ee7fe8:	39404d04 	ldrb	w4, [x8, #19]
  ee7fec:	39404903 	ldrb	w3, [x8, #18]
  ee7ff0:	aa1f03e6 	mov	x6, xzr
  ee7ff4:	97fcc587 	bl	e19610 <__start_il2cpp@@Base+0x7728>
  ee7ff8:	36000f20 	tbz	w0, #0, ee81dc <__start_il2cpp@@Base+0xd62f4>
  ee7ffc:	d0008c96 	adrp	x22, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee8000:	f9450ad6 	ldr	x22, [x22, #2576]
  ee8004:	90008c97 	adrp	x23, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee8008:	f94002c0 	ldr	x0, [x22]
  ee800c:	b940e008 	ldr	w8, [x0, #224]
  ee8010:	f94786f7 	ldr	x23, [x23, #3848]
  ee8014:	35000068 	cbnz	w8, ee8020 <__start_il2cpp@@Base+0xd6138>
  ee8018:	97fa1fe1 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee801c:	f94002c0 	ldr	x0, [x22]
  ee8020:	f9405c08 	ldr	x8, [x0, #184]
  ee8024:	52800029 	mov	w9, #0x1                   	// #1
  ee8028:	b0008c98 	adrp	x24, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee802c:	3900f909 	strb	w9, [x8, #62]
  ee8030:	f94002e0 	ldr	x0, [x23]
  ee8034:	b940e008 	ldr	w8, [x0, #224]
  ee8038:	f944ff18 	ldr	x24, [x24, #2552]
  ee803c:	35000068 	cbnz	w8, ee8048 <__start_il2cpp@@Base+0xd6160>
  ee8040:	97fa1fd7 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8044:	f94002e0 	ldr	x0, [x23]
  ee8048:	f9405c08 	ldr	x8, [x0, #184]
  ee804c:	f9400309 	ldr	x9, [x24]
  ee8050:	f940a901 	ldr	x1, [x8, #336]
  ee8054:	f9405d28 	ldr	x8, [x9, #184]
  ee8058:	f9000101 	str	x1, [x8]
  ee805c:	f9400308 	ldr	x8, [x24]
  ee8060:	f9405d00 	ldr	x0, [x8, #184]
  ee8064:	97fa1f6c 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  ee8068:	f94002c8 	ldr	x8, [x22]
  ee806c:	f9405d08 	ldr	x8, [x8, #184]
  ee8070:	3940e108 	ldrb	w8, [x8, #56]
  ee8074:	34000048 	cbz	w8, ee807c <__start_il2cpp@@Base+0xd6194>
  ee8078:	94000060 	bl	ee81f8 <__start_il2cpp@@Base+0xd6310>
  ee807c:	f94002a0 	ldr	x0, [x21]
  ee8080:	b940e008 	ldr	w8, [x0, #224]
  ee8084:	35000048 	cbnz	w8, ee808c <__start_il2cpp@@Base+0xd61a4>
  ee8088:	97fa1fc5 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee808c:	aa1f03e0 	mov	x0, xzr
  ee8090:	97fcc587 	bl	e196ac <__start_il2cpp@@Base+0x77c4>
  ee8094:	f94002e8 	ldr	x8, [x23]
  ee8098:	2a0003f5 	mov	w21, w0
  ee809c:	b940e109 	ldr	w9, [x8, #224]
  ee80a0:	35000089 	cbnz	w9, ee80b0 <__start_il2cpp@@Base+0xd61c8>
  ee80a4:	aa0803e0 	mov	x0, x8
  ee80a8:	97fa1fbd 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee80ac:	f94002e8 	ldr	x8, [x23]
  ee80b0:	b4000a34 	cbz	x20, ee81f4 <__start_il2cpp@@Base+0xd630c>
  ee80b4:	b9401a89 	ldr	w9, [x20, #24]
  ee80b8:	6b0902bf 	cmp	w21, w9
  ee80bc:	540009a2 	b.cs	ee81f0 <__start_il2cpp@@Base+0xd6308>  // b.hs, b.nlast
  ee80c0:	f9405d08 	ldr	x8, [x8, #184]
  ee80c4:	f9403508 	ldr	x8, [x8, #104]
  ee80c8:	b4000968 	cbz	x8, ee81f4 <__start_il2cpp@@Base+0xd630c>
  ee80cc:	b9401909 	ldr	w9, [x8, #24]
  ee80d0:	34000909 	cbz	w9, ee81f0 <__start_il2cpp@@Base+0xd6308>
  ee80d4:	8b35c289 	add	x9, x20, w21, sxtw
  ee80d8:	39408129 	ldrb	w9, [x9, #32]
  ee80dc:	39008109 	strb	w9, [x8, #32]
  ee80e0:	b9401a89 	ldr	w9, [x20, #24]
  ee80e4:	110006a8 	add	w8, w21, #0x1
  ee80e8:	6b09011f 	cmp	w8, w9
  ee80ec:	54000822 	b.cs	ee81f0 <__start_il2cpp@@Base+0xd6308>  // b.hs, b.nlast
  ee80f0:	f94002e9 	ldr	x9, [x23]
  ee80f4:	f9405d29 	ldr	x9, [x9, #184]
  ee80f8:	f9403529 	ldr	x9, [x9, #104]
  ee80fc:	b40007c9 	cbz	x9, ee81f4 <__start_il2cpp@@Base+0xd630c>
  ee8100:	b940192a 	ldr	w10, [x9, #24]
  ee8104:	7100055f 	cmp	w10, #0x1
  ee8108:	54000749 	b.ls	ee81f0 <__start_il2cpp@@Base+0xd6308>  // b.plast
  ee810c:	8b28c288 	add	x8, x20, w8, sxtw
  ee8110:	39408108 	ldrb	w8, [x8, #32]
  ee8114:	39008528 	strb	w8, [x9, #33]
  ee8118:	b9401a89 	ldr	w9, [x20, #24]
  ee811c:	11000aa8 	add	w8, w21, #0x2
  ee8120:	6b09011f 	cmp	w8, w9
  ee8124:	54000662 	b.cs	ee81f0 <__start_il2cpp@@Base+0xd6308>  // b.hs, b.nlast
  ee8128:	f94002e9 	ldr	x9, [x23]
  ee812c:	f9405d29 	ldr	x9, [x9, #184]
  ee8130:	f9403529 	ldr	x9, [x9, #104]
  ee8134:	b4000609 	cbz	x9, ee81f4 <__start_il2cpp@@Base+0xd630c>
  ee8138:	b940192a 	ldr	w10, [x9, #24]
  ee813c:	7100095f 	cmp	w10, #0x2
  ee8140:	54000589 	b.ls	ee81f0 <__start_il2cpp@@Base+0xd6308>  // b.plast
  ee8144:	8b28c288 	add	x8, x20, w8, sxtw
  ee8148:	39408108 	ldrb	w8, [x8, #32]
  ee814c:	52800034 	mov	w20, #0x1                   	// #1
  ee8150:	aa1303e0 	mov	x0, x19
  ee8154:	39008928 	strb	w8, [x9, #34]
  ee8158:	f94002e8 	ldr	x8, [x23]
  ee815c:	f9405d08 	ldr	x8, [x8, #184]
  ee8160:	3901c114 	strb	w20, [x8, #112]
  ee8164:	94000055 	bl	ee82b8 <__start_il2cpp@@Base+0xd63d0>
  ee8168:	aa0003e1 	mov	x1, x0
  ee816c:	aa1303e0 	mov	x0, x19
  ee8170:	f8020c01 	str	x1, [x0, #32]!
  ee8174:	97fa1f28 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  ee8178:	0f000420 	movi	v0.2s, #0x1
  ee817c:	39022a74 	strb	w20, [x19, #138]
  ee8180:	b900427f 	str	wzr, [x19, #64]
  ee8184:	fd001e60 	str	d0, [x19, #56]
  ee8188:	90008c88 	adrp	x8, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee818c:	f946c908 	ldr	x8, [x8, #3472]
  ee8190:	52800141 	mov	w1, #0xa                   	// #10
  ee8194:	f9400100 	ldr	x0, [x8]
  ee8198:	97fa1f5d 	bl	d6ff0c <JNI_OnUnload@@Base+0x17b58>
  ee819c:	f8028e60 	str	x0, [x19, #40]!
  ee81a0:	aa0003e1 	mov	x1, x0
  ee81a4:	aa1303e0 	mov	x0, x19
  ee81a8:	97fa1f1b 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  ee81ac:	f94002c0 	ldr	x0, [x22]
  ee81b0:	b940e008 	ldr	w8, [x0, #224]
  ee81b4:	35000048 	cbnz	w8, ee81bc <__start_il2cpp@@Base+0xd62d4>
  ee81b8:	97fa1f79 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee81bc:	a9434ff4 	ldp	x20, x19, [sp, #48]
  ee81c0:	a94257f6 	ldp	x22, x21, [sp, #32]
  ee81c4:	a9415ff8 	ldp	x24, x23, [sp, #16]
  ee81c8:	1e2c1000 	fmov	s0, #5.000000000000000000e-01
  ee81cc:	52800140 	mov	w0, #0xa                   	// #10
  ee81d0:	aa1f03e1 	mov	x1, xzr
  ee81d4:	f84407fe 	ldr	x30, [sp], #64
  ee81d8:	1402ad41 	b	f936dc <__start_il2cpp@@Base+0x1817f4>
  ee81dc:	a9434ff4 	ldp	x20, x19, [sp, #48]
  ee81e0:	a94257f6 	ldp	x22, x21, [sp, #32]
  ee81e4:	a9415ff8 	ldp	x24, x23, [sp, #16]
  ee81e8:	f84407fe 	ldr	x30, [sp], #64
  ee81ec:	d65f03c0 	ret
  ee81f0:	97fa1fb5 	bl	d700c4 <JNI_OnUnload@@Base+0x17d10>
  ee81f4:	97fa1fb2 	bl	d700bc <JNI_OnUnload@@Base+0x17d08>
