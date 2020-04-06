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
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #4096
	mov	ip, #4352
	push	{r4, lr}
	mov	r4, #0
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L4
	ldr	r1, .L4+4
	ldrh	r0, [r2, #48]
	ldr	r2, .L4+8
	strh	ip, [r3]	@ movhi
	ldr	r3, .L4+12
	str	r4, [r2]
	strh	r0, [r1]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	67109120
	.word	buttons
	.word	seed
	.word	waitForVBlank
	.word	state
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
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
	ldr	r2, .L8
	ldr	r3, .L8+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+8
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	seed
	.word	waitForVBlank
	.word	state
	.size	goToStart, .-goToStart
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
	push	{r4, lr}
	ldr	r4, .L17
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+4
	ldr	r2, .L17+8
	ldr	r0, [r3]
	ldrh	r2, [r2]
	add	r0, r0, #1
	tst	r2, #8
	str	r0, [r3]
	beq	.L10
	ldr	r3, .L17+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L16
.L10:
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	r3, .L17+16
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L17+20
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	waitForVBlank
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.size	start, .-start
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
	ldr	r2, .L21
	push	{r4, lr}
	ldr	r0, [r2]
	ldr	r3, .L21+4
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L21+8
	ldr	r3, .L21+12
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	seed
	.word	srand
	.word	state
	.word	waitForVBlank
	.size	goToGame, .-goToGame
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
	ldr	r4, .L30
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L23
	ldr	r3, .L30+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L29
.L23:
	pop	{r4, lr}
	bx	lr
.L29:
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L30+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	game, .-game
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
	ldr	r3, .L34
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L34+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L48
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L37
	ldr	r2, .L48+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L46
.L37:
	tst	r3, #4
	beq	.L36
	ldr	r3, .L48+8
	ldrh	r3, [r3]
	ands	r5, r3, #4
	beq	.L47
.L36:
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	ldr	r2, .L48+12
	ldr	r3, .L48+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L48+20
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	ldr	r3, .L48+12
	str	r5, [r3]
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+20
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	srand
	.word	state
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
	ldr	r3, .L52
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L52+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
	.word	waitForVBlank
	.word	state
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L61
	mov	lr, pc
	bx	r5
	ldr	r3, .L61+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L54
	ldr	r3, .L61+8
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L60
.L54:
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	ldr	r3, .L61+12
	str	r4, [r3]
	mov	lr, pc
	bx	r5
	ldr	r3, .L61+16
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	state
	.size	win, .-win
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
	mov	r7, #0
	strh	r2, [r3, #8]	@ movhi
	ldr	r4, .L74
	ldr	r2, .L74+4
	ldrh	r1, [r4, #48]
	ldr	fp, .L74+8
	ldr	r6, .L74+12
	strh	r0, [r3]	@ movhi
	ldr	r3, .L74+16
	str	r7, [r2]
	strh	r1, [fp]	@ movhi
	ldr	r5, .L74+20
	mov	lr, pc
	bx	r3
	ldr	r10, .L74+24
	mov	r2, r7
	str	r7, [r6]
	ldr	r9, .L74+28
	ldr	r8, .L74+32
	ldr	r7, .L74+36
.L64:
	ldrh	r3, [fp]
.L65:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L65
.L67:
	.word	.L70
	.word	.L69
	.word	.L68
	.word	.L66
	.word	.L66
.L66:
	mov	lr, pc
	bx	r7
.L71:
	ldr	r2, [r6]
	b	.L64
.L68:
	mov	lr, pc
	bx	r8
	b	.L71
.L69:
	mov	lr, pc
	bx	r9
	b	.L71
.L70:
	mov	lr, pc
	bx	r10
	b	.L71
.L75:
	.align	2
.L74:
	.word	67109120
	.word	seed
	.word	buttons
	.word	state
	.word	waitForVBlank
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.size	main, .-main
	.text
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
	ldr	r3, .L78
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L78+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L79:
	.align	2
.L78:
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
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
