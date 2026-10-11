
analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000facea4 <__start_il2cpp@@Base+0x19afbc>:
  facea4:	52800028 	mov	w8, #0x1                   	// #1
  facea8:	1ac12108 	lsl	w8, w8, w1
  faceac:	2a000109 	orr	w9, w8, w0
  faceb0:	0a280008 	bic	w8, w0, w8
  faceb4:	7200005f 	tst	w2, #0x1
  faceb8:	1a881120 	csel	w0, w9, w8, ne	// ne = any
  facebc:	d65f03c0 	ret
