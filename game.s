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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHearts.part.0, %function
updateHearts.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #4
	mov	r0, #0
	ldr	r2, .L13
	ldr	r1, .L13+4
	str	r0, [r2, #32]
	ldr	r2, [r1, r3, lsl #4]
	cmp	r2, #0
	lsl	r2, r3, #4
	bne	.L12
.L2:
	subs	r3, r3, #1
	bxcc	lr
	ldr	r2, [r1, r3, lsl #4]
	cmp	r2, #0
	lsl	r2, r3, #4
	beq	.L2
.L12:
	str	lr, [sp, #-4]!
	mov	r0, #0
	mov	lr, #512
	ldr	r1, .L13+8
	ldr	ip, .L13+12
	add	r3, r3, #40
	lsl	r3, r3, #3
	add	r2, r1, r2
	strh	lr, [ip, r3]	@ movhi
	str	r0, [r2, #8]
	ldr	lr, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	player
	.word	hearts+8
	.word	hearts
	.word	shadowOAM
	.size	updateHearts.part.0, .-updateHearts.part.0
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #0
	mov	r3, #40
	mov	r8, #4
	mov	r10, #1
	mov	r9, #5
	mov	ip, #32
	mov	r2, r7
	mov	r6, #84
	mov	r5, #164
	mov	lr, #10
	ldr	r4, .L27
	mov	r0, r3
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	ldr	r3, .L27+4
	str	r8, [r4]
	strh	r8, [r3]	@ movhi
	str	r8, [r4, #4]
	sub	r8, r8, #32768
	strh	r7, [r3, #4]	@ movhi
	strh	r8, [r3, #2]	@ movhi
	ldr	r3, .L27+8
	str	r10, [r4, #24]
	str	r9, [r4, #28]
	str	r7, [r4, #32]
	mov	r1, ip
	str	ip, [r4, #16]
	str	ip, [r4, #20]
	add	ip, r3, #352
.L16:
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	lr, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	add	r3, r3, #44
	cmp	r3, ip
	bne	.L16
	ldr	r1, .L27+12
	ldr	r3, .L27+16
	str	r2, [r1]
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	ip, #40
	mov	r1, #32
	ldr	r3, .L27+20
	smull	r5, lr, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, lr, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	ldr	lr, .L27+24
	ldr	r3, .L27+28
	add	r0, r0, #100
	str	r0, [lr]
	add	r0, r3, #140
.L17:
	str	r2, [r3]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	stmib	r3, {r2, ip}
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L17
	mov	r5, #2
	mov	r1, #8
	mov	r2, #0
	ldr	r3, .L27+32
	ldr	lr, [r4]
	ldr	ip, [r4, #4]
	add	r0, r3, #280
.L18:
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r5, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L18
	mov	r2, #0
	mov	ip, #1
	mov	r1, #8
	ldr	r3, .L27+36
	add	r0, r3, #448
.L19:
	str	r2, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	stmib	r3, {r2, ip}
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L19
	mov	r1, #3
	mov	r0, #2
	mov	r4, #1
	mov	lr, #0
	mov	ip, #448
	ldr	r3, .L27+40
	ldr	r2, .L27+44
.L20:
	str	r1, [r3, #4]
	strh	r1, [r2, #2]	@ movhi
	add	r1, r1, #10
	cmp	r1, #53
	str	r0, [r3]
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	strh	r0, [r2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	add	r3, r3, #16
	add	r2, r2, #8
	bne	.L20
	ldr	r3, .L27+48
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+52
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L27+4
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	player
	.word	shadowOAM
	.word	enemies
	.word	enemiesOnScreen
	.word	rand
	.word	1374389535
	.word	enemySpawnRate
	.word	quarantines
	.word	syringes
	.word	rnas
	.word	hearts
	.word	shadowOAM+320
	.word	waitForVBlank
	.word	DMANow
	.size	initGame, .-initGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #5
	mov	r1, #4
	push	{r4, lr}
	mov	ip, #40
	mov	lr, #0
	mov	r4, #1
	mov	r0, #32
	ldr	r3, .L31
	str	r2, [r3, #28]
	ldr	r2, .L31+4
	str	r1, [r3]
	str	r1, [r3, #4]
	strh	r1, [r2]	@ movhi
	sub	r1, r1, #32768
	str	r4, [r3, #24]
	str	lr, [r3, #32]
	strh	lr, [r2, #4]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
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
	mov	r0, #40
	mov	r5, #84
	mov	r4, #164
	mov	r1, #32
	mov	lr, #10
	mov	r2, #0
	ldr	r3, .L37
	add	ip, r3, #352
.L34:
	str	r5, [r3]
	str	r4, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	lr, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	add	r3, r3, #44
	cmp	r3, ip
	bne	.L34
	pop	{r4, r5, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	enemies
	.size	initEnemies, .-initEnemies
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
	ldr	r3, .L43
	add	ip, r3, #140
.L40:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, ip
	bne	.L40
	bx	lr
.L44:
	.align	2
.L43:
	.word	quarantines
	.size	initQuarantines, .-initQuarantines
	.align	2
	.global	initSyringes
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSyringes, %function
initSyringes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #8
	mov	r4, #2
	mov	r2, #0
	ldr	r0, .L49
	ldr	r3, .L49+4
	ldr	lr, [r0]
	ldr	ip, [r0, #4]
	add	r0, r3, #280
.L46:
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r4, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L46
	pop	{r4, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	player
	.word	syringes
	.size	initSyringes, .-initSyringes
	.align	2
	.global	initRNAs
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRNAs, %function
initRNAs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	ip, #1
	mov	r1, #8
	ldr	r3, .L55
	add	r0, r3, #448
.L52:
	str	r2, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	stmib	r3, {r2, ip}
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L52
	bx	lr
.L56:
	.align	2
.L55:
	.word	rnas
	.size	initRNAs, .-initRNAs
	.align	2
	.global	initHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHearts, %function
initHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #3
	mov	r0, #2
	mov	r4, #1
	mov	lr, #0
	mov	ip, #448
	ldr	r3, .L61
	ldr	r2, .L61+4
.L58:
	str	r1, [r3, #4]
	strh	r1, [r2, #2]	@ movhi
	add	r1, r1, #10
	cmp	r1, #53
	str	r0, [r3]
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	strh	r0, [r2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	add	r3, r3, #16
	add	r2, r2, #8
	bne	.L58
	pop	{r4, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	hearts
	.word	shadowOAM+320
	.size	initHearts, .-initHearts
	.align	2
	.global	updateSyringes
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSyringes, %function
updateSyringes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L82
	ldr	r6, .L82+4
	ldr	r9, .L82+8
	ldr	fp, .L82+12
	sub	sp, sp, #20
	add	r8, r5, #280
	b	.L73
.L65:
	add	r5, r5, #28
	cmp	r5, r8
	add	r6, r6, #8
	beq	.L80
.L73:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L65
	ldmib	r5, {r2, r3}
	add	r3, r2, r3
	cmp	r3, #240
	str	r3, [r5, #4]
	movgt	r3, #0
	ldr	r4, .L82+16
	mov	r10, #0
	strgt	r3, [r5, #20]
	add	r7, r4, #352
	b	.L70
.L68:
	add	r4, r4, #44
	cmp	r4, r7
	beq	.L81
.L70:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L68
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
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
	cmp	r0, #0
	beq	.L68
	mov	r2, #1
	ldr	r3, [r4, #24]
	ldr	r1, [fp, #24]
	sub	r3, r3, r1
	str	r3, [r4, #24]
	add	r4, r4, #44
	cmp	r4, r7
	str	r10, [r5, #20]
	str	r2, [r5, #24]
	bne	.L70
.L81:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	movne	r3, #512
	strhne	r3, [r6]	@ movhi
	bne	.L65
	ldr	r3, [fp, #28]
	cmp	r3, #0
	ble	.L65
	mov	r3, #384
	ldr	r2, [r5]
	strh	r3, [r6, #4]	@ movhi
	add	r5, r5, #28
	ldr	r3, [r5, #-24]
	cmp	r5, r8
	strh	r2, [r6]	@ movhi
	strh	r3, [r6, #2]	@ movhi
	add	r6, r6, #8
	bne	.L73
.L80:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	syringes
	.word	shadowOAM+112
	.word	collision
	.word	player
	.word	enemies
	.size	updateSyringes, .-updateSyringes
	.align	2
	.global	updateRNAs
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRNAs, %function
updateRNAs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L97
	mov	r9, #512
	ldr	r6, .L97+4
	ldr	r5, .L97+8
	ldr	r8, .L97+12
	sub	sp, sp, #20
	add	r7, r4, #448
	b	.L92
.L96:
	mov	r2, #1
	mov	r1, #0
	ldr	r3, [r5, #28]
	sub	r3, r3, #1
	str	r3, [r5, #28]
	str	r1, [r4, #20]
	str	r2, [r4, #24]
	str	r2, [r5, #32]
.L89:
	strh	r9, [r6, #192]	@ movhi
.L86:
	add	r4, r4, #28
	cmp	r4, r7
	add	r6, r6, #8
	beq	.L95
.L92:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L86
	ldmib	r4, {r2, r3}
	sub	r3, r2, r3
	cmp	r3, #0
	movlt	r0, #0
	movlt	r2, #1
	strlt	r0, [r4, #20]
	strlt	r2, [r4, #24]
	str	r3, [r4, #4]
	add	r0, r4, #12
	ldm	r0, {r0, ip}
	ldr	r2, [r4]
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	add	r2, r5, #16
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L96
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L89
	ldr	r3, [r5, #28]
	cmp	r3, #0
	movgt	r1, #416
	ldmgt	r4, {r2, r3}
	add	r4, r4, #28
	strhgt	r1, [r6, #196]	@ movhi
	strhgt	r2, [r6, #192]	@ movhi
	strhgt	r3, [r6, #194]	@ movhi
	cmp	r4, r7
	add	r6, r6, #8
	bne	.L92
.L95:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	rnas
	.word	shadowOAM
	.word	player
	.word	collision
	.size	updateRNAs, .-updateRNAs
	.align	2
	.global	updateHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHearts, %function
updateHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L101
	ldr	r3, [r3, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateHearts.part.0
.L102:
	.align	2
.L101:
	.word	player
	.size	updateHearts, .-updateHearts
	.align	2
	.global	findSafeRowAndColForEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	findSafeRowAndColForEnemy, %function
findSafeRowAndColForEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, r0
	ldr	r5, .L115
	ldr	r8, .L115+4
	ldr	r6, .L115+8
.L106:
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	add	r4, r0, r0, lsl #2
	mov	lr, pc
	bx	r5
	mov	r1, #1
	smull	r3, r2, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr r1
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3
	add	r0, r0, r0, lsl #2
	lsl	r4, r4, #3
	lsl	r0, r0, #3
	ldr	r3, .L115+12
	add	r4, r4, #164
	add	r0, r0, #4
.L105:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L104
	ldr	r2, [r3, #4]
	cmp	r2, r4
	bne	.L104
	ldr	r2, [r3]
	cmp	r2, r0
	moveq	r1, #0
.L104:
	add	r3, r3, #44
	cmp	r3, r8
	bne	.L105
	cmp	r1, #0
	beq	.L106
	stm	r7, {r0, r4}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L116:
	.align	2
.L115:
	.word	rand
	.word	enemies+352
	.word	1717986919
	.word	enemies
	.size	findSafeRowAndColForEnemy, .-findSafeRowAndColForEnemy
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L146
	ldr	lr, [fp]
	cmp	lr, #7
	sub	sp, sp, #20
	bgt	.L118
	ldr	r0, .L146+4
	mov	r3, #0
	mov	r2, r0
.L120:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L143
	add	r3, r3, #1
	cmp	r3, #8
	add	r2, r2, #44
	bne	.L120
.L118:
	mov	r4, #0
	ldr	r2, .L146+8
	ldr	r3, .L146+4
	ldr	r6, [r2, #28]
	mov	r7, #512
	mov	r5, r4
	mov	r8, #1
	ldr	r2, .L146+12
	ldr	r10, .L146+16
	add	ip, r3, #352
	b	.L130
.L127:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	bne	.L128
	cmp	r6, #0
	ble	.L121
	mov	r9, #128	@ movhi
	ldm	r3, {r0, r1}
	orr	r1, r1, r10
	strh	r9, [r2, #12]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
.L121:
	add	r3, r3, #44
	cmp	r3, ip
	add	r2, r2, #8
	beq	.L144
.L130:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L121
	ldr	r1, [r3, #40]
	add	r1, r1, #1
	cmp	r1, #200
	str	r1, [r3, #40]
	beq	.L145
.L123:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	bgt	.L127
	mov	r4, #1
	str	r5, [r3, #28]
	str	r8, [r3, #32]
	sub	lr, lr, #1
.L128:
	add	r3, r3, #44
	cmp	r3, ip
	strh	r7, [r2, #8]	@ movhi
	add	r2, r2, #8
	bne	.L130
.L144:
	cmp	r4, #0
	strne	lr, [fp]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L145:
	mov	r0, #0
	str	r5, [r3, #40]
	ldr	r9, .L146+20
	b	.L125
.L124:
	add	r0, r0, #1
	cmp	r0, #16
	add	r9, r9, #28
	beq	.L123
.L125:
	ldr	r1, [r9, #20]
	cmp	r1, #0
	bne	.L124
	ldr	r9, .L146+20
	rsb	r0, r0, r0, lsl #3
	add	r9, r9, r0, lsl #2
	str	r0, [sp, #12]
	ldr	r0, [r3, #20]
	str	r9, [sp, #4]
	str	r1, [sp, #8]
	ldr	r9, [r9, #16]
	ldr	r1, [r3]
	add	r0, r0, r0, lsr #31
	add	r9, r9, r9, lsr #31
	add	r0, r1, r0, asr #1
	sub	r0, r0, r9, asr #1
	ldr	r1, [sp, #8]
	ldr	r9, [sp, #4]
	str	r1, [r9, #24]
	str	r8, [r9, #20]
	ldr	r1, [sp, #12]
	ldr	r9, .L146+20
	str	r0, [r9, r1, lsl #2]
	ldr	r1, [r3, #4]
	ldr	r9, [sp, #4]
	str	r1, [r9, #4]
	b	.L123
.L143:
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	add	r0, r0, r3, lsl #2
	ldr	r2, .L146+24
	ldr	r3, [r0, #36]
	ldr	r2, [r2]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #36]
	bne	.L118
	mov	r2, #1
	mov	r3, #10
	str	r1, [r0, #36]
	str	r1, [r0, #32]
	str	r2, [r0, #28]
	str	r3, [r0, #24]
	bl	findSafeRowAndColForEnemy
	ldr	lr, [fp]
	add	lr, lr, #1
	str	lr, [fp]
	b	.L118
.L147:
	.align	2
.L146:
	.word	enemiesOnScreen
	.word	enemies
	.word	player
	.word	shadowOAM
	.word	-32768
	.word	rnas
	.word	enemySpawnRate
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	fireSyringe
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireSyringe, %function
fireSyringe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L158
	mov	r3, #0
	mov	r2, r0
	b	.L151
.L149:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #28
	bxeq	lr
.L151:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L149
	push	{r4, r5, r6, lr}
	mov	r6, #1
	ldr	lr, .L158+4
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
.L159:
	.align	2
.L158:
	.word	syringes
	.word	player
	.size	fireSyringe, .-fireSyringe
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
	push	{r4, lr}
	ldr	r4, .L190
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L184
.L161:
	ldr	r3, .L190+4
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L162
	ldr	r2, .L190+8
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L185
.L162:
	tst	r3, #128
	beq	.L163
	ldr	r2, .L190+8
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L186
.L163:
	tst	r3, #32
	beq	.L164
	ldr	r2, .L190+8
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L187
.L164:
	tst	r3, #16
	beq	.L165
	ldr	r2, .L190+8
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L188
.L165:
	tst	r3, #1
	beq	.L166
	ldr	r3, .L190+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L189
.L166:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L160
	ldr	r3, [r4, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #0
	mvn	r3, r3, lsr #17
	ldr	r2, .L190+12
	ldr	r0, [r4]
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
.L160:
	pop	{r4, lr}
	bx	lr
.L188:
	ldr	r2, [r4, #4]
	cmp	r2, #83
	ldrle	r1, [r4, #8]
	addle	r2, r1, r2
	strle	r2, [r4, #4]
	b	.L165
.L187:
	ldr	r2, [r4, #4]
	cmp	r2, #4
	ldrgt	r1, [r4, #8]
	subgt	r2, r2, r1
	strgt	r2, [r4, #4]
	b	.L164
.L186:
	ldr	r2, [r4]
	cmp	r2, #123
	ldrle	r1, [r4, #12]
	addle	r2, r1, r2
	strle	r2, [r4]
	b	.L163
.L185:
	ldr	r2, [r4]
	cmp	r2, #4
	ldrgt	r1, [r4, #12]
	subgt	r2, r2, r1
	strgt	r2, [r4]
	b	.L162
.L184:
	ldr	r3, .L190+16
	mov	lr, pc
	bx	r3
	b	.L161
.L189:
	bl	fireSyringe
	b	.L166
.L191:
	.align	2
.L190:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.word	goToLose
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
	bl	updateEnemies
	bl	updateSyringes
	bl	updateRNAs
	ldr	r3, .L198
	ldr	r3, [r3, #32]
	cmp	r3, #0
	blne	updateHearts.part.0
.L193:
	ldr	r3, .L198+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L198+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L198+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L199:
	.align	2
.L198:
	.word	player
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.comm	enemySpawnRate,4,4
	.comm	enemiesOnScreen,4,4
	.comm	hearts,80,4
	.comm	rnas,448,4
	.comm	syringes,280,4
	.comm	quarantines,140,4
	.comm	enemies,352,4
	.comm	player,36,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
