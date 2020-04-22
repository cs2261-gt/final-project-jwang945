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
	mov	r0, #102
	mov	lr, #8
	ldrh	r2, [r7]
	ldr	r1, .L4+12
	strh	r2, [r3, #18]	@ movhi
	ldrh	r2, [r4]
	ldr	ip, .L4+16
	ldr	r4, .L4+20
	strh	r2, [r3, #20]	@ movhi
	str	r0, [r1]
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L4+32
	ldr	r2, .L4+36
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+44
	ldr	r3, .L4+48
	str	r5, [r2]
	str	r5, [r3]
	mov	lr, pc
	bx	r6
	ldr	ip, .L4+52
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+56
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #1744
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+60
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+64
	ldr	r1, .L4+68
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
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #0
	mov	ip, #4096
	mov	r0, #4352
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L7
	strh	r2, [r3, #10]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	ldr	r2, .L7+4
	ldrh	r1, [r1, #48]
	strh	r0, [r3]	@ movhi
	strh	r1, [r2]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions.part.0, %function
instructions.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #0
	mov	ip, #4096
	mov	r0, #4352
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L10
	strh	r2, [r3, #10]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	ldr	r2, .L10+4
	ldrh	r1, [r1, #48]
	strh	r0, [r3]	@ movhi
	strh	r1, [r2]	@ movhi
	b	goToStart
.L11:
	.align	2
.L10:
	.word	67109120
	.word	buttons
	.size	instructions.part.0, .-instructions.part.0
	.set	win.part.0,instructions.part.0
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
	ldr	ip, .L14
	ldr	r4, .L14+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L14+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #4352
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L14+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L14+16
	ldr	r1, .L14+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L15:
	.align	2
.L14:
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
	ldr	r3, .L23
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L16
	ldr	r3, .L23+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L22
.L16:
	pop	{r4, lr}
	bx	lr
.L22:
	pop	{r4, lr}
	b	instructions.part.0
.L24:
	.align	2
.L23:
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
	ldr	r2, .L27
	push	{r4, lr}
	ldr	r0, [r2]
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L27+8
	ldr	r3, .L27+12
	ldr	r4, .L27+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+28
	ldr	r1, .L27+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
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
	ldr	r1, .L47
	ldr	r2, .L47+4
	ldr	r3, [r1]
	push	{r4, lr}
	ldr	r0, .L47+8
	ldr	lr, .L47+12
	ldrh	r2, [r2]
	add	r3, r3, #1
	str	r3, [r1]
	ldr	lr, [lr]
	ldr	r1, [r0]
	ldr	r3, .L47+16
	tst	r2, #128
	strh	r1, [r3]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	beq	.L30
	ldr	ip, .L47+20
	ldrh	ip, [ip]
	tst	ip, #128
	beq	.L45
.L30:
	tst	r2, #64
	beq	.L31
	ldr	r1, .L47+20
	ldrh	r1, [r1]
	ands	r1, r1, #64
	beq	.L46
.L31:
	tst	r2, #8
	beq	.L32
	ldr	r2, .L47+20
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L32
	mov	r1, #512
	ldr	r2, .L47+24
	ldr	r2, [r2]
	cmp	r2, #0
	strh	r1, [r3]	@ movhi
	beq	.L33
	cmp	r2, #1
	beq	.L34
.L32:
	ldr	r3, .L47+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L47+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L47+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L46:
	ldr	ip, .L47+24
	ldr	lr, [ip]
	cmp	lr, #1
	ldreq	lr, [r0]
	subeq	lr, lr, #20
	streq	r1, [ip]
	streq	lr, [r0]
	b	.L31
.L45:
	ldr	ip, .L47+24
	ldr	lr, [ip]
	cmp	lr, #0
	moveq	lr, #1
	addeq	r1, r1, #20
	streq	r1, [r0]
	streq	lr, [ip]
	b	.L30
.L34:
	bl	goToInstructions
	b	.L32
.L33:
	ldr	r3, .L47+40
	mov	lr, pc
	bx	r3
	bl	goToGame
	b	.L32
.L48:
	.align	2
.L47:
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
	ldr	r3, .L51
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L51+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
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
	ldr	r3, .L65
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L54
	ldr	r2, .L65+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L63
.L54:
	tst	r3, #4
	beq	.L53
	ldr	r3, .L65+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L64
.L53:
	pop	{r4, lr}
	bx	lr
.L63:
	pop	{r4, lr}
	b	goToGame
.L64:
	pop	{r4, lr}
	b	goToStart
.L66:
	.align	2
.L65:
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
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L69+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L69+12
	mov	lr, pc
	bx	r4
	mov	ip, #4
	ldr	r0, .L69+16
	mov	r3, #256
	str	ip, [r0]
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L69+20
	mov	lr, pc
	bx	r4
	mov	r3, #528
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L69+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L69+28
	ldr	r1, .L69+32
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldrh	r2, [r3]
	ldr	r1, .L69+36
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	mov	r0, #3
	mov	r3, #8128
	ldr	r2, .L69+40
	ldr	r1, .L69+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L69+48
	ldr	r1, .L69+52
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	ip, .L69+56
	ldr	r0, .L69+60
	ldr	r1, .L69+64
	ldr	r2, .L69+68
	str	r3, [ip]
	str	r3, [r0]
	strh	r3, [r1]	@ movhi
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L70:
	.align	2
.L69:
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
	ldr	r0, .L84
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
	ldr	ip, .L84+4
	orr	r3, r3, lr, lsr #17
	lsl	r3, r3, #16
	ldr	lr, .L84+8
	lsr	r3, r3, #16
	ldrh	r2, [ip]
	ldr	r5, .L84+12
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
	ldr	r3, .L84+16
	ldr	r4, .L84+20
	lsr	r2, r2, #16
	cmp	r2, r3
	ldrls	r3, [r4]
	addls	r3, r3, #1
	strls	r3, [r4]
	ldr	r3, .L84+24
	strh	r1, [r0]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r2, [r5]
	ldrh	r1, [r4]
	strh	r2, [r3, #18]	@ movhi
	ldr	r2, .L84+28
	strh	r1, [r3, #20]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #8
	beq	.L71
	ldr	r3, .L84+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L83
.L71:
	pop	{r4, r5, r6, lr}
	bx	lr
.L83:
	pop	{r4, r5, r6, lr}
	b	win.part.0
.L85:
	.align	2
.L84:
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
	ldr	r3, .L88
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L88+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L88+12
	mov	lr, pc
	bx	r4
	mov	ip, #5
	ldr	r0, .L88+16
	mov	r3, #256
	str	ip, [r0]
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L88+20
	mov	lr, pc
	bx	r4
	mov	r3, #640
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L88+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L88+28
	ldr	r1, .L88+32
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldrh	r2, [r3]
	ldr	r1, .L88+36
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	mov	r0, #3
	mov	r3, #8128
	ldr	r2, .L88+40
	ldr	r1, .L88+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L88+48
	ldr	r1, .L88+52
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	ip, .L88+56
	ldr	r0, .L88+60
	ldr	r1, .L88+64
	ldr	r2, .L88+68
	str	r3, [ip]
	str	r3, [r0]
	strh	r3, [r1]	@ movhi
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L89:
	.align	2
.L88:
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
	ldr	r3, .L102
	ldr	r4, .L102+4
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r3, .L102+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L91
	ldr	r2, .L102+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L100
.L91:
	tst	r3, #2
	beq	.L90
	ldr	r3, .L102+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L101
.L90:
	pop	{r4, lr}
	bx	lr
.L100:
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L102+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L101:
	pop	{r4, lr}
	b	goToLose
.L103:
	.align	2
.L102:
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
	mov	r3, #67108864
	mov	r2, #0
	mov	r1, #4096
	mov	r0, #4352
	push	{r4, r7, fp, lr}
	strh	r2, [r3, #8]	@ movhi
	ldr	r4, .L116
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r8, .L116+4
	ldrh	r2, [r4, #48]
	strh	r0, [r3]	@ movhi
	ldr	r3, .L116+8
	strh	r2, [r8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L116+12
	ldr	r5, .L116+16
	ldr	fp, .L116+20
	ldr	r10, .L116+24
	ldr	r9, .L116+28
	ldr	r7, .L116+32
.L105:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L106:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L106
.L108:
	.word	.L112
	.word	.L111
	.word	.L110
	.word	.L109
	.word	.L107
	.word	.L107
.L107:
	mov	lr, pc
	bx	r7
	b	.L105
.L109:
	ldr	r3, .L116+36
	mov	lr, pc
	bx	r3
	b	.L105
.L110:
	mov	lr, pc
	bx	r9
	b	.L105
.L111:
	mov	lr, pc
	bx	r10
	b	.L105
.L112:
	mov	lr, pc
	bx	fp
	b	.L105
.L117:
	.align	2
.L116:
	.word	67109120
	.word	buttons
	.word	goToStart
	.word	state
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	win
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
	.ident	"GCC: (devkitARM release 53) 9.1.0"
