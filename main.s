	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r4, .L4
	ldr	r7, .L4+4
	ldr	r6, .L4+8
	str	r5, [r4]
	str	r5, [r7]
	mov	lr, pc
	bx	r6
	mov	r3, #67108864
	mov	r8, #102
	mov	lr, #8
	ldrh	r2, [r7]
	ldr	r0, .L4+12
	strh	r2, [r3, #18]	@ movhi
	ldrh	r2, [r4]
	ldr	ip, .L4+16
	strh	r2, [r3, #20]	@ movhi
	ldr	r1, .L4+20
	str	r8, [r0]
	mov	r2, #1
	ldr	r0, .L4+24
	ldr	r3, .L4+28
	str	lr, [ip]
	ldr	r4, .L4+32
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L4+44
	ldr	r2, .L4+48
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+52
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+56
	ldr	r3, .L4+60
	str	r5, [r2]
	str	r5, [r3]
	mov	lr, pc
	bx	r6
	ldr	ip, .L4+64
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+68
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #1744
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+72
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+76
	ldr	r1, .L4+80
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hOff
	.word	vOff
	.word	waitForVBlank
	.word	cursorRow
	.word	cursorCol
	.word	1772064
	.word	backgroundmusic
	.word	playSoundA
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	100728832
	.word	hideSprites
	.word	startScreenIndex
	.word	seed
	.word	state
	.word	startscreenPal
	.word	startscreenTiles
	.word	100696064
	.word	startscreenMap
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #4096
	mov	r1, #4352
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r1, .L8
	strh	r0, [r3, #8]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L8+8
	ldr	r3, .L8+12
	ldrh	r2, [r2, #48]
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	setupSounds
	.word	setupInterrupts
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #1
	ldr	ip, .L12
	ldr	r4, .L12+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #4352
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	state
	.word	DMANow
	.word	instructionsscreenPal
	.word	instructionsscreenTiles
	.word	100696064
	.word	instructionsscreenMap
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L21
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	pop	{r4, lr}
	b	initialize
.L22:
	.align	2
.L21:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L25
	push	{r4, lr}
	ldr	r0, [r2]
	ldr	r3, .L25+4
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L25+8
	ldr	r3, .L25+12
	ldr	r4, .L25+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L25+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L25+28
	ldr	r1, .L25+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	seed
	.word	srand
	.word	state
	.word	waitForVBlank
	.word	DMANow
	.word	mainscreenPal
	.word	mainscreenTiles
	.word	100696064
	.word	mainscreenMap
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #384
	ldr	r1, .L45
	ldr	r2, .L45+4
	ldr	r3, [r1]
	push	{r4, lr}
	ldr	r0, .L45+8
	ldr	lr, .L45+12
	ldrh	r2, [r2]
	add	r3, r3, #1
	str	r3, [r1]
	ldr	lr, [lr]
	ldr	r1, [r0]
	ldr	r3, .L45+16
	tst	r2, #128
	strh	r1, [r3]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	beq	.L28
	ldr	ip, .L45+20
	ldrh	ip, [ip]
	tst	ip, #128
	beq	.L43
.L28:
	tst	r2, #64
	beq	.L29
	ldr	r1, .L45+20
	ldrh	r1, [r1]
	ands	r1, r1, #64
	beq	.L44
.L29:
	tst	r2, #8
	beq	.L30
	ldr	r2, .L45+20
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L30
	mov	r1, #512
	ldr	r2, .L45+24
	ldr	r2, [r2]
	cmp	r2, #0
	strh	r1, [r3]	@ movhi
	beq	.L31
	cmp	r2, #1
	beq	.L32
.L30:
	ldr	r3, .L45+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L45+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L44:
	ldr	ip, .L45+24
	ldr	lr, [ip]
	cmp	lr, #1
	ldreq	lr, [r0]
	subeq	lr, lr, #20
	streq	r1, [ip]
	streq	lr, [r0]
	b	.L29
.L43:
	ldr	ip, .L45+24
	ldr	lr, [ip]
	cmp	lr, #0
	moveq	lr, #1
	addeq	r1, r1, #20
	streq	r1, [r0]
	streq	lr, [ip]
	b	.L28
.L32:
	bl	goToInstructions
	b	.L30
.L31:
	ldr	r3, .L45+40
	mov	lr, pc
	bx	r3
	bl	goToGame
	b	.L30
.L46:
	.align	2
.L45:
	.word	seed
	.word	oldButtons
	.word	cursorRow
	.word	cursorCol
	.word	shadowOAM+1016
	.word	buttons
	.word	startScreenIndex
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L49
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L49+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L63
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L52
	ldr	r2, .L63+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L61
.L52:
	tst	r3, #4
	beq	.L51
	ldr	r3, .L63+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L62
.L51:
	pop	{r4, lr}
	bx	lr
.L61:
	pop	{r4, lr}
	b	goToGame
.L62:
	pop	{r4, lr}
	b	goToStart
.L64:
	.align	2
.L63:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L67
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L67+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L67+12
	mov	lr, pc
	bx	r4
	mov	ip, #4
	ldr	r0, .L67+16
	mov	r3, #256
	str	ip, [r0]
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L67+20
	mov	lr, pc
	bx	r4
	mov	r3, #528
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L67+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L67+28
	ldr	r1, .L67+32
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldrh	r2, [r3]
	ldr	r1, .L67+36
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	mov	r0, #3
	mov	r3, #8128
	ldr	r2, .L67+40
	ldr	r1, .L67+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L67+48
	ldr	r1, .L67+52
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	ip, .L67+56
	ldr	r0, .L67+60
	ldr	r1, .L67+64
	ldr	r2, .L67+68
	str	r3, [ip]
	str	r3, [r0]
	strh	r3, [r1]	@ movhi
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	state
	.word	winscreenPal
	.word	winscreenTiles
	.word	100696064
	.word	winscreenMap
	.word	4356
	.word	100679680
	.word	retrobackgroundTiles
	.word	100698112
	.word	retrobackgroundMap
	.word	hOff
	.word	vOff
	.word	vOffCounter
	.word	hOffCounter
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L82
	ldrh	r1, [r0]
	add	r1, r1, #1
	lsl	r1, r1, #16
	lsr	r1, r1, #16
	add	r2, r1, r1, lsl #1
	add	r2, r2, r2, lsl #4
	add	r2, r2, r2, lsl #8
	add	r2, r1, r2, lsl #2
	push	{r4, r5, r6, lr}
	lsl	r3, r2, #15
	lsl	lr, r2, #16
	ldr	ip, .L82+4
	orr	r3, r3, lr, lsr #17
	lsl	r3, r3, #16
	ldr	lr, .L82+8
	lsr	r3, r3, #16
	ldrh	r2, [ip]
	ldr	r5, .L82+12
	cmp	r3, lr
	ldrls	r3, [r5]
	add	r2, r2, #1
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	subls	r3, r3, #1
	strls	r3, [r5]
	add	r3, r2, r2, lsl #1
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	strh	r2, [ip]	@ movhi
	add	r2, r2, r3, lsl #2
	lsl	r2, r2, #16
	ldr	r3, .L82+16
	ldr	r4, .L82+20
	lsr	r2, r2, #16
	cmp	r2, r3
	ldrls	r3, [r4]
	addls	r3, r3, #1
	strls	r3, [r4]
	ldr	r3, .L82+24
	strh	r1, [r0]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r2, [r5]
	ldrh	r1, [r4]
	strh	r2, [r3, #18]	@ movhi
	ldr	r2, .L82+28
	strh	r1, [r3, #20]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #8
	beq	.L69
	ldr	r3, .L82+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L81
.L69:
	pop	{r4, r5, r6, lr}
	bx	lr
.L81:
	pop	{r4, r5, r6, lr}
	b	initialize
.L83:
	.align	2
.L82:
	.word	vOffCounter
	.word	hOffCounter
	.word	6553
	.word	vOff
	.word	13107
	.word	hOff
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L86
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L86+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L86+12
	mov	lr, pc
	bx	r4
	mov	ip, #5
	ldr	r0, .L86+16
	mov	r3, #256
	str	ip, [r0]
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L86+20
	mov	lr, pc
	bx	r4
	mov	r3, #640
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L86+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L86+28
	ldr	r1, .L86+32
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldrh	r2, [r3]
	ldr	r1, .L86+36
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	mov	r0, #3
	mov	r3, #8128
	ldr	r2, .L86+40
	ldr	r1, .L86+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L86+48
	ldr	r1, .L86+52
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	ip, .L86+56
	ldr	r0, .L86+60
	ldr	r1, .L86+64
	ldr	r2, .L86+68
	str	r3, [ip]
	str	r3, [r0]
	strh	r3, [r1]	@ movhi
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	state
	.word	losescreenPal
	.word	losescreenTiles
	.word	100696064
	.word	losescreenMap
	.word	4356
	.word	100679680
	.word	retrobackgroundTiles
	.word	100698112
	.word	retrobackgroundMap
	.word	hOff
	.word	vOff
	.word	vOffCounter
	.word	hOffCounter
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L100
	ldr	r4, .L100+4
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r3, .L100+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L89
	ldr	r2, .L100+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L98
.L89:
	tst	r3, #2
	beq	.L88
	ldr	r3, .L100+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L99
.L88:
	pop	{r4, lr}
	bx	lr
.L98:
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L100+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L99:
	pop	{r4, lr}
	b	goToLose
.L101:
	.align	2
.L100:
	.word	updateGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L114
	mov	lr, pc
	bx	r3
	ldr	r6, .L114+4
	ldr	r8, .L114+8
	ldr	r5, .L114+12
	ldr	fp, .L114+16
	ldr	r10, .L114+20
	ldr	r9, .L114+24
	ldr	r7, .L114+28
	ldr	r4, .L114+32
.L103:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L104:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L104
.L106:
	.word	.L110
	.word	.L109
	.word	.L108
	.word	.L107
	.word	.L105
	.word	.L105
.L105:
	mov	lr, pc
	bx	r7
	b	.L103
.L107:
	ldr	r3, .L114+36
	mov	lr, pc
	bx	r3
	b	.L103
.L108:
	mov	lr, pc
	bx	r9
	b	.L103
.L109:
	mov	lr, pc
	bx	r10
	b	.L103
.L110:
	mov	lr, pc
	bx	fp
	b	.L103
.L115:
	.align	2
.L114:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	win
	.word	67109120
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	seed,4,4
	.comm	vOffCounter,2,2
	.comm	hOffCounter,2,2
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	cursorCol,4,4
	.comm	cursorRow,4,4
	.comm	startScreenIndex,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
