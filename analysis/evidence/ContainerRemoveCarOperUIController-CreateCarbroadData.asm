System.Byte[] CreateCarbroadData()


analysis/extracted/arm64/lib/arm64-v8a/libil2cpp.so:     file format elf64-littleaarch64


Disassembly of section il2cpp:

0000000000ee82b8 <__start_il2cpp@@Base+0xd63d0>:
  ee82b8:	a9be57fe 	stp	x30, x21, [sp, #-32]!
  ee82bc:	a9014ff4 	stp	x20, x19, [sp, #16]
  ee82c0:	f0009774 	adrp	x20, 21d7000 <__cxa_unexpected_handler@@Base+0x460>
  ee82c4:	90008c95 	adrp	x21, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee82c8:	39460288 	ldrb	w8, [x20, #384]
  ee82cc:	f946cab5 	ldr	x21, [x21, #3472]
  ee82d0:	aa0003f3 	mov	x19, x0
  ee82d4:	37000188 	tbnz	w8, #0, ee8304 <__start_il2cpp@@Base+0xd641c>
  ee82d8:	90008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee82dc:	f946c800 	ldr	x0, [x0, #3472]
  ee82e0:	97fa1ee2 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee82e4:	90008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee82e8:	f946a000 	ldr	x0, [x0, #3392]
  ee82ec:	97fa1edf 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee82f0:	90008c80 	adrp	x0, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee82f4:	f9478400 	ldr	x0, [x0, #3848]
  ee82f8:	97fa1edc 	bl	d6fe68 <JNI_OnUnload@@Base+0x17ab4>
  ee82fc:	52800028 	mov	w8, #0x1                   	// #1
  ee8300:	39060288 	strb	w8, [x20, #384]
  ee8304:	f94002a0 	ldr	x0, [x21]
  ee8308:	52800261 	mov	w1, #0x13                  	// #19
  ee830c:	97fa1f00 	bl	d6ff0c <JNI_OnUnload@@Base+0x17b58>
  ee8310:	b4001500 	cbz	x0, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee8314:	b9401808 	ldr	w8, [x0, #24]
  ee8318:	aa0003f4 	mov	x20, x0
  ee831c:	34001488 	cbz	w8, ee85ac <__start_il2cpp@@Base+0xd66c4>
  ee8320:	52800089 	mov	w9, #0x4                   	// #4
  ee8324:	7100051f 	cmp	w8, #0x1
  ee8328:	39008289 	strb	w9, [x20, #32]
  ee832c:	54001400 	b.eq	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.none
  ee8330:	90008c95 	adrp	x21, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee8334:	f94786b5 	ldr	x21, [x21, #3848]
  ee8338:	528000e8 	mov	w8, #0x7                   	// #7
  ee833c:	39008688 	strb	w8, [x20, #33]
  ee8340:	f94002a0 	ldr	x0, [x21]
  ee8344:	b940e008 	ldr	w8, [x0, #224]
  ee8348:	35000068 	cbnz	w8, ee8354 <__start_il2cpp@@Base+0xd646c>
  ee834c:	97fa1f14 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee8350:	f94002a0 	ldr	x0, [x21]
  ee8354:	f9405c08 	ldr	x8, [x0, #184]
  ee8358:	f9403509 	ldr	x9, [x8, #104]
  ee835c:	b40012a9 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee8360:	b9401928 	ldr	w8, [x9, #24]
  ee8364:	34001248 	cbz	w8, ee85ac <__start_il2cpp@@Base+0xd66c4>
  ee8368:	f9400e88 	ldr	x8, [x20, #24]
  ee836c:	7100091f 	cmp	w8, #0x2
  ee8370:	540011e9 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8374:	39408129 	ldrb	w9, [x9, #32]
  ee8378:	39008a89 	strb	w9, [x20, #34]
  ee837c:	f94002a9 	ldr	x9, [x21]
  ee8380:	f9405d29 	ldr	x9, [x9, #184]
  ee8384:	f9403529 	ldr	x9, [x9, #104]
  ee8388:	b4001149 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee838c:	b940192a 	ldr	w10, [x9, #24]
  ee8390:	7100055f 	cmp	w10, #0x1
  ee8394:	540010c9 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8398:	71000d1f 	cmp	w8, #0x3
  ee839c:	54001089 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee83a0:	39408529 	ldrb	w9, [x9, #33]
  ee83a4:	39008e89 	strb	w9, [x20, #35]
  ee83a8:	f94002a9 	ldr	x9, [x21]
  ee83ac:	f9405d29 	ldr	x9, [x9, #184]
  ee83b0:	f9403529 	ldr	x9, [x9, #104]
  ee83b4:	b4000fe9 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee83b8:	b940192a 	ldr	w10, [x9, #24]
  ee83bc:	7100095f 	cmp	w10, #0x2
  ee83c0:	54000f69 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee83c4:	7100111f 	cmp	w8, #0x4
  ee83c8:	54000f29 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee83cc:	39408929 	ldrb	w9, [x9, #34]
  ee83d0:	90008c95 	adrp	x21, 2078000 <_ZTVN10__cxxabiv120__si_class_type_infoE@@Base+0x300>
  ee83d4:	f946a2b5 	ldr	x21, [x21, #3392]
  ee83d8:	39009289 	strb	w9, [x20, #36]
  ee83dc:	f94002a0 	ldr	x0, [x21]
  ee83e0:	b940e009 	ldr	w9, [x0, #224]
  ee83e4:	35000069 	cbnz	w9, ee83f0 <__start_il2cpp@@Base+0xd6508>
  ee83e8:	97fa1eed 	bl	d6ff9c <JNI_OnUnload@@Base+0x17be8>
  ee83ec:	f9400e88 	ldr	x8, [x20, #24]
  ee83f0:	7100151f 	cmp	w8, #0x5
  ee83f4:	54000dc9 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee83f8:	f94002a9 	ldr	x9, [x21]
  ee83fc:	7100191f 	cmp	w8, #0x6
  ee8400:	f9405d29 	ldr	x9, [x9, #184]
  ee8404:	39404929 	ldrb	w9, [x9, #18]
  ee8408:	39009689 	strb	w9, [x20, #37]
  ee840c:	54000d00 	b.eq	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.none
  ee8410:	f94002a9 	ldr	x9, [x21]
  ee8414:	71001d1f 	cmp	w8, #0x7
  ee8418:	f9405d29 	ldr	x9, [x9, #184]
  ee841c:	39404d29 	ldrb	w9, [x9, #19]
  ee8420:	39009a89 	strb	w9, [x20, #38]
  ee8424:	54000c49 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8428:	f94002a9 	ldr	x9, [x21]
  ee842c:	f9405d29 	ldr	x9, [x9, #184]
  ee8430:	39405129 	ldrb	w9, [x9, #20]
  ee8434:	39009e89 	strb	w9, [x20, #39]
  ee8438:	f9401669 	ldr	x9, [x19, #40]
  ee843c:	b4000ba9 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee8440:	b940192a 	ldr	w10, [x9, #24]
  ee8444:	34000b4a 	cbz	w10, ee85ac <__start_il2cpp@@Base+0xd66c4>
  ee8448:	7100211f 	cmp	w8, #0x8
  ee844c:	54000b09 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8450:	39408129 	ldrb	w9, [x9, #32]
  ee8454:	3900a289 	strb	w9, [x20, #40]
  ee8458:	f9401669 	ldr	x9, [x19, #40]
  ee845c:	b4000aa9 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee8460:	b940192a 	ldr	w10, [x9, #24]
  ee8464:	7100055f 	cmp	w10, #0x1
  ee8468:	54000a29 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee846c:	7100251f 	cmp	w8, #0x9
  ee8470:	540009e9 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8474:	39408529 	ldrb	w9, [x9, #33]
  ee8478:	3900a689 	strb	w9, [x20, #41]
  ee847c:	f9401669 	ldr	x9, [x19, #40]
  ee8480:	b4000989 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee8484:	b940192a 	ldr	w10, [x9, #24]
  ee8488:	7100095f 	cmp	w10, #0x2
  ee848c:	54000909 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8490:	7100291f 	cmp	w8, #0xa
  ee8494:	540008c9 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8498:	39408929 	ldrb	w9, [x9, #34]
  ee849c:	3900aa89 	strb	w9, [x20, #42]
  ee84a0:	f9401669 	ldr	x9, [x19, #40]
  ee84a4:	b4000869 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee84a8:	b940192a 	ldr	w10, [x9, #24]
  ee84ac:	71000d5f 	cmp	w10, #0x3
  ee84b0:	540007e9 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee84b4:	71002d1f 	cmp	w8, #0xb
  ee84b8:	540007a9 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee84bc:	39408d29 	ldrb	w9, [x9, #35]
  ee84c0:	3900ae89 	strb	w9, [x20, #43]
  ee84c4:	f9401669 	ldr	x9, [x19, #40]
  ee84c8:	b4000749 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee84cc:	b940192a 	ldr	w10, [x9, #24]
  ee84d0:	7100115f 	cmp	w10, #0x4
  ee84d4:	540006c9 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee84d8:	7100311f 	cmp	w8, #0xc
  ee84dc:	54000689 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee84e0:	39409129 	ldrb	w9, [x9, #36]
  ee84e4:	3900b289 	strb	w9, [x20, #44]
  ee84e8:	f9401669 	ldr	x9, [x19, #40]
  ee84ec:	b4000629 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee84f0:	b940192a 	ldr	w10, [x9, #24]
  ee84f4:	7100155f 	cmp	w10, #0x5
  ee84f8:	540005a9 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee84fc:	7100351f 	cmp	w8, #0xd
  ee8500:	54000569 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8504:	39409529 	ldrb	w9, [x9, #37]
  ee8508:	3900b689 	strb	w9, [x20, #45]
  ee850c:	f9401669 	ldr	x9, [x19, #40]
  ee8510:	b4000509 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee8514:	b940192a 	ldr	w10, [x9, #24]
  ee8518:	7100195f 	cmp	w10, #0x6
  ee851c:	54000489 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8520:	7100391f 	cmp	w8, #0xe
  ee8524:	54000449 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8528:	39409929 	ldrb	w9, [x9, #38]
  ee852c:	3900ba89 	strb	w9, [x20, #46]
  ee8530:	f9401669 	ldr	x9, [x19, #40]
  ee8534:	b40003e9 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee8538:	b940192a 	ldr	w10, [x9, #24]
  ee853c:	71001d5f 	cmp	w10, #0x7
  ee8540:	54000369 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8544:	71003d1f 	cmp	w8, #0xf
  ee8548:	54000329 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee854c:	39409d29 	ldrb	w9, [x9, #39]
  ee8550:	3900be89 	strb	w9, [x20, #47]
  ee8554:	f9401669 	ldr	x9, [x19, #40]
  ee8558:	b40002c9 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee855c:	b940192a 	ldr	w10, [x9, #24]
  ee8560:	7100215f 	cmp	w10, #0x8
  ee8564:	54000249 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8568:	7100411f 	cmp	w8, #0x10
  ee856c:	54000209 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8570:	3940a129 	ldrb	w9, [x9, #40]
  ee8574:	3900c289 	strb	w9, [x20, #48]
  ee8578:	f9401669 	ldr	x9, [x19, #40]
  ee857c:	b40001a9 	cbz	x9, ee85b0 <__start_il2cpp@@Base+0xd66c8>
  ee8580:	b940192a 	ldr	w10, [x9, #24]
  ee8584:	7100255f 	cmp	w10, #0x9
  ee8588:	54000129 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee858c:	7100451f 	cmp	w8, #0x11
  ee8590:	540000e9 	b.ls	ee85ac <__start_il2cpp@@Base+0xd66c4>  // b.plast
  ee8594:	3940a528 	ldrb	w8, [x9, #41]
  ee8598:	aa1403e0 	mov	x0, x20
  ee859c:	3900c688 	strb	w8, [x20, #49]
  ee85a0:	a9414ff4 	ldp	x20, x19, [sp, #16]
  ee85a4:	a8c257fe 	ldp	x30, x21, [sp], #32
  ee85a8:	d65f03c0 	ret
  ee85ac:	97fa1ec6 	bl	d700c4 <JNI_OnUnload@@Base+0x17d10>
  ee85b0:	97fa1ec3 	bl	d700bc <JNI_OnUnload@@Base+0x17d08>
