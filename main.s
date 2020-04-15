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
	mov	ip, #8
	mov	r1, #102
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	r2, .L4
	ldr	r0, .L4+4
	ldr	r4, .L4+8
	str	ip, [r0]
	str	r1, [r2]
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r1, .L4+32
	ldr	r2, .L4+36
	ldr	r3, .L4+40
	str	r5, [r1]
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	ldr	r0, .L4+44
	mov	r3, #256
	str	r5, [r0]
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+48
	mov	lr, pc
	bx	r4
	mov	r3, #560
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+52
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+56
	ldr	r1, .L4+60
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	cursorRow
	.word	cursorCol
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	startScreenIndex
	.word	seed
	.word	waitForVBlank
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
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L15
	push	{r4, lr}
	ldr	r0, [r2]
	ldr	r3, .L15+4
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L15+8
	ldr	r3, .L15+12
	ldr	r4, .L15+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L15+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L15+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L15+28
	ldr	r1, .L15+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
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
	ldr	r1, .L35
	ldr	r2, .L35+4
	ldr	r3, [r1]
	push	{r4, lr}
	ldr	r0, .L35+8
	ldr	lr, .L35+12
	ldrh	r2, [r2]
	add	r3, r3, #1
	str	r3, [r1]
	ldr	lr, [lr]
	ldr	r1, [r0]
	ldr	r3, .L35+16
	tst	r2, #128
	strh	r1, [r3]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	beq	.L18
	ldr	ip, .L35+20
	ldrh	ip, [ip]
	tst	ip, #128
	beq	.L33
.L18:
	tst	r2, #64
	beq	.L19
	ldr	r1, .L35+20
	ldrh	r1, [r1]
	ands	r1, r1, #64
	beq	.L34
.L19:
	tst	r2, #8
	beq	.L20
	ldr	r2, .L35+20
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L20
	mov	r1, #512
	ldr	r2, .L35+24
	ldr	r2, [r2]
	cmp	r2, #0
	strh	r1, [r3]	@ movhi
	beq	.L21
	cmp	r2, #1
	beq	.L22
.L20:
	ldr	r3, .L35+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L35+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L34:
	ldr	ip, .L35+24
	ldr	lr, [ip]
	cmp	lr, #1
	ldreq	lr, [r0]
	subeq	lr, lr, #20
	streq	r1, [ip]
	streq	lr, [r0]
	b	.L19
.L33:
	ldr	ip, .L35+24
	ldr	lr, [ip]
	cmp	lr, #0
	moveq	lr, #1
	addeq	r1, r1, #20
	streq	r1, [r0]
	streq	lr, [ip]
	b	.L18
.L22:
	bl	goToInstructions
	b	.L20
.L21:
	ldr	r3, .L35+40
	mov	lr, pc
	bx	r3
	bl	goToGame
	b	.L20
.L36:
	.align	2
.L35:
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
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L39+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
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
	ldr	r3, .L53
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L42
	ldr	r2, .L53+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L51
.L42:
	tst	r3, #4
	beq	.L41
	ldr	r3, .L53+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L52
.L41:
	pop	{r4, lr}
	bx	lr
.L51:
	pop	{r4, lr}
	b	goToGame
.L52:
	pop	{r4, lr}
	b	goToStart
.L54:
	.align	2
.L53:
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
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L57+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+12
	mov	lr, pc
	bx	r4
	mov	ip, #4
	ldr	r0, .L57+16
	mov	r3, #256
	str	ip, [r0]
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L57+20
	mov	lr, pc
	bx	r4
	mov	r3, #320
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L57+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L57+28
	ldr	r1, .L57+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	state
	.word	winscreenPal
	.word	winscreenTiles
	.word	100696064
	.word	winscreenMap
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
	ldr	r3, .L66
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
	ldr	r3, .L66+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
.L59:
	pop	{r4, lr}
	bx	lr
.L65:
	pop	{r4, lr}
	b	goToStart
.L67:
	.align	2
