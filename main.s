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
	ldr	r2, .L4
	ldr	r3, .L4+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	ip, .L4+8
	mov	r3, #256
	str	r4, [ip]
	mov	r2, #83886080
	ldr	r4, .L4+12
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
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
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L11
	push	{r4, lr}
	ldr	r0, [r2]
	ldr	r3, .L11+4
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L11+8
	ldr	r3, .L11+12
	ldr	r4, .L11+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L11+20
	mov	lr, pc
	bx	r4
	mov	r3, #464
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L11+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L11+28
	ldr	r1, .L11+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
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
	ldr	r3, .L20
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r2, .L20+4
	ldr	r1, .L20+8
	ldr	r3, [r2]
	ldrh	r1, [r1]
	add	r3, r3, #1
	tst	r1, #8
	str	r3, [r2]
	beq	.L13
	ldr	r3, .L20+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	pop	{r4, lr}
	b	goToGame
.L21:
	.align	2
.L20:
	.word	waitForVBlank
	.word	seed
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L24+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r3, .L38
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r2, .L38+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L36
.L27:
	tst	r3, #4
	beq	.L26
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L37
.L26:
	pop	{r4, lr}
	bx	lr
.L36:
	pop	{r4, lr}
	b	goToGame
.L37:
	pop	{r4, lr}
	b	goToStart
.L39:
	.align	2
.L38:
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
	push	{r4, r5, r6, lr}
	mov	r4, #3
	ldr	r3, .L42
	mov	lr, pc
	bx	r3
	ldr	ip, .L42+4
	ldr	r5, .L42+8
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L42+12
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #320
	mov	r2, #100663296
	ldr	r1, .L42+16
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L42+20
	ldr	r1, .L42+24
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	.align	2
.L42:
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
	ldr	r3, .L51
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L44
	ldr	r3, .L51+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
.L44:
	pop	{r4, lr}
	bx	lr
.L50:
	pop	{r4, lr}
	b	goToStart
.L52:
	.align	2
.L51:
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
	ldr	r3, .L55
	mov	lr, pc
	bx	r3
	mov	lr, #4
	ldr	ip, .L55+4
	ldr	r4, .L55+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L55+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #112
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L55+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L55+20
	ldr	r1, .L55+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L56:
	.align	2
.L55:
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
	ldr	r4, .L74
	mov	lr, pc
	bx	r4
	ldr	r3, .L74+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
	ldr	r2, .L74+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L71
.L58:
	tst	r3, #1
	beq	.L60
	ldr	r2, .L74+8
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L72
.L60:
	tst	r3, #2
	beq	.L57
	ldr	r3, .L74+8
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L73
.L57:
	pop	{r4, lr}
	bx	lr
.L71:
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L74+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L72:
	pop	{r4, lr}
	b	goToWin
.L73:
	pop	{r4, lr}
	b	goToLose
.L75:
	.align	2
.L74:
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
	ldr	r4, .L87
	ldr	fp, .L87+4
	ldrh	r2, [r4, #48]
	strh	r1, [r3]	@ movhi
	ldr	r3, .L87+8
	strh	r2, [fp]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L87+12
	ldr	r5, .L87+16
	ldr	r10, .L87+20
	ldr	r9, .L87+24
	ldr	r8, .L87+28
	ldr	r7, .L87+32
.L77:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L78:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L78
.L80:
	.word	.L83
	.word	.L82
	.word	.L81
	.word	.L79
	.word	.L79
.L79:
	mov	lr, pc
	bx	r7
	b	.L77
.L81:
	mov	lr, pc
	bx	r8
	b	.L77
.L82:
	mov	lr, pc
	bx	r9
	b	.L77
.L83:
	mov	lr, pc
	bx	r10
	b	.L77
.L88:
	.align	2
.L87:
	.word	67109120
	.word	buttons
	.word	goToStart
	.word	state
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
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
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
