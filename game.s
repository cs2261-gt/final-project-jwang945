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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L52
	mov	fp, #0
	ldr	r6, .L52+4
	ldr	r9, .L52+8
	sub	sp, sp, #20
	add	r8, r5, #280
	b	.L40
.L33:
	add	r5, r5, #28
	cmp	r5, r8
	add	r6, r6, #8
	beq	.L50
.L40:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L33
	ldmib	r5, {r2, r3}
	add	r3, r2, r3
	ldr	r4, .L52+12
	cmp	r3, #240
	mov	r10, #1
	str	r3, [r5, #4]
	strgt	fp, [r5, #20]
	add	r7, r4, #224
	b	.L38
.L36:
	add	r4, r4, #28
	cmp	r4, r7
	beq	.L51
.L38:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L36
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4]
	add	r3, r3, #8
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #12
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r9
	add	r4, r4, #28
	cmp	r0, #0
	strne	fp, [r5, #20]
	strne	r10, [r5, #24]
	cmp	r4, r7
	bne	.L38
.L51:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	movne	r3, #512
	moveq	r1, #384
	ldmeq	r5, {r2, r3}
	add	r5, r5, #28
	strhne	r3, [r6]	@ movhi
	strheq	r1, [r6, #4]	@ movhi
	strheq	r2, [r6]	@ movhi
	strheq	r3, [r6, #2]	@ movhi
	cmp	r5, r8
	add	r6, r6, #8
	bne	.L40
.L50:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	bullets
	.word	shadowOAM+112
	.word	collision
	.word	enemies
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
	ldr	r0, .L64
	mov	r3, #0
	mov	r2, r0
	b	.L57
.L55:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #28
	bxeq	lr
.L57:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L55
	push	{r4, r5, r6, lr}
	mov	r6, #1
	ldr	lr, .L64+4
	rsb	r3, r3, r3, lsl #3
	ldr	r2, [lr, #20]
	add	ip, r0, r3, lsl #2
	add	r5, r2, r2, lsr #31
	ldr	r4, [ip, #16]
	ldr	r2, [lr]
	add	r4, r4, r4, lsr #31
	add	r2, r2, r5, asr r6
	sub	r2, r2, r4, asr r6
	ldr	r4, [lr, #4]
	ldr	lr, [lr, #16]
	add	lr, r4, lr
	str	r6, [ip, #20]
	str	lr, [ip, #4]
	str	r1, [ip, #24]
	str	r2, [r0, r3, lsl #2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L65:
	.align	2
.L64:
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
	ldr	r3, .L94
	ldrh	r3, [r3]
	tst	r3, #64
	push	{r4, lr}
	bne	.L87
	ldr	r4, .L94+4
.L67:
	tst	r3, #128
	beq	.L68
	ldr	r2, .L94+8
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L90
.L68:
	tst	r3, #32
	beq	.L69
	ldr	r2, .L94+8
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L91
.L69:
	tst	r3, #16
	beq	.L70
	ldr	r2, .L94+8
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L92
.L70:
	tst	r3, #1
	beq	.L71
	ldr	r3, .L94+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L93
.L71:
	ldr	r3, [r4, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #0
	mvn	r3, r3, lsr #17
	ldr	r2, .L94+12
	ldr	r0, [r4]
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L87:
	ldr	r2, .L94+8
	ldrh	r2, [r2]
	tst	r2, #64
	ldr	r4, .L94+4
	bne	.L67
	ldr	r2, [r4]
	cmp	r2, #4
	ldrgt	r1, [r4, #12]
	subgt	r2, r2, r1
	strgt	r2, [r4]
	b	.L67
.L92:
	ldr	r2, [r4, #4]
	cmp	r2, #83
	ldrle	r1, [r4, #8]
	addle	r2, r1, r2
	strle	r2, [r4, #4]
	b	.L70
.L91:
	ldr	r2, [r4, #4]
	cmp	r2, #4
	ldrgt	r1, [r4, #8]
	subgt	r2, r2, r1
	strgt	r2, [r4, #4]
	b	.L69
.L90:
	ldr	r2, [r4]
	cmp	r2, #123
	ldrle	r1, [r4, #12]
	addle	r2, r1, r2
	strle	r2, [r4]
	b	.L68
.L93:
	bl	fireBullet
	b	.L71
.L95:
	.align	2
.L94:
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
	ldr	r3, .L98
	mov	lr, pc
	bx	r3
	ldr	r4, .L98+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L98+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L99:
	.align	2
.L98:
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
