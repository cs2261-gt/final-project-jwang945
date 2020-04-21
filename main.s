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
	mov	r3, #560
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
	mov	r2, #4096
	mov	r0, #4352
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L7
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
	ldr	ip, .L11
	ldr	r4, .L11+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L11+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L11+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L11+16
	ldr	r1, .L11+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
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
	ldr	r3, .L20
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L20+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	pop	{r4, lr}
	b	goToStart
.L21:
	.align	2
.L20:
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
	ldr	r2, .L24
	push	{r4, lr}
	ldr	r0, [r2]
	ldr	r3, .L24+4
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L24+8
	ldr	r3, .L24+12
	ldr	r4, .L24+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L24+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L24+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L24+28
	ldr	r1, .L24+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r1, .L44
	ldr	r2, .L44+4
	ldr	r3, [r1]
	push	{r4, lr}
	ldr	r0, .L44+8
	ldr	lr, .L44+12
	ldrh	r2, [r2]
	add	r3, r3, #1
	str	r3, [r1]
	ldr	lr, [lr]
	ldr	r1, [r0]
	ldr	r3, .L44+16
	tst	r2, #128
	strh	r1, [r3]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	beq	.L27
	ldr	ip, .L44+20
	ldrh	ip, [ip]
	tst	ip, #128
	beq	.L42
.L27:
	tst	r2, #64
	beq	.L28
	ldr	r1, .L44+20
	ldrh	r1, [r1]
	ands	r1, r1, #64
	beq	.L43
.L28:
	tst	r2, #8
	beq	.L29
	ldr	r2, .L44+20
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L29
	mov	r1, #512
	ldr	r2, .L44+24
	ldr	r2, [r2]
	cmp	r2, #0
	strh	r1, [r3]	@ movhi
	beq	.L30
	cmp	r2, #1
	beq	.L31
.L29:
	ldr	r3, .L44+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L44+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L44+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L43:
	ldr	ip, .L44+24
	ldr	lr, [ip]
	cmp	lr, #1
	ldreq	lr, [r0]
	subeq	lr, lr, #20
	streq	r1, [ip]
	streq	lr, [r0]
	b	.L28
.L42:
	ldr	ip, .L44+24
	ldr	lr, [ip]
	cmp	lr, #0
	moveq	lr, #1
	addeq	r1, r1, #20
	streq	r1, [r0]
	streq	lr, [ip]
	b	.L27
.L31:
	bl	goToInstructions
	b	.L29
.L30:
	ldr	r3, .L44+40
	mov	lr, pc
	bx	r3
	bl	goToGame
	b	.L29
.L45:
	.align	2
.L44:
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
	ldr	r3, .L48
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L48+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
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
	ldr	r3, .L62
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L51
	ldr	r2, .L62+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L60
.L51:
	tst	r3, #4
	beq	.L50
	ldr	r3, .L62+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L61
.L50:
	pop	{r4, lr}
	bx	lr
.L60:
	pop	{r4, lr}
	b	goToGame
.L61:
	pop	{r4, lr}
	b	goToStart
.L63:
	.align	2
.L62:
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
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L66+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L66+12
	mov	lr, pc
	bx	r4
	mov	ip, #4
	ldr	r0, .L66+16
	mov	r3, #256
	str	ip, [r0]
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L66+20
	mov	lr, pc
	bx	r4
	mov	r3, #528
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L66+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L66+28
	ldr	r1, .L66+32
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldrh	r2, [r3]
	ldr	r1, .L66+36
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	mov	r0, #3
	mov	r3, #8128
	ldr	r2, .L66+40
	ldr	r1, .L66+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L66+48
	ldr	r1, .L66+52
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	ip, .L66+56
	ldr	r0, .L66+60
	ldr	r1, .L66+64
	ldr	r2, .L66+68
	str	r3, [ip]
	str	r3, [r0]
	strh	r3, [r1]	@ movhi
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L67:
	.align	2
.L66:
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
	ldr	r0, .L81
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
	ldr	ip, .L81+4
	orr	r3, r3, lr, lsr #17
	lsl	r3, r3, #16
	ldr	lr, .L81+8
	lsr	r3, r3, #16
	ldrh	r2, [ip]
	ldr	r5, .L81+12
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
	ldr	r3, .L81+16
	ldr	r4, .L81+20
	lsr	r2, r2, #16
	cmp	r2, r3
	ldrls	r3, [r4]
	addls	r3, r3, #1
	strls	r3, [r4]
	ldr	r3, .L81+24
	strh	r1, [r0]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r2, [r5]
	ldrh	r1, [r4]
	strh	r2, [r3, #18]	@ movhi
	ldr	r2, .L81+28
	strh	r1, [r3, #20]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #8
	beq	.L68
	ldr	r3, .L81+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L80
.L68:
	pop	{r4, r5, r6, lr}
	bx	lr
.L80:
	pop	{r4, r5, r6, lr}
	b	goToStart
.L82:
	.align	2
.L81:
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
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L85+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L85+12
	mov	lr, pc
	bx	r4
	mov	ip, #5
	ldr	r0, .L85+16
	mov	r3, #256
	str	ip, [r0]
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L85+20
	mov	lr, pc
	bx	r4
	mov	r3, #640
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L85+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L85+28
	ldr	r1, .L85+32
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldrh	r2, [r3]
	ldr	r1, .L85+36
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	mov	r0, #3
	mov	r3, #8128
	ldr	r2, .L85+40
	ldr	r1, .L85+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L85+48
	ldr	r1, .L85+52
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	ip, .L85+56
	ldr	r0, .L85+60
	ldr	r1, .L85+64
	ldr	r2, .L85+68
	str	r3, [ip]
	str	r3, [r0]
	strh	r3, [r1]	@ movhi
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L86:
	.align	2
.L85:
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
	ldr	r3, .L99
	ldr	r4, .L99+4
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r3, .L99+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L88
	ldr	r2, .L99+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L97
.L88:
	tst	r3, #2
	beq	.L87
	ldr	r3, .L99+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L98
.L87:
	pop	{r4, lr}
	bx	lr
.L97:
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L99+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L98:
	pop	{r4, lr}
	b	goToLose
.L100:
	.align	2
.L99:
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
	mov	r2, #4096
	mov	r0, #4352
	push	{r4, r7, fp, lr}
	strh	r2, [r3, #8]	@ movhi
	ldr	r4, .L113
	ldr	r8, .L113+4
	ldrh	r2, [r4, #48]
	strh	r0, [r3]	@ movhi
	ldr	r3, .L113+8
	strh	r2, [r8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L113+12
	ldr	r5, .L113+16
	ldr	fp, .L113+20
	ldr	r10, .L113+24
	ldr	r9, .L113+28
	ldr	r7, .L113+32
.L102:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L103:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L103
.L105:
	.word	.L109
	.word	.L108
	.word	.L107
	.word	.L106
	.word	.L104
	.word	.L104
.L104:
	mov	lr, pc
	bx	r7
	b	.L102
.L106:
	ldr	r3, .L113+36
	mov	lr, pc
	bx	r3
	b	.L102
.L107:
	mov	lr, pc
	bx	r9
	b	.L102
.L108:
	mov	lr, pc
	bx	r10
	b	.L102
.L109:
	mov	lr, pc
	bx	fp
	b	.L102
.L114:
	.align	2
.L113:
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
