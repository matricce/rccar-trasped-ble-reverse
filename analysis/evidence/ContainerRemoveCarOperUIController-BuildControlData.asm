System.Byte[] BuildControlData(out System.Byte data1, out System.Byte data2, out System.Byte data3, out System.Byte data4, out System.Byte data5)


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000ee89e0 <__start_il2cpp@@Base+0xd6af8>:
  ee89e0:	f81b0ffe 	str	x30, [sp, #-80]!
  ee89e4:	a90167fa 	stp	x26, x25, [sp, #16]
  ee89e8:	a9025ff8 	stp	x24, x23, [sp, #32]
  ee89ec:	a90357f6 	stp	x22, x21, [sp, #48]
  ee89f0:	a9044ff4 	stp	x20, x19, [sp, #64]
  ee89f4:	f0009779 	adrp	x25, 21d7000 <__cxa_unexpected_handler@@Base+0x460>
  ee89f8:	90008c9a 	adrp	x26, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee89fc:	39462328 	ldrb	w8, [x25, #392]
  ee8a00:	f947875a 	ldr	x26, [x26, #3848]
  ee8a04:	aa0503f3 	mov	x19, x5
  ee8a08:	aa0403f4 	mov	x20, x4
  ee8a0c:	aa0303f5 	mov	x21, x3
  ee8a10:	aa0203f6 	mov	x22, x2
  ee8a14:	aa0103f7 	mov	x23, x1
  ee8a18:	aa0003f8 	mov	x24, x0
  ee8a1c:	37000308 	tbnz	w8, #0, ee8a7c <__start_il2cpp@@Base+0xd6b94>
  ee8a20:	90008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee8a24:	f946c800 	ldr	x0, [x0, #3472]
  ee8a28:	97fa1d10 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee8a2c:	b0008c80 	adrp	x0, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee8a30:	f9415c00 	ldr	x0, [x0, #696]
  ee8a34:	97fa1d0d 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee8a38:	d0008c80 	adrp	x0, 207a000 <_ZTISt10bad_typeid@@Base+0x1db8>
  ee8a3c:	f9403c00 	ldr	x0, [x0, #120]
  ee8a40:	97fa1d0a 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee8a44:	b0008c80 	adrp	x0, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee8a48:	f9457400 	ldr	x0, [x0, #2792]
  ee8a4c:	97fa1d07 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee8a50:	90008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee8a54:	f9478400 	ldr	x0, [x0, #3848]
  ee8a58:	97fa1d04 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee8a5c:	b0008c80 	adrp	x0, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee8a60:	f9450800 	ldr	x0, [x0, #2576]
  ee8a64:	97fa1d01 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee8a68:	90008ca0 	adrp	x0, 207c000 <_ZTISt10bad_typeid@@Base+0x3db8>
  ee8a6c:	f9439000 	ldr	x0, [x0, #1824]
  ee8a70:	97fa1cfe 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee8a74:	52800028 	mov	w8, #0x1                   	// #1
  ee8a78:	39062328 	strb	w8, [x25, #392]
  ee8a7c:	390002ff 	strb	wzr, [x23]
  ee8a80:	390002df 	strb	wzr, [x22]
  ee8a84:	390002bf 	strb	wzr, [x21]
  ee8a88:	3900029f 	strb	wzr, [x20]
  ee8a8c:	3900027f 	strb	wzr, [x19]
  ee8a90:	f9400340 	ldr	x0, [x26]
  ee8a94:	b940e008 	ldr	w8, [x0, #224]
  ee8a98:	35000068 	cbnz	w8, ee8aa4 <__start_il2cpp@@Base+0xd6bbc>
  ee8a9c:	97fa1d40 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8aa0:	f9400340 	ldr	x0, [x26]
  ee8aa4:	f9405c08 	ldr	x8, [x0, #184]
  ee8aa8:	3941c908 	ldrb	w8, [x8, #114]
  ee8aac:	340001e8 	cbz	w8, ee8ae8 <__start_il2cpp@@Base+0xd6c00>
  ee8ab0:	39426308 	ldrb	w8, [x24, #152]
  ee8ab4:	350000c8 	cbnz	w8, ee8acc <__start_il2cpp@@Base+0xd6be4>
  ee8ab8:	52800028 	mov	w8, #0x1                   	// #1
  ee8abc:	aa1f03e0 	mov	x0, xzr
  ee8ac0:	39026308 	strb	w8, [x24, #152]
  ee8ac4:	943a17ef 	bl	1d6ea80 <__start_il2cpp@@Base+0xf5cb98>
  ee8ac8:	bd009f00 	str	s0, [x24, #156]
  ee8acc:	aa1803e0 	mov	x0, x24
  ee8ad0:	94000224 	bl	ee9360 <__start_il2cpp@@Base+0xd7478>
  ee8ad4:	360004e0 	tbz	w0, #0, ee8b70 <__start_il2cpp@@Base+0xd6c88>
  ee8ad8:	aa1803e0 	mov	x0, x24
  ee8adc:	940002ac 	bl	ee958c <__start_il2cpp@@Base+0xd76a4>
  ee8ae0:	f9400340 	ldr	x0, [x26]
  ee8ae4:	14000003 	b	ee8af0 <__start_il2cpp@@Base+0xd6c08>
  ee8ae8:	3902631f 	strb	wzr, [x24, #152]
  ee8aec:	b9009f1f 	str	wzr, [x24, #156]
  ee8af0:	b940e008 	ldr	w8, [x0, #224]
  ee8af4:	35000068 	cbnz	w8, ee8b00 <__start_il2cpp@@Base+0xd6c18>
  ee8af8:	97fa1d29 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8afc:	f9400340 	ldr	x0, [x26]
  ee8b00:	f9405c08 	ldr	x8, [x0, #184]
  ee8b04:	b9408908 	ldr	w8, [x8, #136]
  ee8b08:	7100051f 	cmp	w8, #0x1
  ee8b0c:	540001e1 	b.ne	ee8b48 <__start_il2cpp@@Base+0xd6c60>  // b.any
  ee8b10:	b900a708 	str	w8, [x24, #164]
  ee8b14:	394002e0 	ldrb	w0, [x23]
  ee8b18:	52800022 	mov	w2, #0x1                   	// #1
  ee8b1c:	2a1f03e1 	mov	w1, wzr
  ee8b20:	aa1f03e3 	mov	x3, xzr
  ee8b24:	940310e0 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee8b28:	390002e0 	strb	w0, [x23]
  ee8b2c:	394002a0 	ldrb	w0, [x21]
  ee8b30:	52800022 	mov	w2, #0x1                   	// #1
  ee8b34:	2a1f03e1 	mov	w1, wzr
  ee8b38:	aa1f03e3 	mov	x3, xzr
  ee8b3c:	940310da 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee8b40:	390002a0 	strb	w0, [x21]
  ee8b44:	14000036 	b	ee8c1c <__start_il2cpp@@Base+0xd6d34>
  ee8b48:	b940e009 	ldr	w9, [x0, #224]
  ee8b4c:	350000a9 	cbnz	w9, ee8b60 <__start_il2cpp@@Base+0xd6c78>
  ee8b50:	97fa1d13 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8b54:	f9400348 	ldr	x8, [x26]
  ee8b58:	f9405d08 	ldr	x8, [x8, #184]
  ee8b5c:	b9408908 	ldr	w8, [x8, #136]
  ee8b60:	3100051f 	cmn	w8, #0x1
  ee8b64:	540004e0 	b.eq	ee8c00 <__start_il2cpp@@Base+0xd6d18>  // b.none
  ee8b68:	2a1f03f9 	mov	w25, wzr
  ee8b6c:	14000007 	b	ee8b88 <__start_il2cpp@@Base+0xd6ca0>
  ee8b70:	aa1803e0 	mov	x0, x24
  ee8b74:	aa1703e1 	mov	x1, x23
  ee8b78:	aa1603e2 	mov	x2, x22
  ee8b7c:	aa1503e3 	mov	x3, x21
  ee8b80:	9400029c 	bl	ee95f0 <__start_il2cpp@@Base+0xd7708>
  ee8b84:	52800039 	mov	w25, #0x1                   	// #1
  ee8b88:	39422f08 	ldrb	w8, [x24, #139]
  ee8b8c:	b900a71f 	str	wzr, [x24, #164]
  ee8b90:	34000328 	cbz	w8, ee8bf4 <__start_il2cpp@@Base+0xd6d0c>
  ee8b94:	f9400340 	ldr	x0, [x26]
  ee8b98:	b940e008 	ldr	w8, [x0, #224]
  ee8b9c:	35000068 	cbnz	w8, ee8ba8 <__start_il2cpp@@Base+0xd6cc0>
  ee8ba0:	97fa1cff 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8ba4:	f9400340 	ldr	x0, [x26]
  ee8ba8:	f9405c08 	ldr	x8, [x0, #184]
  ee8bac:	b9409108 	ldr	w8, [x8, #144]
  ee8bb0:	7100791f 	cmp	w8, #0x1e
  ee8bb4:	54000201 	b.ne	ee8bf4 <__start_il2cpp@@Base+0xd6d0c>  // b.any
  ee8bb8:	b0008c88 	adrp	x8, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee8bbc:	f9415d08 	ldr	x8, [x8, #696]
  ee8bc0:	f9400100 	ldr	x0, [x8]
  ee8bc4:	b940e008 	ldr	w8, [x0, #224]
  ee8bc8:	35000048 	cbnz	w8, ee8bd0 <__start_il2cpp@@Base+0xd6ce8>
  ee8bcc:	97fa1cf4 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8bd0:	90008ca8 	adrp	x8, 207c000 <_ZTISt10bad_typeid@@Base+0x3db8>
  ee8bd4:	f9439108 	ldr	x8, [x8, #1824]
  ee8bd8:	aa1f03e1 	mov	x1, xzr
  ee8bdc:	f9400100 	ldr	x0, [x8]
  ee8be0:	94396dfc 	bl	1d443d0 <__start_il2cpp@@Base+0xf324e8>
  ee8be4:	52800748 	mov	w8, #0x3a                  	// #58
  ee8be8:	aa1803e0 	mov	x0, x24
  ee8bec:	b9008f08 	str	w8, [x24, #140]
  ee8bf0:	940002e9 	bl	ee9794 <__start_il2cpp@@Base+0xd78ac>
  ee8bf4:	36000159 	tbz	w25, #0, ee8c1c <__start_il2cpp@@Base+0xd6d34>
  ee8bf8:	52800039 	mov	w25, #0x1                   	// #1
  ee8bfc:	14000032 	b	ee8cc4 <__start_il2cpp@@Base+0xd6ddc>
  ee8c00:	b900a708 	str	w8, [x24, #164]
  ee8c04:	394002e0 	ldrb	w0, [x23]
  ee8c08:	52800021 	mov	w1, #0x1                   	// #1
  ee8c0c:	52800022 	mov	w2, #0x1                   	// #1
  ee8c10:	aa1f03e3 	mov	x3, xzr
  ee8c14:	940310a4 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee8c18:	390002e0 	strb	w0, [x23]
  ee8c1c:	f9400340 	ldr	x0, [x26]
  ee8c20:	b940e008 	ldr	w8, [x0, #224]
  ee8c24:	35000068 	cbnz	w8, ee8c30 <__start_il2cpp@@Base+0xd6d48>
  ee8c28:	97fa1cdd 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8c2c:	f9400340 	ldr	x0, [x26]
  ee8c30:	f9405c08 	ldr	x8, [x0, #184]
  ee8c34:	b9408508 	ldr	w8, [x8, #132]
  ee8c38:	7100051f 	cmp	w8, #0x1
  ee8c3c:	54000061 	b.ne	ee8c48 <__start_il2cpp@@Base+0xd6d60>  // b.any
  ee8c40:	52800041 	mov	w1, #0x2                   	// #2
  ee8c44:	1400000a 	b	ee8c6c <__start_il2cpp@@Base+0xd6d84>
  ee8c48:	b940e009 	ldr	w9, [x0, #224]
  ee8c4c:	350000a9 	cbnz	w9, ee8c60 <__start_il2cpp@@Base+0xd6d78>
  ee8c50:	97fa1cd3 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8c54:	f9400348 	ldr	x8, [x26]
  ee8c58:	f9405d08 	ldr	x8, [x8, #184]
  ee8c5c:	b9408508 	ldr	w8, [x8, #132]
  ee8c60:	3100051f 	cmn	w8, #0x1
  ee8c64:	540000e1 	b.ne	ee8c80 <__start_il2cpp@@Base+0xd6d98>  // b.any
  ee8c68:	52800061 	mov	w1, #0x3                   	// #3
  ee8c6c:	394002e0 	ldrb	w0, [x23]
  ee8c70:	52800022 	mov	w2, #0x1                   	// #1
  ee8c74:	aa1f03e3 	mov	x3, xzr
  ee8c78:	9403108b 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee8c7c:	390002e0 	strb	w0, [x23]
  ee8c80:	f9400340 	ldr	x0, [x26]
  ee8c84:	b940e008 	ldr	w8, [x0, #224]
  ee8c88:	35000068 	cbnz	w8, ee8c94 <__start_il2cpp@@Base+0xd6dac>
  ee8c8c:	97fa1cc4 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8c90:	f9400340 	ldr	x0, [x26]
  ee8c94:	f9405c08 	ldr	x8, [x0, #184]
  ee8c98:	3941c508 	ldrb	w8, [x8, #113]
  ee8c9c:	34000128 	cbz	w8, ee8cc0 <__start_il2cpp@@Base+0xd6dd8>
  ee8ca0:	394002a0 	ldrb	w0, [x21]
  ee8ca4:	52800022 	mov	w2, #0x1                   	// #1
  ee8ca8:	2a1f03e1 	mov	w1, wzr
  ee8cac:	aa1f03e3 	mov	x3, xzr
  ee8cb0:	9403107d 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee8cb4:	2a1f03f9 	mov	w25, wzr
  ee8cb8:	390002a0 	strb	w0, [x21]
  ee8cbc:	14000002 	b	ee8cc4 <__start_il2cpp@@Base+0xd6ddc>
  ee8cc0:	2a1f03f9 	mov	w25, wzr
  ee8cc4:	f9400340 	ldr	x0, [x26]
  ee8cc8:	b940e008 	ldr	w8, [x0, #224]
  ee8ccc:	35000068 	cbnz	w8, ee8cd8 <__start_il2cpp@@Base+0xd6df0>
  ee8cd0:	97fa1cb3 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8cd4:	f9400340 	ldr	x0, [x26]
  ee8cd8:	f9405c08 	ldr	x8, [x0, #184]
  ee8cdc:	3941f108 	ldrb	w8, [x8, #124]
  ee8ce0:	340000e8 	cbz	w8, ee8cfc <__start_il2cpp@@Base+0xd6e14>
  ee8ce4:	394002a0 	ldrb	w0, [x21]
  ee8ce8:	52800041 	mov	w1, #0x2                   	// #2
  ee8cec:	52800022 	mov	w2, #0x1                   	// #1
  ee8cf0:	aa1f03e3 	mov	x3, xzr
  ee8cf4:	9403106c 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee8cf8:	390002a0 	strb	w0, [x21]
  ee8cfc:	f9407f00 	ldr	x0, [x24, #248]
  ee8d00:	b4002060 	cbz	x0, ee910c <__start_il2cpp@@Base+0xd7224>
  ee8d04:	b0008c88 	adrp	x8, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee8d08:	f9457508 	ldr	x8, [x8, #2792]
  ee8d0c:	f9400101 	ldr	x1, [x8]
  ee8d10:	9409661e 	bl	1142588 <__start_il2cpp@@Base+0x3306a0>
  ee8d14:	b4001fc0 	cbz	x0, ee910c <__start_il2cpp@@Base+0xd7224>
  ee8d18:	b9408808 	ldr	w8, [x0, #136]
  ee8d1c:	7100091f 	cmp	w8, #0x2
  ee8d20:	540000e1 	b.ne	ee8d3c <__start_il2cpp@@Base+0xd6e54>  // b.any
  ee8d24:	394002a0 	ldrb	w0, [x21]
  ee8d28:	52800061 	mov	w1, #0x3                   	// #3
  ee8d2c:	52800022 	mov	w2, #0x1                   	// #1
  ee8d30:	aa1f03e3 	mov	x3, xzr
  ee8d34:	9403105c 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee8d38:	390002a0 	strb	w0, [x21]
  ee8d3c:	f9400340 	ldr	x0, [x26]
  ee8d40:	b940e008 	ldr	w8, [x0, #224]
  ee8d44:	35000068 	cbnz	w8, ee8d50 <__start_il2cpp@@Base+0xd6e68>
  ee8d48:	97fa1c95 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8d4c:	f9400340 	ldr	x0, [x26]
  ee8d50:	f9405c08 	ldr	x8, [x0, #184]
  ee8d54:	39440908 	ldrb	w8, [x8, #258]
  ee8d58:	34000108 	cbz	w8, ee8d78 <__start_il2cpp@@Base+0xd6e90>
  ee8d5c:	394002a0 	ldrb	w0, [x21]
  ee8d60:	52800081 	mov	w1, #0x4                   	// #4
  ee8d64:	52800022 	mov	w2, #0x1                   	// #1
  ee8d68:	aa1f03e3 	mov	x3, xzr
  ee8d6c:	9403104e 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee8d70:	390002a0 	strb	w0, [x21]
  ee8d74:	f9400340 	ldr	x0, [x26]
  ee8d78:	b940e008 	ldr	w8, [x0, #224]
  ee8d7c:	35000068 	cbnz	w8, ee8d88 <__start_il2cpp@@Base+0xd6ea0>
  ee8d80:	97fa1c87 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8d84:	f9400340 	ldr	x0, [x26]
  ee8d88:	f9405c08 	ldr	x8, [x0, #184]
  ee8d8c:	39440d08 	ldrb	w8, [x8, #259]
  ee8d90:	340000e8 	cbz	w8, ee8dac <__start_il2cpp@@Base+0xd6ec4>
  ee8d94:	394002a0 	ldrb	w0, [x21]
  ee8d98:	528000a1 	mov	w1, #0x5                   	// #5
  ee8d9c:	52800022 	mov	w2, #0x1                   	// #1
  ee8da0:	aa1f03e3 	mov	x3, xzr
  ee8da4:	94031040 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee8da8:	390002a0 	strb	w0, [x21]
  ee8dac:	340000b9 	cbz	w25, ee8dc0 <__start_il2cpp@@Base+0xd6ed8>
  ee8db0:	f9004b1f 	str	xzr, [x24, #144]
  ee8db4:	aa1803e0 	mov	x0, x24
  ee8db8:	94000277 	bl	ee9794 <__start_il2cpp@@Base+0xd78ac>
  ee8dbc:	1400000e 	b	ee8df4 <__start_il2cpp@@Base+0xd6f0c>
  ee8dc0:	f9400340 	ldr	x0, [x26]
  ee8dc4:	b940e008 	ldr	w8, [x0, #224]
  ee8dc8:	35000068 	cbnz	w8, ee8dd4 <__start_il2cpp@@Base+0xd6eec>
  ee8dcc:	97fa1c74 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8dd0:	f9400340 	ldr	x0, [x26]
  ee8dd4:	f9405c08 	ldr	x8, [x0, #184]
  ee8dd8:	3941c509 	ldrb	w9, [x8, #113]
  ee8ddc:	340006e9 	cbz	w9, ee8eb8 <__start_il2cpp@@Base+0xd6fd0>
  ee8de0:	aa1803e0 	mov	x0, x24
  ee8de4:	9400026c 	bl	ee9794 <__start_il2cpp@@Base+0xd78ac>
  ee8de8:	aa1803e0 	mov	x0, x24
  ee8dec:	9400027e 	bl	ee97e4 <__start_il2cpp@@Base+0xd78fc>
  ee8df0:	390002c0 	strb	w0, [x22]
  ee8df4:	52800c88 	mov	w8, #0x64                  	// #100
  ee8df8:	39000288 	strb	w8, [x20]
  ee8dfc:	f940a300 	ldr	x0, [x24, #320]
  ee8e00:	b4001860 	cbz	x0, ee910c <__start_il2cpp@@Base+0xd7224>
  ee8e04:	d0008c88 	adrp	x8, 207a000 <_ZTISt10bad_typeid@@Base+0x1db8>
  ee8e08:	f9403d08 	ldr	x8, [x8, #120]
  ee8e0c:	f9400101 	ldr	x1, [x8]
  ee8e10:	940965de 	bl	1142588 <__start_il2cpp@@Base+0x3306a0>
  ee8e14:	b40017c0 	cbz	x0, ee910c <__start_il2cpp@@Base+0xd7224>
  ee8e18:	90008c98 	adrp	x24, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee8e1c:	39442008 	ldrb	w8, [x0, #264]
  ee8e20:	f946cb18 	ldr	x24, [x24, #3472]
  ee8e24:	340000e8 	cbz	w8, ee8e40 <__start_il2cpp@@Base+0xd6f58>
  ee8e28:	39400260 	ldrb	w0, [x19]
  ee8e2c:	52800022 	mov	w2, #0x1                   	// #1
  ee8e30:	2a1f03e1 	mov	w1, wzr
  ee8e34:	aa1f03e3 	mov	x3, xzr
  ee8e38:	9403101b 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee8e3c:	39000260 	strb	w0, [x19]
  ee8e40:	f9400300 	ldr	x0, [x24]
  ee8e44:	528000a1 	mov	w1, #0x5                   	// #5
  ee8e48:	97fa1c31 	bl	d6ff0c <JNI_OnUnload@@Base+0x17b58>
  ee8e4c:	b4001600 	cbz	x0, ee910c <__start_il2cpp@@Base+0xd7224>
  ee8e50:	b9401808 	ldr	w8, [x0, #24]
  ee8e54:	340015e8 	cbz	w8, ee9110 <__start_il2cpp@@Base+0xd7228>
  ee8e58:	394002e9 	ldrb	w9, [x23]
  ee8e5c:	7100051f 	cmp	w8, #0x1
  ee8e60:	39008009 	strb	w9, [x0, #32]
  ee8e64:	54001560 	b.eq	ee9110 <__start_il2cpp@@Base+0xd7228>  // b.none
  ee8e68:	394002c9 	ldrb	w9, [x22]
  ee8e6c:	7100091f 	cmp	w8, #0x2
  ee8e70:	39008409 	strb	w9, [x0, #33]
  ee8e74:	540014e9 	b.ls	ee9110 <__start_il2cpp@@Base+0xd7228>  // b.plast
  ee8e78:	394002a9 	ldrb	w9, [x21]
  ee8e7c:	71000d1f 	cmp	w8, #0x3
  ee8e80:	39008809 	strb	w9, [x0, #34]
  ee8e84:	54001460 	b.eq	ee9110 <__start_il2cpp@@Base+0xd7228>  // b.none
  ee8e88:	39400289 	ldrb	w9, [x20]
  ee8e8c:	7100111f 	cmp	w8, #0x4
  ee8e90:	39008c09 	strb	w9, [x0, #35]
  ee8e94:	540013e9 	b.ls	ee9110 <__start_il2cpp@@Base+0xd7228>  // b.plast
  ee8e98:	39400268 	ldrb	w8, [x19]
  ee8e9c:	a9444ff4 	ldp	x20, x19, [sp, #64]
  ee8ea0:	a94357f6 	ldp	x22, x21, [sp, #48]
  ee8ea4:	a9425ff8 	ldp	x24, x23, [sp, #32]
  ee8ea8:	a94167fa 	ldp	x26, x25, [sp, #16]
  ee8eac:	39009008 	strb	w8, [x0, #36]
  ee8eb0:	f84507fe 	ldr	x30, [sp], #80
  ee8eb4:	d65f03c0 	ret
  ee8eb8:	b940e009 	ldr	w9, [x0, #224]
  ee8ebc:	35000089 	cbnz	w9, ee8ecc <__start_il2cpp@@Base+0xd6fe4>
  ee8ec0:	97fa1c37 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8ec4:	f9400348 	ldr	x8, [x26]
  ee8ec8:	f9405d08 	ldr	x8, [x8, #184]
  ee8ecc:	bd409d00 	ldr	s0, [x8, #156]
  ee8ed0:	f9004b1f 	str	xzr, [x24, #144]
  ee8ed4:	1e202008 	fcmp	s0, #0.0
  ee8ed8:	54fff6e0 	b.eq	ee8db4 <__start_il2cpp@@Base+0xd6ecc>  // b.none
  ee8edc:	b0008c99 	adrp	x25, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee8ee0:	f9450b39 	ldr	x25, [x25, #2576]
  ee8ee4:	f9400320 	ldr	x0, [x25]
  ee8ee8:	b940e008 	ldr	w8, [x0, #224]
  ee8eec:	35000068 	cbnz	w8, ee8ef8 <__start_il2cpp@@Base+0xd7010>
  ee8ef0:	97fa1c2b 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8ef4:	f9400320 	ldr	x0, [x25]
  ee8ef8:	f9405c08 	ldr	x8, [x0, #184]
  ee8efc:	3940e108 	ldrb	w8, [x8, #56]
  ee8f00:	34000828 	cbz	w8, ee9004 <__start_il2cpp@@Base+0xd711c>
  ee8f04:	f9400340 	ldr	x0, [x26]
  ee8f08:	b940e008 	ldr	w8, [x0, #224]
  ee8f0c:	35000068 	cbnz	w8, ee8f18 <__start_il2cpp@@Base+0xd7030>
  ee8f10:	97fa1c23 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8f14:	f9400340 	ldr	x0, [x26]
  ee8f18:	f9405c08 	ldr	x8, [x0, #184]
  ee8f1c:	b9409119 	ldr	w25, [x8, #144]
  ee8f20:	71007b3f 	cmp	w25, #0x1e
  ee8f24:	540008e1 	b.ne	ee9040 <__start_il2cpp@@Base+0xd7158>  // b.any
  ee8f28:	29542309 	ldp	w9, w8, [x24, #160]
  ee8f2c:	6b09011f 	cmp	w8, w9
  ee8f30:	54000240 	b.eq	ee8f78 <__start_il2cpp@@Base+0xd7090>  // b.none
  ee8f34:	b900a308 	str	w8, [x24, #160]
  ee8f38:	b0008c88 	adrp	x8, 2079000 <_ZTISt10bad_typeid@@Base+0xdb8>
  ee8f3c:	f9415d08 	ldr	x8, [x8, #696]
  ee8f40:	f9400100 	ldr	x0, [x8]
  ee8f44:	b940e008 	ldr	w8, [x0, #224]
  ee8f48:	35000048 	cbnz	w8, ee8f50 <__start_il2cpp@@Base+0xd7068>
  ee8f4c:	97fa1c14 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8f50:	90008ca8 	adrp	x8, 207c000 <_ZTISt10bad_typeid@@Base+0x3db8>
  ee8f54:	f9439108 	ldr	x8, [x8, #1824]
  ee8f58:	aa1f03e1 	mov	x1, xzr
  ee8f5c:	f9400100 	ldr	x0, [x8]
  ee8f60:	94396d1c 	bl	1d443d0 <__start_il2cpp@@Base+0xf324e8>
  ee8f64:	aa1803e0 	mov	x0, x24
  ee8f68:	9400020b 	bl	ee9794 <__start_il2cpp@@Base+0xd78ac>
  ee8f6c:	52800748 	mov	w8, #0x3a                  	// #58
  ee8f70:	b9008f08 	str	w8, [x24, #140]
  ee8f74:	f9400340 	ldr	x0, [x26]
  ee8f78:	b940e008 	ldr	w8, [x0, #224]
  ee8f7c:	35000068 	cbnz	w8, ee8f88 <__start_il2cpp@@Base+0xd70a0>
  ee8f80:	97fa1c07 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8f84:	f9400340 	ldr	x0, [x26]
  ee8f88:	f9405c08 	ldr	x8, [x0, #184]
  ee8f8c:	bd408f00 	ldr	s0, [x24, #140]
  ee8f90:	bd409d01 	ldr	s1, [x8, #156]
  ee8f94:	5e21d800 	scvtf	s0, s0
  ee8f98:	52a84d08 	mov	w8, #0x42680000            	// #1114112000
  ee8f9c:	1e20c021 	fabs	s1, s1
  ee8fa0:	1e200820 	fmul	s0, s1, s0
  ee8fa4:	1e270101 	fmov	s1, w8
  ee8fa8:	1e212000 	fcmp	s0, s1
  ee8fac:	54000761 	b.ne	ee9098 <__start_il2cpp@@Base+0xd71b0>  // b.any
  ee8fb0:	39422f08 	ldrb	w8, [x24, #139]
  ee8fb4:	35000728 	cbnz	w8, ee9098 <__start_il2cpp@@Base+0xd71b0>
  ee8fb8:	aa1803f9 	mov	x25, x24
  ee8fbc:	f8478f21 	ldr	x1, [x25, #120]!
  ee8fc0:	52800028 	mov	w8, #0x1                   	// #1
  ee8fc4:	39004f28 	strb	w8, [x25, #19]
  ee8fc8:	b4000081 	cbz	x1, ee8fd8 <__start_il2cpp@@Base+0xd70f0>
  ee8fcc:	aa1803e0 	mov	x0, x24
  ee8fd0:	aa1f03e2 	mov	x2, xzr
  ee8fd4:	943a06e4 	bl	1d6ab64 <__start_il2cpp@@Base+0xf58c7c>
  ee8fd8:	aa1803e0 	mov	x0, x24
  ee8fdc:	9400026f 	bl	ee9998 <__start_il2cpp@@Base+0xd7ab0>
  ee8fe0:	aa0003e1 	mov	x1, x0
  ee8fe4:	aa1803e0 	mov	x0, x24
  ee8fe8:	aa1f03e2 	mov	x2, xzr
  ee8fec:	943a0643 	bl	1d6a8f8 <__start_il2cpp@@Base+0xf58a10>
  ee8ff0:	aa0003e1 	mov	x1, x0
  ee8ff4:	f9003f00 	str	x0, [x24, #120]
  ee8ff8:	aa1903e0 	mov	x0, x25
  ee8ffc:	97fa1b86 	bl	d6fe14 <JNI_OnUnload@@Base+0x17a60>
  ee9000:	14000026 	b	ee9098 <__start_il2cpp@@Base+0xd71b0>
  ee9004:	aa1803e0 	mov	x0, x24
  ee9008:	940001e3 	bl	ee9794 <__start_il2cpp@@Base+0xd78ac>
  ee900c:	f9400340 	ldr	x0, [x26]
  ee9010:	b940e008 	ldr	w8, [x0, #224]
  ee9014:	35000068 	cbnz	w8, ee9020 <__start_il2cpp@@Base+0xd7138>
  ee9018:	97fa1be1 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee901c:	f9400340 	ldr	x0, [x26]
  ee9020:	f9405c08 	ldr	x8, [x0, #184]
  ee9024:	bd409d00 	ldr	s0, [x8, #156]
  ee9028:	bd409101 	ldr	s1, [x8, #144]
  ee902c:	52aff008 	mov	w8, #0x7f800000            	// #2139095040
  ee9030:	1e270102 	fmov	s2, w8
  ee9034:	1e20c000 	fabs	s0, s0
  ee9038:	5e21d821 	scvtf	s1, s1
  ee903c:	14000023 	b	ee90c8 <__start_il2cpp@@Base+0xd71e0>
  ee9040:	b940e008 	ldr	w8, [x0, #224]
  ee9044:	350000a8 	cbnz	w8, ee9058 <__start_il2cpp@@Base+0xd7170>
  ee9048:	97fa1bd5 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee904c:	f9400340 	ldr	x0, [x26]
  ee9050:	f9405c08 	ldr	x8, [x0, #184]
  ee9054:	b9409119 	ldr	w25, [x8, #144]
  ee9058:	7100f33f 	cmp	w25, #0x3c
  ee905c:	54000421 	b.ne	ee90e0 <__start_il2cpp@@Base+0xd71f8>  // b.any
  ee9060:	aa1803e0 	mov	x0, x24
  ee9064:	940001cc 	bl	ee9794 <__start_il2cpp@@Base+0xd78ac>
  ee9068:	528008c8 	mov	w8, #0x46                  	// #70
  ee906c:	b9008f08 	str	w8, [x24, #140]
  ee9070:	f9400340 	ldr	x0, [x26]
  ee9074:	b940e008 	ldr	w8, [x0, #224]
  ee9078:	35000068 	cbnz	w8, ee9084 <__start_il2cpp@@Base+0xd719c>
  ee907c:	97fa1bc8 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee9080:	f9400340 	ldr	x0, [x26]
  ee9084:	f9405c08 	ldr	x8, [x0, #184]
  ee9088:	b9408508 	ldr	w8, [x8, #132]
  ee908c:	34000068 	cbz	w8, ee9098 <__start_il2cpp@@Base+0xd71b0>
  ee9090:	52800c88 	mov	w8, #0x64                  	// #100
  ee9094:	b9008f08 	str	w8, [x24, #140]
  ee9098:	f9400340 	ldr	x0, [x26]
  ee909c:	b9408f19 	ldr	w25, [x24, #140]
  ee90a0:	b940e008 	ldr	w8, [x0, #224]
  ee90a4:	35000068 	cbnz	w8, ee90b0 <__start_il2cpp@@Base+0xd71c8>
  ee90a8:	97fa1bbd 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee90ac:	f9400340 	ldr	x0, [x26]
  ee90b0:	f9405c08 	ldr	x8, [x0, #184]
  ee90b4:	1e220321 	scvtf	s1, w25
  ee90b8:	bd409d00 	ldr	s0, [x8, #156]
  ee90bc:	52aff008 	mov	w8, #0x7f800000            	// #2139095040
  ee90c0:	1e270102 	fmov	s2, w8
  ee90c4:	1e20c000 	fabs	s0, s0
  ee90c8:	1e210800 	fmul	s0, s0, s1
  ee90cc:	1e380008 	fcvtzs	w8, s0
  ee90d0:	1e222000 	fcmp	s0, s2
  ee90d4:	1a8803e8 	csel	w8, wzr, w8, eq	// eq = none
  ee90d8:	390002c8 	strb	w8, [x22]
  ee90dc:	17ffff46 	b	ee8df4 <__start_il2cpp@@Base+0xd6f0c>
  ee90e0:	b940e008 	ldr	w8, [x0, #224]
  ee90e4:	350000a8 	cbnz	w8, ee90f8 <__start_il2cpp@@Base+0xd7210>
  ee90e8:	97fa1bad 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee90ec:	f9400348 	ldr	x8, [x26]
  ee90f0:	f9405d08 	ldr	x8, [x8, #184]
  ee90f4:	b9409119 	ldr	w25, [x8, #144]
  ee90f8:	aa1803e0 	mov	x0, x24
  ee90fc:	940001a6 	bl	ee9794 <__start_il2cpp@@Base+0xd78ac>
  ee9100:	7101933f 	cmp	w25, #0x64
  ee9104:	54fffc60 	b.eq	ee9090 <__start_il2cpp@@Base+0xd71a8>  // b.none
  ee9108:	17ffffe4 	b	ee9098 <__start_il2cpp@@Base+0xd71b0>
  ee910c:	97fa1bec 	bl	d700bc <JNI_OnUnload@@Base+0x17d08>
  ee9110:	97fa1bed 	bl	d700c4 <JNI_OnUnload@@Base+0x17d10>
