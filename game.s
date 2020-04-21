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
	mov	r2, #5
	mov	r1, #4
	push	{r4, lr}
	mov	ip, #40
	mov	lr, #0
	mov	r4, #1
	mov	r0, #32
	ldr	r3, .L17
	str	r2, [r3, #28]
	ldr	r2, .L17+4
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, #4
	mov	r6, #0
	mov	r9, #32
	mov	r1, #5
	mov	r10, #40
	mov	r7, #1
	ldr	r3, .L35
	ldr	r2, .L35+4
	ldr	r4, .L35+8
	strh	r2, [r3, #2]	@ movhi
	strh	r8, [r3]	@ movhi
	strh	r6, [r3, #4]	@ movhi
	str	r1, [r4, #28]
	str	r9, [r4, #16]
	str	r9, [r4, #20]
	str	r8, [r4]
	str	r8, [r4, #4]
	str	r10, [r4, #8]
	str	r10, [r4, #12]
	str	r7, [r4, #24]
	str	r6, [r4, #32]
	bl	initEnemies
	ldr	r3, .L35+12
	ldr	r5, .L35+16
	str	r6, [r3]
	mov	lr, pc
	bx	r5
	mov	lr, r8
	mov	ip, r10
	mov	r2, r6
	ldr	r3, .L35+20
	mov	r1, r9
	smull	r9, r8, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r8, asr lr
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	r9, .L35+24
	sub	r0, r0, r3, lsl r7
	ldr	r8, .L35+28
	ldr	r3, .L35+32
	add	r0, r0, #200
	str	r6, [r9]
	str	r0, [r8]
	add	r0, r3, #260
.L26:
	str	r2, [r3]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r7, [r3, #36]
	str	lr, [r3, #40]
	str	r2, [r3, #44]
	stmib	r3, {r2, ip}
	add	r3, r3, #52
	cmp	r3, r0
	bne	.L26
	ldr	r3, .L35+36
	str	r2, [r3]
	mov	lr, pc
	bx	r5
	mov	r5, #2
	mov	r1, #8
	mov	r2, #0
	ldr	r3, .L35+20
	smull	lr, ip, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #5
	add	r3, r3, r3, lsl r5
	add	r3, r3, r3, lsl r5
	ldr	ip, .L35+40
	sub	r0, r0, r3, lsl r5
	add	r0, r0, #100
	ldr	r3, .L35+44
	str	r0, [ip]
	ldr	lr, [r4]
	ldr	ip, [r4, #4]
	add	r0, r3, #280
.L27:
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r5, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L27
	mov	r2, #0
	mov	ip, #1
	mov	r1, #8
	ldr	r3, .L35+48
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
	ldr	r3, .L35+52
	ldr	r2, .L35+56
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
	ldr	r3, .L35+60
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+64
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L35
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	shadowOAM
	.word	-32764
	.word	player
	.word	enemiesOnScreen
	.word	rand
	.word	1374389535
	.word	enemiesKilled
	.word	enemySpawnRate
	.word	quarantines
	.word	quarantinesOnScreen
	.word	quarantineSpawnRate
	.word	syringes
	.word	rnas
	.word	hearts
	.word	shadowOAM+320
	.word	waitForVBlank
	.word	DMANow
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
	add	r0, r3, #280
.L44:
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r4, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
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
	ldr	r5, .L80
	ldr	r6, .L80+4
	ldr	r9, .L80+8
	ldr	fp, .L80+12
	sub	sp, sp, #20
	add	r8, r5, #280
	b	.L71
.L63:
	add	r5, r5, #28
	cmp	r5, r8
	add	r6, r6, #8
	beq	.L78
.L71:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L63
	ldmib	r5, {r2, r3}
	add	r3, r2, r3
	cmp	r3, #240
	str	r3, [r5, #4]
	movgt	r3, #0
	ldr	r4, .L80+16
	mov	r10, #0
	strgt	r3, [r5, #20]
	add	r7, r4, #448
	b	.L68
.L66:
	add	r4, r4, #56
	cmp	r4, r7
	beq	.L79
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
	mov	r2, #1
	ldr	r3, [r4, #24]
	ldr	r1, [fp, #24]
	sub	r3, r3, r1
	str	r3, [r4, #24]
	add	r4, r4, #56
	cmp	r4, r7
	str	r10, [r5, #20]
	str	r2, [r5, #24]
	bne	.L68
.L79:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	movne	r3, #512
	strhne	r3, [r6]	@ movhi
	bne	.L63
	ldr	r3, [fp, #28]
	cmp	r3, #0
	ble	.L63
	mov	r3, #384
	ldr	r2, [r5]
	strh	r3, [r6, #4]	@ movhi
	add	r5, r5, #28
	ldr	r3, [r5, #-24]
	cmp	r5, r8
	strh	r2, [r6]	@ movhi
	strh	r3, [r6, #2]	@ movhi
	add	r6, r6, #8
	bne	.L71
.L78:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L81:
	.align	2
.L80:
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
	ldr	r4, .L95
	mov	r9, #512
	ldr	r6, .L95+4
	ldr	r5, .L95+8
	ldr	r8, .L95+12
	sub	sp, sp, #20
	add	r7, r4, #448
	b	.L90
.L94:
	mov	r2, #1
	mov	r1, #0
	ldr	r3, [r5, #28]
	sub	r3, r3, #1
	str	r3, [r5, #28]
	str	r1, [r4, #20]
	str	r2, [r4, #24]
	str	r2, [r5, #32]
.L87:
	strh	r9, [r6, #192]	@ movhi
.L84:
	add	r4, r4, #28
	cmp	r4, r7
	add	r6, r6, #8
	beq	.L93
.L90:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L84
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
	bne	.L94
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L87
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
	bne	.L90
.L93:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L96:
	.align	2
.L95:
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
	ldr	r3, .L99
	ldr	r3, [r3, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateHearts.part.0
.L100:
	.align	2
.L99:
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
	ldr	r5, .L113
	ldr	r8, .L113+4
	ldr	r6, .L113+8
.L104:
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
	ldr	r3, .L113+12
	add	r4, r4, #164
	add	r0, r0, #4
.L103:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L102
	ldr	r2, [r3, #4]
	cmp	r2, r4
	bne	.L102
	ldr	r2, [r3]
	cmp	r2, r0
	moveq	r1, #0
.L102:
	add	r3, r3, #56
	cmp	r3, r8
	bne	.L103
	cmp	r1, #0
	beq	.L104
	stm	r7, {r0, r4}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L114:
	.align	2
.L113:
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
	ldr	r10, .L146
	ldr	r4, [r10]
	cmp	r4, #7
	sub	sp, sp, #20
	bgt	.L116
	ldr	r0, .L146+4
	mov	r3, #0
	mov	r2, r0
.L118:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L144
	add	r3, r3, #1
	cmp	r3, #8
	add	r2, r2, #56
	bne	.L118
.L116:
	mov	r6, #0
	ldr	r2, .L146+8
	ldr	r7, [r2, #28]
	mov	r8, #512
	mov	lr, r6
	mov	fp, #1
	mov	r9, r7
	ldr	r1, .L146+12
	ldr	r3, .L146+4
	ldr	r5, [r1]
	ldr	r2, .L146+16
	add	ip, r3, #448
.L130:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L119
	ldr	r1, [r3, #40]
	add	r1, r1, #1
	cmp	r1, #200
	str	r1, [r3, #40]
	beq	.L145
.L121:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	bgt	.L125
	mov	r6, #1
	str	lr, [r3, #28]
	str	fp, [r3, #32]
	str	lr, [r3, #40]
	sub	r4, r4, #1
	add	r5, r5, r6
.L125:
	ldr	r1, [r3, #52]
	cmp	r1, #49
	add	r1, r1, #1
	strne	r1, [r3, #52]
	bne	.L127
	ldr	r1, [r3, #44]
	ldr	r0, [r3, #48]
	cmp	r1, r0
	moveq	r1, #1
	addne	r1, r1, #1
	str	lr, [r3, #52]
	str	r1, [r3, #44]
.L127:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	strhne	r8, [r2, #8]	@ movhi
	bne	.L119
	cmp	r9, #0
	ble	.L119
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
.L119:
	add	r3, r3, #56
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L130
	cmp	r6, #0
	ldrne	r3, .L146+12
	strne	r4, [r10]
	strne	r5, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L145:
	mov	r0, #0
	str	lr, [r3, #40]
	ldr	r7, .L146+20
	b	.L123
.L122:
	add	r0, r0, #1
	cmp	r0, #16
	add	r7, r7, #28
	beq	.L121
.L123:
	ldr	r1, [r7, #20]
	cmp	r1, #0
	bne	.L122
	ldr	r7, .L146+20
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
	ldr	r7, .L146+20
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [r3, #4]
	ldr	r7, [sp, #4]
	str	r1, [r7, #4]
	b	.L121
.L144:
	rsb	r3, r3, r3, lsl #3
	add	r0, r0, r3, lsl #3
	ldr	r2, .L146+24
	ldr	r3, [r0, #36]
	ldr	r2, [r2]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #36]
	bne	.L116
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
	b	.L116
.L147:
	.align	2
.L146:
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
	ldr	r5, .L170
	mov	r9, r0
	mov	lr, pc
	bx	r5
	subs	r4, r0, #0
	and	r4, r4, #1
	ldr	r10, .L170+4
	ldr	r8, .L170+8
	ldr	r7, .L170+12
	ldr	r6, .L170+16
	rsblt	r4, r4, #0
.L155:
	mov	lr, pc
	bx	r5
	mov	fp, r0
	mov	lr, pc
	bx	r5
	cmp	r4, #0
	mov	ip, #1
	beq	.L149
	ldm	r6, {r1, r2}
	ldr	r3, .L170+20
.L151:
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L150
	ldr	r0, [r3, #4]
	cmp	r0, r2
	bne	.L150
	ldr	r0, [r3]
	cmp	r0, r1
	moveq	ip, #0
	moveq	r4, ip
.L150:
	add	r3, r3, #52
	cmp	r10, r3
	bne	.L151
	cmp	ip, #0
	beq	.L155
.L169:
	stm	r9, {r1, r2}
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L149:
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
	ldr	r3, .L170+20
	add	r2, r2, #4
	add	r1, r1, #4
.L154:
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L153
	ldr	r0, [r3, #4]
	cmp	r0, r2
	bne	.L153
	ldr	r0, [r3]
	cmp	r0, r1
	moveq	ip, #0
.L153:
	add	r3, r3, #52
	cmp	r3, r10
	bne	.L154
	cmp	ip, #0
	beq	.L155
	b	.L169
.L171:
	.align	2
.L170:
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L198
	ldr	r3, [r7]
	cmp	r3, #4
	sub	sp, sp, #16
	bgt	.L174
	ldr	r0, .L198+4
	mov	r3, #0
	mov	r2, r0
.L177:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	beq	.L196
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #52
	bne	.L177
.L174:
	ldr	r4, .L198+4
	ldr	r5, .L198+8
	ldr	r9, .L198+12
	ldr	r8, .L198+16
	ldr	r10, .L198+20
	add	r6, r4, #260
.L185:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L178
	ldr	r3, [r4, #36]
	ldr	r1, [r4, #40]
	cmp	r3, r1
	beq	.L197
.L180:
	ldr	r2, [r4, #44]
	add	r2, r2, #1
	cmp	r2, #50
	str	r2, [r4, #44]
	moveq	r2, #0
	addeq	r3, r3, #1
	streq	r3, [r4, #36]
	streq	r2, [r4, #44]
	cmp	r1, r3
	bge	.L184
	mov	r1, #0
	mov	r2, #512
	ldr	r3, [r7]
	sub	r3, r3, #1
	str	r3, [r7]
	str	r1, [r4, #24]
	strh	r2, [r5, #72]	@ movhi
.L178:
	add	r4, r4, #52
	cmp	r4, r6
	add	r5, r5, #8
	bne	.L185
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L184:
	add	r3, r3, #63
	lsl	r3, r3, #2
	ldr	r2, [r4, #4]
	strh	r3, [r5, #76]	@ movhi
	ldr	r3, [r4]
	orr	r2, r2, r9
	strh	r2, [r5, #74]	@ movhi
	strh	r3, [r5, #72]	@ movhi
	b	.L178
.L197:
	ldr	r2, [r4, #48]
	cmp	r2, #0
	bne	.L180
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
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, [r8, #28]
	subne	r3, r3, #1
	strne	r3, [r8, #28]
	strne	r2, [r4, #48]
	strne	r2, [r8, #32]
	ldr	r3, [r4, #36]
	ldr	r1, [r4, #40]
	b	.L180
.L196:
	add	r2, r3, r3, lsl #1
	add	r3, r3, r2, lsl #2
	add	r0, r0, r3, lsl #2
	ldr	r2, .L198+24
	ldr	r3, [r0, #32]
	ldr	r2, [r2]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #32]
	bne	.L174
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
	b	.L174
.L199:
	.align	2
.L198:
	.word	quarantinesOnScreen
	.word	quarantines
	.word	shadowOAM
	.word	-32768
	.word	player
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
	ldr	r0, .L210
	mov	r3, #0
	mov	r2, r0
	b	.L203
.L201:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #28
	bxeq	lr
.L203:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L201
	push	{r4, r5, r6, lr}
	mov	r6, #1
	ldr	lr, .L210+4
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
.L211:
	.align	2
.L210:
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
	ldr	r3, .L241
	ldrh	r3, [r3]
	tst	r3, #64
	push	{r4, lr}
	bne	.L234
	ldr	r4, .L241+4
.L213:
	tst	r3, #128
	beq	.L214
	ldr	r2, .L241+8
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L237
.L214:
	tst	r3, #32
	beq	.L215
	ldr	r2, .L241+8
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L238
.L215:
	tst	r3, #16
	beq	.L216
	ldr	r2, .L241+8
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L239
.L216:
	tst	r3, #1
	beq	.L217
	ldr	r3, .L241+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L240
.L217:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L212
	ldr	r3, [r4, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #0
	mvn	r3, r3, lsr #17
	ldr	r2, .L241+12
	ldr	r0, [r4]
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
.L212:
	pop	{r4, lr}
	bx	lr
.L234:
	ldr	r2, .L241+8
	ldrh	r2, [r2]
	tst	r2, #64
	ldr	r4, .L241+4
	bne	.L213
	ldr	r2, [r4]
	cmp	r2, #4
	ldrgt	r1, [r4, #12]
	subgt	r2, r2, r1
	strgt	r2, [r4]
	b	.L213
.L239:
	ldr	r2, [r4, #4]
	cmp	r2, #83
	ldrle	r1, [r4, #8]
	addle	r2, r1, r2
	strle	r2, [r4, #4]
	b	.L216
.L238:
	ldr	r2, [r4, #4]
	cmp	r2, #4
	ldrgt	r1, [r4, #8]
	subgt	r2, r2, r1
	strgt	r2, [r4, #4]
	b	.L215
.L237:
	ldr	r2, [r4]
	cmp	r2, #123
	ldrle	r1, [r4, #12]
	addle	r2, r1, r2
	strle	r2, [r4]
	b	.L214
.L240:
	bl	fireSyringe
	b	.L217
.L242:
	.align	2
.L241:
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
	ldr	r4, .L253
	bl	updatePlayer
	bl	updateEnemies
	bl	updateQuarantines
	bl	updateSyringes
	bl	updateRNAs
	ldr	r3, [r4, #32]
	cmp	r3, #0
	blne	updateHearts.part.0
.L244:
	ldr	r3, .L253+4
	ldr	r3, [r3]
	cmp	r3, #9
	bgt	.L251
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L252
.L246:
	ldr	r3, .L253+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L253+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L253+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L251:
	ldr	r3, .L253+20
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bgt	.L246
.L252:
	ldr	r3, .L253+24
	mov	lr, pc
	bx	r3
	b	.L246
.L254:
	.align	2
.L253:
	.word	player
	.word	enemiesKilled
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	goToWin
	.word	goToLose
	.size	updateGame, .-updateGame
	.comm	quarantineSpawnRate,4,4
	.comm	quarantinesOnScreen,4,4
	.comm	enemiesKilled,4,4
	.comm	enemySpawnRate,4,4
	.comm	enemiesOnScreen,4,4
	.comm	hearts,80,4
	.comm	rnas,448,4
	.comm	syringes,280,4
	.comm	quarantines,260,4
	.comm	enemies,448,4
	.comm	player,36,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
