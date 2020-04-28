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
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	mov	r0, #4
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r4, #40
	mov	lr, #32
	mov	r5, #5
	mov	ip, #1
	ldr	r3, .L17
	str	r1, [r3, #40]
	ldr	r1, .L17+4
	str	r0, [r3]
	str	r0, [r3, #4]
	strh	r0, [r1]	@ movhi
	sub	r0, r0, #32768
	str	r5, [r3, #28]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r2, [r3, #32]
	strh	r2, [r1, #4]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	ip, [r3, #24]
	str	ip, [r3, #36]
	pop	{r4, r5, lr}
	bx	lr
.L18:
	.align	2
.L17:
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
	push	{r4, r5, r6, r7, lr}
	mov	r0, #40
	mov	r7, #84
	mov	r6, #164
	mov	r1, #32
	mov	r5, #10
	mov	r2, #0
	mov	r4, #1
	mov	lr, #4
	ldr	r3, .L23
	add	ip, r3, #448
.L20:
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r4, [r3, #44]
	str	lr, [r3, #48]
	str	r2, [r3, #52]
	add	r3, r3, #56
	cmp	r3, ip
	bne	.L20
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	enemies
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
	mov	r5, #0
	bl	initPlayer
	bl	initEnemies
	ldr	r3, .L35
	ldr	r4, .L35+4
	str	r5, [r3]
	mov	lr, pc
	bx	r4
	mov	lr, #4
	mov	r6, #1
	mov	ip, #40
	mov	r1, #32
	ldr	r3, .L35+8
	smull	r8, r7, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr lr
	add	r3, r3, r3, lsl #2
	ldr	r7, .L35+12
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl r6
	mov	r2, r5
	str	r5, [r7]
	ldr	r3, .L35+16
	ldr	r5, .L35+20
	add	r0, r0, #150
	str	r0, [r5]
	add	r0, r3, #260
.L26:
	str	r2, [r3]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r6, [r3, #36]
	str	lr, [r3, #40]
	str	r2, [r3, #44]
	stmib	r3, {r2, ip}
	add	r3, r3, #52
	cmp	r3, r0
	bne	.L26
	ldr	r3, .L35+24
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	mov	r4, #2
	mov	r1, #8
	mov	r2, #0
	ldr	r3, .L35+8
	smull	lr, ip, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #5
	add	r3, r3, r3, lsl r4
	add	r3, r3, r3, lsl r4
	ldr	lr, .L35+28
	ldr	ip, .L35+32
	sub	r0, r0, r3, lsl r4
	add	r0, r0, #80
	ldr	r3, .L35+36
	str	r0, [lr]
	ldr	lr, [ip]
	ldr	ip, [ip, #4]
	add	r0, r3, #320
.L27:
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r4, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	add	r3, r3, #32
	cmp	r3, r0
	bne	.L27
	mov	r2, #0
	mov	ip, #1
	mov	r1, #8
	ldr	r3, .L35+40
	add	r0, r3, #448
.L28:
	str	r2, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	stmib	r3, {r2, ip}
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L28
	mov	r1, #3
	mov	r0, #2
	mov	r4, #1
	mov	lr, #0
	mov	ip, #448
	ldr	r3, .L35+44
	ldr	r2, .L35+48
.L29:
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
	bne	.L29
	ldr	r3, .L35+52
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+56
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L35+60
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	enemiesOnScreen
	.word	rand
	.word	1374389535
	.word	enemiesKilled
	.word	quarantines
	.word	enemySpawnRate
	.word	quarantinesOnScreen
	.word	quarantineSpawnRate
	.word	player
	.word	syringes
	.word	rnas
	.word	hearts
	.word	shadowOAM+320
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
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
	push	{r4, lr}
	mov	r2, #0
	mov	r0, #40
	mov	r1, #32
	mov	r4, #1
	mov	lr, #4
	ldr	r3, .L41
	add	ip, r3, #260
.L38:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r4, [r3, #36]
	str	lr, [r3, #40]
	str	r2, [r3, #44]
	add	r3, r3, #52
	cmp	r3, ip
	bne	.L38
	pop	{r4, lr}
	bx	lr
.L42:
	.align	2
.L41:
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
	ldr	r0, .L47
	ldr	r3, .L47+4
	ldr	lr, [r0]
	ldr	ip, [r0, #4]
	add	r0, r3, #320
.L44:
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r4, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	add	r3, r3, #32
	cmp	r3, r0
	bne	.L44
	pop	{r4, lr}
	bx	lr
.L48:
	.align	2
.L47:
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
	ldr	r3, .L53
	add	r0, r3, #448
.L50:
	str	r2, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	stmib	r3, {r2, ip}
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L50
	bx	lr
.L54:
	.align	2
.L53:
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
	ldr	r3, .L59
	ldr	r2, .L59+4
.L56:
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
	bne	.L56
	pop	{r4, lr}
	bx	lr
.L60:
	.align	2
.L59:
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
	sub	sp, sp, #20
	add	r8, r5, #320
	b	.L72
.L63:
	add	r5, r5, #32
	cmp	r5, r8
	add	r6, r6, #8
	beq	.L80
.L72:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L63
	ldmib	r5, {r2, r3}
	add	r3, r2, r3
	cmp	r3, #240
	str	r3, [r5, #4]
	movgt	r3, #0
	ldr	r4, .L82+12
	mov	fp, #0
	mov	r10, #1
	strgt	r3, [r5, #24]
	add	r7, r4, #448
	b	.L68
.L66:
	add	r4, r4, #56
	cmp	r4, r7
	beq	.L81
.L68:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L66
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
	beq	.L66
	ldr	r3, [r4, #24]
	ldr	r2, [r5, #20]
	sub	r3, r3, r2
	str	r3, [r4, #24]
	add	r4, r4, #56
	cmp	r4, r7
	str	fp, [r5, #24]
	str	r10, [r5, #28]
	bne	.L68
.L81:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	movne	r3, #512
	strhne	r3, [r6]	@ movhi
	bne	.L63
	ldr	r3, .L82+16
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ble	.L63
	ldr	r2, [r5, #20]
	cmp	r2, #1
	ldr	r3, .L82+20
	moveq	r3, #384
	ldr	r2, [r5]
	strh	r3, [r6, #4]	@ movhi
	add	r5, r5, #32
	ldr	r3, [r5, #-28]
	cmp	r5, r8
	strh	r2, [r6]	@ movhi
	strh	r3, [r6, #2]	@ movhi
	add	r6, r6, #8
	bne	.L72
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
	.word	enemies
	.word	player
	.word	385
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
	add	r3, r3, #56
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
	.word	enemies+448
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
	ldr	r10, .L148
	ldr	r4, [r10]
	cmp	r4, #7
	sub	sp, sp, #20
	bgt	.L118
	ldr	r0, .L148+4
	mov	r3, #0
	mov	r2, r0
.L120:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L146
	add	r3, r3, #1
	cmp	r3, #8
	add	r2, r2, #56
	bne	.L120
.L118:
	mov	r6, #0
	ldr	r2, .L148+8
	ldr	r7, [r2, #28]
	mov	r8, #512
	mov	lr, r6
	mov	fp, #1
	mov	r9, r7
	ldr	r1, .L148+12
	ldr	r3, .L148+4
	ldr	r5, [r1]
	ldr	r2, .L148+16
	add	ip, r3, #448
.L132:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L121
	ldr	r1, [r3, #40]
	add	r1, r1, #1
	cmp	r1, #200
	str	r1, [r3, #40]
	beq	.L147
.L123:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	bgt	.L127
	mov	r6, #1
	str	lr, [r3, #28]
	str	fp, [r3, #32]
	str	lr, [r3, #40]
	sub	r4, r4, #1
	add	r5, r5, r6
.L127:
	ldr	r1, [r3, #52]
	cmp	r1, #49
	add	r1, r1, #1
	strne	r1, [r3, #52]
	bne	.L129
	ldr	r1, [r3, #44]
	ldr	r0, [r3, #48]
	cmp	r1, r0
	moveq	r1, #1
	addne	r1, r1, #1
	str	lr, [r3, #52]
	str	r1, [r3, #44]
.L129:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	strhne	r8, [r2, #8]	@ movhi
	bne	.L121
	cmp	r9, #0
	ble	.L121
	ldr	r0, [r3, #4]
	mvn	r0, r0, lsl #17
	mvn	r0, r0, lsr #17
	ldr	r1, [r3, #44]
	add	r1, r1, #31
	lsl	r1, r1, #2
	strh	r1, [r2, #12]	@ movhi
	ldr	r1, [r3]
	strh	r0, [r2, #10]	@ movhi
	strh	r1, [r2, #8]	@ movhi
.L121:
	add	r3, r3, #56
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L132
	cmp	r6, #0
	ldrne	r3, .L148+12
	strne	r4, [r10]
	strne	r5, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L147:
	mov	r0, #0
	str	lr, [r3, #40]
	ldr	r7, .L148+20
	b	.L125
.L124:
	add	r0, r0, #1
	cmp	r0, #16
	add	r7, r7, #28
	beq	.L123
.L125:
	ldr	r1, [r7, #20]
	cmp	r1, #0
	bne	.L124
	ldr	r7, .L148+20
	rsb	r0, r0, r0, lsl #3
	add	r7, r7, r0, lsl #2
	str	r0, [sp, #12]
	ldr	r0, [r3, #20]
	str	r7, [sp, #4]
	str	r1, [sp, #8]
	ldr	r7, [r7, #16]
	ldr	r1, [r3]
	add	r0, r0, r0, lsr #31
	add	r7, r7, r7, lsr #31
	add	r0, r1, r0, asr #1
	sub	r0, r0, r7, asr #1
	ldr	r1, [sp, #8]
	ldr	r7, [sp, #4]
	str	r1, [r7, #24]
	str	fp, [r7, #20]
	ldr	r1, [sp, #12]
	ldr	r7, .L148+20
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [r3, #4]
	ldr	r7, [sp, #4]
	str	r1, [r7, #4]
	b	.L123
.L146:
	rsb	r3, r3, r3, lsl #3
	add	r0, r0, r3, lsl #3
	ldr	r2, .L148+24
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
	ldr	r4, [r10]
	add	r4, r4, #1
	str	r4, [r10]
	b	.L118
.L149:
	.align	2
.L148:
	.word	enemiesOnScreen
	.word	enemies
	.word	player
	.word	enemiesKilled
	.word	shadowOAM
	.word	rnas
	.word	enemySpawnRate
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	findRowAndColForQuarantine
	.syntax unified
	.arm
	.fpu softvfp
	.type	findRowAndColForQuarantine, %function
findRowAndColForQuarantine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L172
	mov	r9, r0
	mov	lr, pc
	bx	r5
	subs	r4, r0, #0
	and	r4, r4, #1
	ldr	r10, .L172+4
	ldr	r8, .L172+8
	ldr	r7, .L172+12
	ldr	r6, .L172+16
	rsblt	r4, r4, #0
.L157:
	mov	lr, pc
	bx	r5
	mov	fp, r0
	mov	lr, pc
	bx	r5
	cmp	r4, #0
	mov	ip, #1
	beq	.L151
	ldm	r6, {r1, r2}
	ldr	r3, .L172+20
.L153:
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L152
	ldr	r0, [r3, #4]
	cmp	r0, r2
	bne	.L152
	ldr	r0, [r3]
	cmp	r0, r1
	moveq	ip, #0
	moveq	r4, ip
.L152:
	add	r3, r3, #52
	cmp	r10, r3
	bne	.L153
	cmp	ip, #0
	beq	.L157
.L171:
	stm	r9, {r1, r2}
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L151:
	smull	r2, r3, r8, fp
	smull	r1, r2, r7, r0
	asr	r1, r0, #31
	sub	r3, r3, fp, asr #31
	rsb	r1, r1, r2, asr ip
	add	r3, r3, r3, lsl ip
	add	r1, r1, r1, lsl #2
	sub	fp, fp, r3
	sub	r0, r0, r1
	add	fp, fp, fp, lsl #2
	add	r0, r0, r0, lsl #2
	lsl	r2, fp, #3
	lsl	r1, r0, #3
	ldr	r3, .L172+20
	add	r2, r2, #4
	add	r1, r1, #4
.L156:
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L155
	ldr	r0, [r3, #4]
	cmp	r0, r2
	bne	.L155
	ldr	r0, [r3]
	cmp	r0, r1
	moveq	ip, #0
.L155:
	add	r3, r3, #52
	cmp	r3, r10
	bne	.L156
	cmp	ip, #0
	beq	.L157
	b	.L171
.L173:
	.align	2
.L172:
	.word	rand
	.word	quarantines+260
	.word	1431655766
	.word	1717986919
	.word	player
	.word	quarantines
	.size	findRowAndColForQuarantine, .-findRowAndColForQuarantine
	.align	2
	.global	updateQuarantines
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateQuarantines, %function
updateQuarantines:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L204
	ldr	r3, [r7]
	cmp	r3, #4
	sub	sp, sp, #20
	bgt	.L176
	ldr	r0, .L204+4
	mov	r3, #0
	mov	r2, r0
.L179:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	beq	.L201
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #52
	bne	.L179
.L176:
	ldr	r4, .L204+4
	ldr	r5, .L204+8
	ldr	r9, .L204+12
	ldr	fp, .L204+16
	ldr	r10, .L204+20
	ldr	r8, .L204+24
	add	r6, r4, #260
.L190:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L180
	ldr	r3, [r4, #36]
	ldr	r2, [r4, #40]
	cmp	r3, r2
	beq	.L202
.L182:
	ldr	r2, [r4, #44]
	add	r2, r2, #1
	cmp	r2, #34
	str	r2, [r4, #44]
	beq	.L203
.L184:
	cmp	r2, #50
	moveq	r2, #0
	addeq	r3, r3, #1
	streq	r3, [r4, #36]
	streq	r2, [r4, #44]
.L185:
	sub	r2, r3, #2
	cmp	r2, #1
	bhi	.L187
	cmp	r3, #2
	movne	r2, #2
	moveq	r3, #3
	movne	r3, r2
	streq	r3, [r4, #36]
	strne	r2, [r4, #36]
.L187:
	ldr	r2, [r4, #40]
	cmp	r2, r3
	bge	.L189
	mov	r1, #0
	mov	r2, #512
	ldr	r3, [r7]
	sub	r3, r3, #1
	str	r3, [r7]
	str	r1, [r4, #24]
	strh	r2, [r5, #72]	@ movhi
.L180:
	add	r4, r4, #52
	cmp	r4, r6
	add	r5, r5, #8
	bne	.L190
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L189:
	add	r3, r3, #63
	lsl	r3, r3, #2
	ldr	r2, [r4, #4]
	strh	r3, [r5, #76]	@ movhi
	ldr	r3, [r4]
	orr	r2, r2, r9
	strh	r2, [r5, #74]	@ movhi
	strh	r3, [r5, #72]	@ movhi
	b	.L180
.L203:
	cmp	r3, #3
	bne	.L185
	mov	r2, #0
	ldr	r3, .L204+28
	mov	r1, fp
	mov	r0, r10
	mov	lr, pc
	bx	r3
	ldr	r2, [r4, #44]
	ldr	r3, [r4, #36]
	b	.L184
.L202:
	ldr	r2, [r4, #48]
	cmp	r2, #0
	bne	.L182
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r8, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r8]
	ldr	r0, [r8, #4]
	ldr	ip, .L204+32
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, [r8, #28]
	subne	r3, r3, #1
	strne	r3, [r8, #28]
	strne	r2, [r4, #48]
	strne	r2, [r8, #32]
	ldr	r3, [r4, #36]
	b	.L182
.L201:
	add	r2, r3, r3, lsl #1
	add	r3, r3, r2, lsl #2
	add	r0, r0, r3, lsl #2
	ldr	r2, .L204+36
	ldr	r3, [r0, #32]
	ldr	r2, [r2]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #32]
	bne	.L176
	mov	r3, #1
	str	r1, [r0, #32]
	str	r3, [r0, #24]
	str	r1, [r0, #28]
	str	r1, [r0, #44]
	str	r1, [r0, #36]
	str	r1, [r0, #48]
	bl	findRowAndColForQuarantine
	ldr	r3, [r7]
	add	r3, r3, #1
	str	r3, [r7]
	b	.L176
.L205:
	.align	2
.L204:
	.word	quarantinesOnScreen
	.word	quarantines
	.word	shadowOAM
	.word	-32768
	.word	26725
	.word	quarantinesound
	.word	player
	.word	playSoundB
	.word	collision
	.word	quarantineSpawnRate
	.size	updateQuarantines, .-updateQuarantines
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
	mov	r3, #0
	ldr	r1, .L216
	b	.L209
.L207:
	add	r3, r3, #1
	cmp	r3, #10
	bxeq	lr
.L209:
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r0, r3, #5
	bne	.L207
	push	{r4, r5, r6, r7, lr}
	mov	r5, #1
	ldr	r1, .L216+4
	ldr	r6, .L216+8
	ldr	ip, [r1, #20]
	add	r0, r6, r0
	add	r4, ip, ip, lsr #31
	ldr	ip, [r0, #16]
	add	lr, ip, ip, lsr #31
	ldr	ip, [r1]
	add	ip, ip, r4, asr r5
	sub	ip, ip, lr, asr r5
	ldr	r7, [r1, #4]
	ldr	lr, [r1, #16]
	str	r2, [r0, #28]
	ldr	r2, [r1, #24]
	add	lr, r7, lr
	str	lr, [r0, #4]
	str	ip, [r6, r3, lsl #5]
	str	r5, [r0, #24]
	str	r5, [r1, #52]
	str	r2, [r0, #20]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L217:
	.align	2
.L216:
	.word	syringes+24
	.word	player
	.word	syringes
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L261
	ldrh	r3, [r5]
	tst	r3, #64
	bne	.L253
	ldr	r4, .L261+4
.L219:
	tst	r3, #128
	beq	.L220
	ldr	r2, .L261+8
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L256
.L220:
	tst	r3, #32
	beq	.L221
	ldr	r2, .L261+8
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L257
.L221:
	tst	r3, #16
	beq	.L222
	ldr	r2, .L261+8
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L258
.L222:
	tst	r3, #1
	beq	.L223
	ldr	r2, .L261+8
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L259
.L223:
	tst	r3, #2
	beq	.L224
	ldr	r3, .L261+8
	ldrh	r2, [r3]
	ands	r2, r2, #2
	beq	.L260
.L224:
	ldr	r3, [r4, #44]
	cmp	r3, #69
	add	r3, r3, #1
	strne	r3, [r4, #44]
	bne	.L229
	ldr	r3, [r4, #36]
	ldr	r1, [r4, #40]
	cmp	r3, r1
	mov	r2, #0
	moveq	r3, #1
	addne	r3, r3, #1
	str	r2, [r4, #44]
	str	r3, [r4, #36]
.L229:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L218
	ldr	r3, [r4, #4]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, [r4, #52]
	ldr	r2, .L261+12
	ldr	r0, [r4]
	cmp	r1, #0
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	bne	.L232
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	lsl	r3, r3, #2
	strh	r3, [r2, #4]	@ movhi
.L218:
	pop	{r4, r5, r6, lr}
	bx	lr
.L232:
	cmp	r1, #1
	moveq	r1, #8
	moveq	r3, #2
	movne	r1, #12
	movne	r3, #0
	strh	r1, [r2, #4]	@ movhi
	str	r3, [r4, #52]
	pop	{r4, r5, r6, lr}
	bx	lr
.L260:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	moveq	r2, r3
	ldrne	r1, .L261+16
	ldrne	r0, .L261+20
	ldreq	r1, .L261+24
	ldreq	r0, .L261+28
	ldr	r3, .L261+32
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #48]
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	str	r3, [r4, #48]
	moveq	r3, #11
	movne	r3, #1
	str	r3, [r4, #24]
	b	.L224
.L258:
	ldr	r2, [r4, #4]
	cmp	r2, #83
	ldrle	r1, [r4, #8]
	addle	r2, r1, r2
	strle	r2, [r4, #4]
	b	.L222
.L257:
	ldr	r2, [r4, #4]
	cmp	r2, #4
	ldrgt	r1, [r4, #8]
	subgt	r2, r2, r1
	strgt	r2, [r4, #4]
	b	.L221
.L256:
	ldr	r2, [r4]
	cmp	r2, #123
	ldrle	r1, [r4, #12]
	addle	r2, r1, r2
	strle	r2, [r4]
	b	.L220
.L253:
	ldr	r2, .L261+8
	ldrh	r2, [r2]
	tst	r2, #64
	ldr	r4, .L261+4
	bne	.L219
	ldr	r2, [r4]
	cmp	r2, #4
	ldrgt	r1, [r4, #12]
	subgt	r2, r2, r1
	strgt	r2, [r4]
	b	.L219
.L259:
	bl	fireSyringe
	ldrh	r3, [r5]
	b	.L223
.L262:
	.align	2
.L261:
	.word	oldButtons
	.word	player
	.word	buttons
	.word	shadowOAM
	.word	12141
	.word	cheatoff
	.word	16934
	.word	cheaton
	.word	playSoundB
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
	ldr	r4, .L273
	bl	updatePlayer
	bl	updateEnemies
	bl	updateQuarantines
	bl	updateSyringes
	bl	updateRNAs
	ldr	r3, [r4, #32]
	cmp	r3, #0
	blne	updateHearts.part.0
.L264:
	ldr	r3, .L273+4
	ldr	r3, [r3]
	cmp	r3, #9
	bgt	.L271
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L272
.L266:
	ldr	r3, .L273+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L273+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L273+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L271:
	ldr	r3, .L273+20
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bgt	.L266
.L272:
	ldr	r3, .L273+24
	mov	lr, pc
	bx	r3
	b	.L266
.L274:
	.align	2
.L273:
	.word	player
	.word	enemiesKilled
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	goToWin
	.word	goToLose
	.size	updateGame, .-updateGame
	.align	2
	.global	drawHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHearts, %function
drawHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #448
	ldr	r3, .L283
	ldr	r2, .L283+4
	add	r0, r3, #40
.L277:
	ldr	r1, [r2, #8]
	cmp	r1, #0
	ldrne	ip, [r2]
	ldrne	r1, [r2, #4]
	strhne	lr, [r3, #4]	@ movhi
	strhne	ip, [r3]	@ movhi
	strhne	r1, [r3, #2]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #16
	bne	.L277
	ldr	lr, [sp], #4
	bx	lr
.L284:
	.align	2
.L283:
	.word	shadowOAM+320
	.word	hearts
	.size	drawHearts, .-drawHearts
	.comm	quarantineSpawnRate,4,4
	.comm	quarantinesOnScreen,4,4
	.comm	enemiesKilled,4,4
	.comm	enemySpawnRate,4,4
	.comm	enemiesOnScreen,4,4
	.comm	hearts,80,4
	.comm	rnas,448,4
	.comm	syringes,320,4
	.comm	quarantines,260,4
	.comm	enemies,448,4
	.comm	player,56,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
