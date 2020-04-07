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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	ip, #40
	mov	r0, #32
	mov	lr, #32768
	ldr	r3, .L4
	ldr	r1, .L4+4
	stmib	r3, {r2, ip}
	strh	lr, [r1, #2]	@ movhi
	str	r2, [r3]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	strh	r2, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	shadowOAM
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r5, .L10
	mov	r4, #80
	mov	r3, r5
	mov	lr, #160
	mov	r1, #40
	mov	r2, #32
	mov	ip, #0
	add	r0, r5, #224
.L7:
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	ip, [r3, #24]
	stm	r3, {r4, lr}
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L7
	ldr	r3, [r5, #4]
	mvn	r3, r3, lsl #17
	mov	r0, #128
	mvn	r3, r3, lsr #17
	mov	r1, #1
	ldr	r2, .L10+4
	ldr	ip, [r5]
	str	r1, [r5, #24]
	strh	r3, [r2, #10]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	enemies
	.word	shadowOAM
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L16
	ldr	r1, .L16+4
	ldr	r7, .L16+8
	mov	lr, pc
	bx	r7
	mov	r0, #3
	ldr	r2, .L16+12
	ldr	r1, .L16+16
	mov	r3, #480
	mov	lr, pc
	bx	r7
	ldr	r3, .L16+20
	mov	lr, pc
	bx	r3
	mov	r4, #0
	mov	r1, #32768
	mov	r6, #40
	mov	r5, #32
	ldr	r2, .L16+24
	ldr	r3, .L16+28
	strh	r1, [r2, #2]	@ movhi
	strh	r4, [r2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	stmib	r3, {r4, r6}
	str	r4, [r3]
	str	r6, [r3, #12]
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	bl	initEnemies
	mov	r2, r4
	mov	r0, r6
	mov	r1, r5
	ldr	r3, .L16+32
	add	ip, r3, #112
.L13:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, ip
	bne	.L13
	ldr	r3, .L16+36
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r7
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	83886592
	.word	spritesheetPal
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	player
	.word	quarantines
	.word	waitForVBlank
	.size	initGame, .-initGame
	.align	2
	.global	initQuarantines
	.syntax unified
	.arm
	.fpu softvfp
	.type	initQuarantines, %function
initQuarantines:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r0, #40
	mov	r1, #32
	ldr	r3, .L22
	add	ip, r3, #112
.L19:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, ip
	bne	.L19
	bx	lr
.L23:
	.align	2
.L22:
	.word	quarantines
	.size	initQuarantines, .-initQuarantines
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L45
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L25
	ldr	r2, .L45+4
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L41
.L25:
	tst	r3, #128
	beq	.L26
	ldr	r2, .L45+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L42
.L26:
	tst	r3, #32
	beq	.L27
	ldr	r2, .L45+4
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L43
.L27:
	tst	r3, #16
	bxeq	lr
.L44:
	ldr	r3, .L45+4
	ldrh	r3, [r3]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L45+8
	ldr	r2, [r3, #4]
	cmp	r2, #83
	ldrle	r1, [r3, #8]
	addle	r2, r1, r2
	strle	r2, [r3, #4]
	bx	lr
.L43:
	ldr	r1, .L45+8
	ldr	r2, [r1, #4]
	cmp	r2, #4
	ldrgt	r0, [r1, #8]
	subgt	r2, r2, r0
	strgt	r2, [r1, #4]
	tst	r3, #16
	bxeq	lr
	b	.L44
.L42:
	ldr	r2, .L45+8
	ldr	r1, [r2]
	cmp	r1, #123
	ldrle	r0, [r2, #12]
	addle	r1, r0, r1
	strle	r1, [r2]
	b	.L26
.L41:
	ldr	r1, .L45+8
	ldr	r2, [r1]
	cmp	r2, #4
	ldrgt	r0, [r1, #12]
	subgt	r2, r2, r0
	strgt	r2, [r1]
	b	.L25
.L46:
	.align	2
.L45:
	.word	oldButtons
	.word	buttons
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updatePlayer
	.size	updateGame, .-updateGame
	.comm	quarantines,112,4
	.comm	enemies,224,4
	.comm	player,24,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
