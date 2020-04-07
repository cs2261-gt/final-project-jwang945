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
	mov	r1, #4
	str	lr, [sp, #-4]!
	mov	ip, #40
	mov	lr, #0
	mov	r0, #32
	ldr	r3, .L4
	ldr	r2, .L4+4
	str	r1, [r3]
	str	r1, [r3, #4]
	strh	r1, [r2]	@ movhi
	sub	r1, r1, #32768
	strh	lr, [r2, #4]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
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
	mov	r4, #84
	mov	r3, r5
	mov	lr, #164
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
	ldr	r2, .L18
	ldr	r1, .L18+4
	ldr	r5, .L18+8
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r2, .L18+12
	ldr	r1, .L18+16
	mov	r3, #16384
	mov	lr, pc
	bx	r5
	ldr	r3, .L18+20
	mov	lr, pc
	bx	r3
	mov	r4, #0
	mov	r2, #4
	mov	r7, #40
	mov	r6, #32
	ldr	r3, .L18+24
	ldr	r1, .L18+28
	ldr	r8, .L18+32
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	str	r2, [r8]
	str	r2, [r8, #4]
	str	r7, [r8, #8]
	str	r7, [r8, #12]
	str	r6, [r8, #16]
	str	r6, [r8, #20]
	bl	initEnemies
	mov	r2, r4
	mov	r0, r7
	mov	r1, r6
	ldr	r3, .L18+36
	add	ip, r3, #140
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
	mov	r4, #2
	mov	r1, #8
	mov	r2, #0
	ldr	r3, .L18+40
	ldr	lr, [r8]
	ldr	ip, [r8, #4]
	add	r0, r3, #280
.L14:
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r4, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L14
	ldr	r3, .L18+44
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L18+24
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	83886592
	.word	spritesheetPal
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	-32764
	.word	player
	.word	quarantines
	.word	bullets
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
	ldr	r3, .L24
	add	ip, r3, #140
.L21:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, ip
	bne	.L21
	bx	lr
.L25:
	.align	2
.L24:
	.word	quarantines
	.size	initQuarantines, .-initQuarantines
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #8
	mov	r4, #2
	mov	r2, #0
	ldr	r0, .L30
	ldr	r3, .L30+4
	ldr	lr, [r0]
	ldr	ip, [r0, #4]
	add	r0, r3, #280
.L27:
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r4, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L27
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	player
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #384
	mov	r4, #0
	ldr	r3, .L38
	ldr	r2, .L38+4
	add	r0, r3, #280
.L35:
	ldr	r1, [r3, #20]
	cmp	r1, #1
	bne	.L33
	ldmib	r3, {r1, ip}
	add	r1, r1, ip
	ldr	ip, [r3]
	cmp	r1, #240
	str	r1, [r3, #4]
	strgt	r4, [r3, #20]
	strh	r1, [r2, #114]	@ movhi
	strh	lr, [r2, #116]	@ movhi
	strh	ip, [r2, #112]	@ movhi
.L33:
	add	r3, r3, #28
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L35
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	bullets
	.word	shadowOAM
	.size	updateBullets, .-updateBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L50
	mov	r3, #0
	mov	r2, r0
	b	.L43
.L41:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #28
	bxeq	lr
.L43:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L41
	push	{r4, r5, lr}
	mov	r5, #1
	ldr	lr, .L50+4
	rsb	r3, r3, r3, lsl #3
	ldr	r2, [lr, #20]
	add	r4, r0, r3, lsl #2
	ldr	r1, [lr]
	ldr	ip, [r4, #16]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr r5
	ldr	r1, [lr, #4]
	ldr	lr, [lr, #16]
	add	ip, ip, ip, lsr #31
	sub	r2, r2, ip, asr r5
	add	r1, r1, lr
	str	r5, [r4, #20]
	str	r1, [r4, #4]
	str	r2, [r0, r3, lsl #2]
	pop	{r4, r5, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
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
	ldr	r3, .L80
	ldrh	r3, [r3]
	tst	r3, #64
	push	{r4, lr}
	bne	.L73
	ldr	r4, .L80+4
.L53:
	tst	r3, #128
	beq	.L54
	ldr	r2, .L80+8
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L76
.L54:
	tst	r3, #32
	beq	.L55
	ldr	r2, .L80+8
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L77
.L55:
	tst	r3, #16
	beq	.L56
	ldr	r2, .L80+8
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L78
.L56:
	tst	r3, #1
	beq	.L57
	ldr	r3, .L80+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L79
.L57:
	ldr	r3, [r4, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #0
	mvn	r3, r3, lsr #17
	ldr	r2, .L80+12
	ldr	r0, [r4]
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L73:
	ldr	r2, .L80+8
	ldrh	r2, [r2]
	tst	r2, #64
	ldr	r4, .L80+4
	bne	.L53
	ldr	r2, [r4]
	cmp	r2, #4
	ldrgt	r1, [r4, #12]
	subgt	r2, r2, r1
	strgt	r2, [r4]
	b	.L53
.L78:
	ldr	r2, [r4, #4]
	cmp	r2, #83
	ldrle	r1, [r4, #8]
	addle	r2, r1, r2
	strle	r2, [r4, #4]
	b	.L56
.L77:
	ldr	r2, [r4, #4]
	cmp	r2, #4
	ldrgt	r1, [r4, #8]
	subgt	r2, r2, r1
	strgt	r2, [r4, #4]
	b	.L55
.L76:
	ldr	r2, [r4]
	cmp	r2, #123
	ldrle	r1, [r4, #12]
	addle	r2, r1, r2
	strle	r2, [r4]
	b	.L54
.L79:
	bl	fireBullet
	b	.L57
.L81:
	.align	2
.L80:
	.word	oldButtons
	.word	player
	.word	buttons
	.word	shadowOAM
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
	push	{r4, lr}
	bl	updatePlayer
	bl	updateBullets
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r4, .L84+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L84+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.comm	bullets,280,4
	.comm	quarantines,140,4
	.comm	enemies,224,4
	.comm	player,24,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
