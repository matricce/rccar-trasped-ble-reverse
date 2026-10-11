
analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000ee9b30 <__start_il2cpp@@Base+0xd7c48>:
  ee9b30:	f81e0ffe 	str	x30, [sp, #-32]!
  ee9b34:	a9014ff4 	stp	x20, x19, [sp, #16]
  ee9b38:	39400020 	ldrb	w0, [x1]
  ee9b3c:	aa0103f3 	mov	x19, x1
  ee9b40:	aa0203f4 	mov	x20, x2
  ee9b44:	52800022 	mov	w2, #0x1                   	// #1
  ee9b48:	2a1f03e1 	mov	w1, wzr
  ee9b4c:	aa1f03e3 	mov	x3, xzr
  ee9b50:	94030cd5 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee9b54:	39000260 	strb	w0, [x19]
  ee9b58:	39400280 	ldrb	w0, [x20]
  ee9b5c:	52800022 	mov	w2, #0x1                   	// #1
  ee9b60:	2a1f03e1 	mov	w1, wzr
  ee9b64:	aa1f03e3 	mov	x3, xzr
  ee9b68:	94030ccf 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee9b6c:	39000280 	strb	w0, [x20]
  ee9b70:	a9414ff4 	ldp	x20, x19, [sp, #16]
  ee9b74:	f84207fe 	ldr	x30, [sp], #32
  ee9b78:	d65f03c0 	ret
  ee9b7c:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  ee9b80:	39400020 	ldrb	w0, [x1]
  ee9b84:	aa0103f3 	mov	x19, x1
  ee9b88:	52800021 	mov	w1, #0x1                   	// #1
  ee9b8c:	52800022 	mov	w2, #0x1                   	// #1
  ee9b90:	aa1f03e3 	mov	x3, xzr
  ee9b94:	94030cc4 	bl	facea4 <__start_il2cpp@@Base+0x19afbc>
  ee9b98:	39000260 	strb	w0, [x19]
  ee9b9c:	a8c14ffe 	ldp	x30, x19, [sp], #16
  ee9ba0:	d65f03c0 	ret
