System.Byte[] cal_AndroidBle_sumdata(System.Byte[] bledata)


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000e1905c <__start_il2cpp@@Base+0x7174>:
  e1905c:	f81f0ffe 	str	x30, [sp, #-16]!
  e19060:	b4000260 	cbz	x0, e190ac <__start_il2cpp@@Base+0x71c4>
  e19064:	f9400c08 	ldr	x8, [x0, #24]
  e19068:	aa1f03e9 	mov	x9, xzr
  e1906c:	52801d2a 	mov	w10, #0xe9                  	// #233
  e19070:	92407d0b 	and	x11, x8, #0xffffffff
  e19074:	eb09017f 	cmp	x11, x9
  e19078:	54000180 	b.eq	e190a8 <__start_il2cpp@@Base+0x71c0>  // b.none
  e1907c:	8b09000c 	add	x12, x0, x9
  e19080:	3940818c 	ldrb	w12, [x12, #32]
  e19084:	91000529 	add	x9, x9, #0x1
  e19088:	f100493f 	cmp	x9, #0x12
  e1908c:	4a0a018a 	eor	w10, w12, w10
  e19090:	54ffff21 	b.ne	e19074 <__start_il2cpp@@Base+0x718c>  // b.any
  e19094:	7100491f 	cmp	w8, #0x12
  e19098:	54000089 	b.ls	e190a8 <__start_il2cpp@@Base+0x71c0>  // b.plast
  e1909c:	3900c80a 	strb	w10, [x0, #50]
  e190a0:	f84107fe 	ldr	x30, [sp], #16
  e190a4:	d65f03c0 	ret
  e190a8:	97fd5c07 	bl	d700c4 <JNI_OnUnload@@Base+0x17d10>
  e190ac:	97fd5c04 	bl	d700bc <JNI_OnUnload@@Base+0x17d08>