.L66:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
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
	@ link register save eliminated.
	b	win
	.size	instructions, .-instructions
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
	ldr	r3, .L71
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L71+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L71+12
	mov	lr, pc
	bx	r4
	mov	ip, #5
	ldr	r0, .L71+16
	mov	r3, #256
	str	ip, [r0]
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L71+20
	mov	lr, pc
	bx	r4
	mov	r3, #640
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L71+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L71+28
	ldr	r1, .L71+32
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldrh	r2, [r3]
	ldr	r1, .L71+36
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	mov	r0, #3
	mov	r3, #8128
	ldr	r2, .L71+40
	ldr	r1, .L71+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L71+48
	ldr	r1, .L71+52
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	ip, .L71+56
	ldr	r0, .L71+60
	ldr	r1, .L71+64
	ldr	r2, .L71+68
	strh	r3, [ip]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L72:
	.align	2
.L71:
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
	ldr	r3, .L85
	ldr	r4, .L85+4
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r3, .L85+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L74
	ldr	r2, .L85+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L83
.L74:
	tst	r3, #2
	beq	.L73
	ldr	r3, .L85+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L84
.L73:
	pop	{r4, lr}
	bx	lr
.L83:
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L85+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L84:
	pop	{r4, lr}
	b	goToLose
.L86:
	.align	2
.L85:
	.word	updateGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	game, .-game
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
	ldr	r0, .L100
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
	ldr	ip, .L100+4
	orr	r3, r3, lr, lsr #17
	lsl	r3, r3, #16
	ldr	lr, .L100+8
	lsr	r3, r3, #16
	ldrh	r2, [ip]
	ldr	r5, .L100+12
	cmp	r3, lr
	ldrhls	r3, [r5]
	add	r2, r2, #1
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	subls	r3, r3, #1
	strhls	r3, [r5]	@ movhi
	add	r3, r2, r2, lsl #1
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	strh	r2, [ip]	@ movhi
	add	r2, r2, r3, lsl #2
	lsl	r2, r2, #16
	ldr	r3, .L100+16
	ldr	r4, .L100+20
	lsr	r2, r2, #16
	cmp	r2, r3
	ldrhls	r3, [r4]
	addls	r3, r3, #1
	strhls	r3, [r4]	@ movhi
	ldr	r3, .L100+24
	strh	r1, [r0]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r2, [r5]
	strh	r2, [r3, #18]	@ movhi
	ldrh	r1, [r4]
	ldr	r2, .L100+28
	strh	r1, [r3, #20]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #8
	beq	.L87
	ldr	r3, .L100+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L99
.L87:
	pop	{r4, r5, r6, lr}
	bx	lr
.L99:
	pop	{r4, r5, r6, lr}
	b	goToStart
.L101:
	.align	2
.L100:
	.word	vOffCounter
	.word	hOffCounter
	.word	6553
	.word	vOff
	.word	13107
	.word	hOff
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
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
	ldr	r4, .L114
	ldr	r8, .L114+4
	ldrh	r2, [r4, #48]
	strh	r0, [r3]	@ movhi
	ldr	r3, .L114+8
	strh	r2, [r8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L114+12
	ldr	r5, .L114+16
	ldr	fp, .L114+20
	ldr	r7, .L114+24
	ldr	r10, .L114+28
	ldr	r9, .L114+32
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
	.word	.L107
	.word	.L109
	.word	.L108
	.word	.L107
	.word	.L105
.L107:
	mov	lr, pc
	bx	r7
	b	.L103
.L110:
	mov	lr, pc
	bx	fp
	b	.L103
.L105:
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
.L115:
	.align	2
.L114:
	.word	67109120
	.word	buttons
	.word	goToStart
	.word	state
	.word	oldButtons
	.word	start
	.word	win
	.word	game
	.word	pause
	.word	lose
	.size	main, .-main
	.comm	seed,4,4
	.comm	vOffCounter,2,2
	.comm	hOffCounter,2,2
	.comm	vOff,2,2
	.comm	hOff,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	cursorCol,4,4
	.comm	cursorRow,4,4
	.comm	startScreenIndex,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
