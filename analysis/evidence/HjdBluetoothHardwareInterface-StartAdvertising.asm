System.Void StartAdvertising(System.Action`1<System.String> action, System.Byte[] data)


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000e18f00 <__start_il2cpp@@Base+0x7018>:
  e18f00:	f81d0ffe 	str	x30, [sp, #-48]!
  e18f04:	a90157f6 	stp	x22, x21, [sp, #16]
  e18f08:	a9024ff4 	stp	x20, x19, [sp, #32]
  e18f0c:	d0009df5 	adrp	x21, 21d6000 <_ZTISt10bad_typeid@@Base+0x15ddb8>
  e18f10:	90009316 	adrp	x22, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  e18f14:	397006a8 	ldrb	w8, [x21, #3073]
  e18f18:	f946a2d6 	ldr	x22, [x22, #3392]
  e18f1c:	aa0103f3 	mov	x19, x1
  e18f20:	aa0003f4 	mov	x20, x0
  e18f24:	370001e8 	tbnz	w8, #0, e18f60 <__start_il2cpp@@Base+0x7078>
  e18f28:	90009300 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  e18f2c:	f946c000 	ldr	x0, [x0, #3456]
  e18f30:	97fd5bce 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  e18f34:	90009300 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  e18f38:	f946a000 	ldr	x0, [x0, #3392]
  e18f3c:	97fd5bcb 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  e18f40:	90009300 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  e18f44:	f9453000 	ldr	x0, [x0, #2656]
  e18f48:	97fd5bc8 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  e18f4c:	90009300 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  e18f50:	f9467800 	ldr	x0, [x0, #3312]
  e18f54:	97fd5bc5 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  e18f58:	52800028 	mov	w8, #0x1                   	// #1
  e18f5c:	393006a8 	strb	w8, [x21, #3073]
  e18f60:	f94002c0 	ldr	x0, [x22]
  e18f64:	90009315 	adrp	x21, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  e18f68:	b940e008 	ldr	w8, [x0, #224]
  e18f6c:	f94532b5 	ldr	x21, [x21, #2656]
  e18f70:	35000068 	cbnz	w8, e18f7c <__start_il2cpp@@Base+0x7094>
  e18f74:	97fd5c0a 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  e18f78:	f94002c0 	ldr	x0, [x22]
  e18f7c:	f94002a8 	ldr	x8, [x21]
  e18f80:	f9405c09 	ldr	x9, [x0, #184]
  e18f84:	b940e10a 	ldr	w10, [x8, #224]
  e18f88:	f9400535 	ldr	x21, [x9, #8]
  e18f8c:	3500006a 	cbnz	w10, e18f98 <__start_il2cpp@@Base+0x70b0>
  e18f90:	aa0803e0 	mov	x0, x8
  e18f94:	97fd5c02 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  e18f98:	aa1503e0 	mov	x0, x21
  e18f9c:	aa1f03e1 	mov	x1, xzr
  e18fa0:	aa1f03e2 	mov	x2, xzr
  e18fa4:	943d4171 	bl	1d69568 <__start_il2cpp@@Base+0xf57680>
  e18fa8:	36000180 	tbz	w0, #0, e18fd8 <__start_il2cpp@@Base+0x70f0>
  e18fac:	f94002c0 	ldr	x0, [x22]
  e18fb0:	b940e008 	ldr	w8, [x0, #224]
  e18fb4:	35000068 	cbnz	w8, e18fc0 <__start_il2cpp@@Base+0x70d8>
  e18fb8:	97fd5bf9 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  e18fbc:	f94002c0 	ldr	x0, [x22]
  e18fc0:	f9405c08 	ldr	x8, [x0, #184]
  e18fc4:	f9400500 	ldr	x0, [x8, #8]
  e18fc8:	b4000480 	cbz	x0, e19058 <__start_il2cpp@@Base+0x7170>
  e18fcc:	f8030c14 	str	x20, [x0, #48]!
  e18fd0:	aa1403e1 	mov	x1, x20
  e18fd4:	97fd5b90 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  e18fd8:	f94002c0 	ldr	x0, [x22]
  e18fdc:	b940e008 	ldr	w8, [x0, #224]
  e18fe0:	35000068 	cbnz	w8, e18fec <__start_il2cpp@@Base+0x7104>
  e18fe4:	97fd5bee 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  e18fe8:	f94002c0 	ldr	x0, [x22]
  e18fec:	f9405c08 	ldr	x8, [x0, #184]
  e18ff0:	f9400108 	ldr	x8, [x8]
  e18ff4:	b40002a8 	cbz	x8, e19048 <__start_il2cpp@@Base+0x7160>
  e18ff8:	b940e008 	ldr	w8, [x0, #224]
  e18ffc:	35000048 	cbnz	w8, e19004 <__start_il2cpp@@Base+0x711c>
  e19000:	97fd5be7 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  e19004:	aa1303e0 	mov	x0, x19
  e19008:	94000015 	bl	e1905c <__start_il2cpp@@Base+0x7174>
  e1900c:	f94002c8 	ldr	x8, [x22]
  e19010:	f9405d08 	ldr	x8, [x8, #184]
  e19014:	f9400100 	ldr	x0, [x8]
  e19018:	b4000200 	cbz	x0, e19058 <__start_il2cpp@@Base+0x7170>
  e1901c:	f00092e8 	adrp	x8, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  e19020:	f00092e9 	adrp	x9, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  e19024:	f9467908 	ldr	x8, [x8, #3312]
  e19028:	f946c129 	ldr	x9, [x9, #3456]
  e1902c:	aa1303e2 	mov	x2, x19
  e19030:	a9424ff4 	ldp	x20, x19, [sp, #32]
  e19034:	f9400101 	ldr	x1, [x8]
  e19038:	f9400123 	ldr	x3, [x9]
  e1903c:	a94157f6 	ldp	x22, x21, [sp, #16]
  e19040:	f84307fe 	ldr	x30, [sp], #48
  e19044:	140ba542 	b	110254c <__start_il2cpp@@Base+0x2f0664>
  e19048:	a9424ff4 	ldp	x20, x19, [sp, #32]
  e1904c:	a94157f6 	ldp	x22, x21, [sp, #16]
  e19050:	f84307fe 	ldr	x30, [sp], #48
  e19054:	d65f03c0 	ret
  e19058:	97fd5c19 	bl	d700bc <JNI_OnUnload@@Base+0x17d08>
