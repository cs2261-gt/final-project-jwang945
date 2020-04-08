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
	push	{r4, lr}
	mov	r4, #0
	ldr	r1, .L4
	ldr	r2, .L4+4
	ldr	r3, .L4+8
	str	r4, [r1]
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	ip, .L4+12
	mov	r3, #256
	str	r4, [ip]
	mov	r2, #83886080
	ldr	r4, .L4+16
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	startScreenIndex
	.word	seed
	.word	waitForVBlank
	.word	state
	.word	DMANow
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
	mov	r3, #64
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
	ldr	r3, .L35
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r1, .L35+4
	ldr	r3, .L35+8
	ldr	r2, [r1]
	ldrh	r3, [r3]
	add	r2, r2, #1
	tst	r3, #128
	str	r2, [r1]
	beq	.L18
	ldr	r2, .L35+12
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L33
.L18:
	tst	r3, #64
	beq	.L19
	ldr	r2, .L35+12
	ldrh	r2, [r2]
	ands	r2, r2, #64
	beq	.L34
.L19:
	tst	r3, #8
	beq	.L17
	ldr	r3, .L35+12
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L17
	ldr	r3, .L35+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L21
	cmp	r3, #1
	beq	.L22
.L17:
	pop	{r4, lr}
	bx	lr
.L34:
	ldr	r1, .L35+16
	ldr	r0, [r1]
	cmp	r0, #1
	streq	r2, [r1]
	b	.L19
.L33:
	ldr	r2, .L35+16
	ldr	r1, [r2]
	cmp	r1, #0
	moveq	r1, #1
	streq	r1, [r2]
	b	.L18
.L22:
	pop	{r4, lr}
	b	goToInstructions
.L21:
	ldr	r3, .L35+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	startScreenIndex
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
	mov	lr, #4
	ldr	ip, .L57+4
	ldr	r4, .L57+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L57+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #320
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L57+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L57+20
	ldr	r1, .L57+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	waitForVBlank
	.word	state
	.word	DMANow
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
	.global	instruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	instruction, .-instruction
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
	mov	lr, #5
	ldr	ip, .L71+4
	ldr	r4, .L71+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L71+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #112
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L71+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L71+20
	ldr	r1, .L71+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	waitForVBlank
	.word	state
	.word	DMANow
	.word	losescreenPal
	.word	losescreenTiles
	.word	100696064
	.word	losescreenMap
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
	mov	r1, #4352
	push	{r4, r7, fp, lr}
	strh	r2, [r3, #8]	@ movhi
	ldr	r4, .L98
	ldr	fp, .L98+4
	ldrh	r2, [r4, #48]
	strh	r1, [r3]	@ movhi
	ldr	r3, .L98+8
	strh	r2, [fp]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L98+12
	ldr	r5, .L98+16
	ldr	r10, .L98+20
	ldr	r7, .L98+24
	ldr	r9, .L98+28
	ldr	r8, .L98+32
.L88:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L89:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L89
.L91:
	.word	.L94
	.word	.L90
	.word	.L93
	.word	.L92
	.word	.L90
	.word	.L90
.L90:
	mov	lr, pc
	bx	r7
	b	.L88
.L94:
	mov	lr, pc
	bx	r10
	b	.L88
.L92:
	mov	lr, pc
	bx	r8
	b	.L88
.L93:
	mov	lr, pc
	bx	r9
	b	.L88
.L99:
	.align	2
.L98:
	.word	67109120
	.word	buttons
	.word	goToStart
	.word	state
	.word	oldButtons
	.word	start
	.word	win
	.word	game
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
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	startScreenIndex,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
