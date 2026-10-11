System.Byte[] CreateDuimaData()


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000ee7c30 <__start_il2cpp@@Base+0xd5d48>:
  ee7c30:	f81e0ffe 	str	x30, [sp, #-32]!
  ee7c34:	a9014ff4 	stp	x20, x19, [sp, #16]
  ee7c38:	90009793 	adrp	x19, 21d7000 <__cxa_unexpected_handler@@Base+0x460>
  ee7c3c:	b0008c94 	adrp	x20, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee7c40:	3945ea68 	ldrb	w8, [x19, #378]
  ee7c44:	f946ca94 	ldr	x20, [x20, #3472]
  ee7c48:	37000128 	tbnz	w8, #0, ee7c6c <__start_il2cpp@@Base+0xd5d84>
  ee7c4c:	b0008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee7c50:	f946c800 	ldr	x0, [x0, #3472]
  ee7c54:	97fa2085 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee7c58:	b0008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee7c5c:	f946a000 	ldr	x0, [x0, #3392]
  ee7c60:	97fa2082 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee7c64:	52800028 	mov	w8, #0x1                   	// #1
  ee7c68:	3905ea68 	strb	w8, [x19, #378]
  ee7c6c:	f9400280 	ldr	x0, [x20]
  ee7c70:	52800261 	mov	w1, #0x13                  	// #19
  ee7c74:	97fa20a6 	bl	d6ff0c <JNI_OnUnload@@Base+0x17b58>
  ee7c78:	b4000500 	cbz	x0, ee7d18 <__start_il2cpp@@Base+0xd5e30>
  ee7c7c:	f9400c08 	ldr	x8, [x0, #24]
  ee7c80:	aa0003f3 	mov	x19, x0
  ee7c84:	34000488 	cbz	w8, ee7d14 <__start_il2cpp@@Base+0xd5e2c>
  ee7c88:	52800089 	mov	w9, #0x4                   	// #4
  ee7c8c:	7100051f 	cmp	w8, #0x1
  ee7c90:	39008269 	strb	w9, [x19, #32]
  ee7c94:	54000400 	b.eq	ee7d14 <__start_il2cpp@@Base+0xd5e2c>  // b.none
  ee7c98:	b0008c94 	adrp	x20, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee7c9c:	f946a294 	ldr	x20, [x20, #3392]
  ee7ca0:	528000c9 	mov	w9, #0x6                   	// #6
  ee7ca4:	39008669 	strb	w9, [x19, #33]
  ee7ca8:	f9400280 	ldr	x0, [x20]
  ee7cac:	b940e009 	ldr	w9, [x0, #224]
  ee7cb0:	35000069 	cbnz	w9, ee7cbc <__start_il2cpp@@Base+0xd5dd4>
  ee7cb4:	97fa20ba 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee7cb8:	f9400e68 	ldr	x8, [x19, #24]
  ee7cbc:	7100151f 	cmp	w8, #0x5
  ee7cc0:	540002a9 	b.ls	ee7d14 <__start_il2cpp@@Base+0xd5e2c>  // b.plast
  ee7cc4:	f9400289 	ldr	x9, [x20]
  ee7cc8:	7100191f 	cmp	w8, #0x6
  ee7ccc:	f9405d29 	ldr	x9, [x9, #184]
  ee7cd0:	39404929 	ldrb	w9, [x9, #18]
  ee7cd4:	39009669 	strb	w9, [x19, #37]
  ee7cd8:	540001e0 	b.eq	ee7d14 <__start_il2cpp@@Base+0xd5e2c>  // b.none
  ee7cdc:	f9400289 	ldr	x9, [x20]
  ee7ce0:	71001d1f 	cmp	w8, #0x7
  ee7ce4:	f9405d29 	ldr	x9, [x9, #184]
  ee7ce8:	39404d29 	ldrb	w9, [x9, #19]
  ee7cec:	39009a69 	strb	w9, [x19, #38]
  ee7cf0:	54000129 	b.ls	ee7d14 <__start_il2cpp@@Base+0xd5e2c>  // b.plast
  ee7cf4:	f9400288 	ldr	x8, [x20]
  ee7cf8:	aa1303e0 	mov	x0, x19
  ee7cfc:	f9405d08 	ldr	x8, [x8, #184]
  ee7d00:	39405108 	ldrb	w8, [x8, #20]
  ee7d04:	39009e68 	strb	w8, [x19, #39]
  ee7d08:	a9414ff4 	ldp	x20, x19, [sp, #16]
  ee7d0c:	f84207fe 	ldr	x30, [sp], #32
  ee7d10:	d65f03c0 	ret
  ee7d14:	97fa20ec 	bl	d700c4 <JNI_OnUnload@@Base+0x17d10>
  ee7d18:	97fa20e9 	bl	d700bc <JNI_OnUnload@@Base+0x17d08>
