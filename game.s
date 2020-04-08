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
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #0
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L12
	ldr	r1, .L12+4
	ldr	r4, .L12+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	mov	r3, #40
	mov	r8, #4
	mov	r10, #1
	mov	ip, #32
	mov	r2, r9
	mov	r7, #84
	mov	r6, #164
	mov	lr, #10
	ldr	r5, .L12+24
	mov	r0, r3
	str	r3, [r5, #8]
	str	r3, [r5, #12]
	ldr	r3, .L12+28
	str	r8, [r5]
	strh	r8, [r3]	@ movhi
	str	r8, [r5, #4]
	sub	r8, r8, #32768
	strh	r9, [r3, #4]	@ movhi
	strh	r8, [r3, #2]	@ movhi
	ldr	r3, .L12+32
	str	r10, [r5, #24]
	mov	r1, ip
	str	ip, [r5, #16]
	str	ip, [r5, #20]
	add	ip, r3, #352
.L2:
	str	r7, [r3]
	str	r6, [r3, #4]
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
	bne	.L2
	ldr	r1, .L12+36
	ldr	r3, .L12+40
	str	r2, [r1]
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	ip, #40
	mov	r1, #32
	ldr	r3, .L12+44
	smull	r6, lr, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, lr, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	ldr	lr, .L12+48
	ldr	r3, .L12+52
	add	r0, r0, #100
	str	r0, [lr]
	add	r0, r3, #140
.L3:
	str	r2, [r3]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	stmib	r3, {r2, ip}
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L3
	mov	r6, #2
	mov	r1, #8
	mov	r2, #0
	ldr	r3, .L12+56
	ldr	lr, [r5]
	ldr	ip, [r5, #4]
	add	r0, r3, #280
.L4:
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r6, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L4
	mov	r2, #0
	mov	ip, #1
	mov	r1, #8
	ldr	r3, .L12+60
	add	r0, r3, #448
.L5:
	str	r2, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	stmib	r3, {r2, ip}
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L5
	ldr	r3, .L12+64
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+28
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	83886592
	.word	spritesheetPal
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
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
	.word	waitForVBlank
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
	mov	r2, #1
	mov	r1, #4
	str	lr, [sp, #-4]!
	mov	ip, #40
	mov	lr, #0
	mov	r0, #32
	ldr	r3, .L16
	str	r2, [r3, #24]
	ldr	r2, .L16+4
	str	r1, [r3]
	str	r1, [r3, #4]
	strh	r1, [r2]	@ movhi
	sub	r1, r1, #32768
	strh	lr, [r2, #4]	@ movhi
	str	ip, [r3, #8]
	strh	r1, [r2, #2]	@ movhi
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	r3, .L22
	add	ip, r3, #352
.L19:
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
	bne	.L19
	pop	{r4, r5, lr}
	bx	lr
.L23:
	.align	2
.L22:
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
	ldr	r3, .L28
	add	ip, r3, #140
.L25:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, ip
	bne	.L25
	bx	lr
.L29:
	.align	2
.L28:
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
	ldr	r0, .L34
	ldr	r3, .L34+4
	ldr	lr, [r0]
	ldr	ip, [r0, #4]
	add	r0, r3, #280
.L31:
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r4, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L31
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
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
	ldr	r3, .L40
	add	r0, r3, #448
.L37:
	str	r2, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	stmib	r3, {r2, ip}
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L37
	bx	lr
.L41:
	.align	2
.L40:
	.word	rnas
	.size	initRNAs, .-initRNAs
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
	ldr	r5, .L62
	ldr	r6, .L62+4
	ldr	r9, .L62+8
	ldr	fp, .L62+12
	sub	sp, sp, #20
	add	r8, r5, #280
	b	.L50
.L43:
	add	r5, r5, #28
	cmp	r5, r8
	add	r6, r6, #8
	beq	.L60
.L50:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L43
	ldmib	r5, {r2, r3}
	add	r3, r2, r3
	cmp	r3, #240
	str	r3, [r5, #4]
	movgt	r3, #0
	ldr	r4, .L62+16
	mov	r10, #0
	strgt	r3, [r5, #20]
	add	r7, r4, #352
	b	.L48
.L46:
	add	r4, r4, #44
	cmp	r4, r7
	beq	.L61
.L48:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L46
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
	beq	.L46
	mov	r2, #1
	ldr	r3, [r4, #24]
	ldr	r1, [fp, #24]
	sub	r3, r3, r1
	str	r3, [r4, #24]
	add	r4, r4, #44
	cmp	r4, r7
	str	r10, [r5, #20]
	str	r2, [r5, #24]
	bne	.L48
.L61:
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
	bne	.L50
.L60:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L63:
	.align	2
.L62:
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #0
	ldr	r4, .L75
	ldr	r5, .L75+4
	ldr	r7, .L75+8
	sub	sp, sp, #16
	add	r6, r4, #448
.L69:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L66
	ldmib	r4, {r2, r3}
	sub	r3, r2, r3
	cmp	r3, #0
	str	r3, [r4, #4]
	strlt	r8, [r4, #20]
	add	r0, r4, #12
	ldm	r0, {r0, ip}
	ldr	r2, [r4]
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r3, #1
	strne	r8, [r4, #20]
	strne	r3, [r4, #24]
.L66:
	add	r4, r4, #28
	cmp	r4, r6
	bne	.L69
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	rnas
	.word	player
	.word	collision
	.size	updateRNAs, .-updateRNAs
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
	ldr	r5, .L89
	ldr	r8, .L89+4
	ldr	r6, .L89+8
.L80:
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
	ldr	r3, .L89+12
	add	r4, r4, #164
	add	r0, r0, #4
.L79:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L78
	ldr	r2, [r3, #4]
	cmp	r2, r4
	bne	.L78
	ldr	r2, [r3]
	cmp	r2, r0
	moveq	r1, #0
.L78:
	add	r3, r3, #44
	cmp	r3, r8
	bne	.L79
	cmp	r1, #0
	beq	.L80
	stm	r7, {r0, r4}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L90:
	.align	2
.L89:
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
	ldr	fp, .L120
	ldr	lr, [fp]
	cmp	lr, #7
	sub	sp, sp, #20
	bgt	.L92
	ldr	r0, .L120+4
	mov	r3, #0
	mov	r2, r0
.L94:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L117
	add	r3, r3, #1
	cmp	r3, #8
	add	r2, r2, #44
	bne	.L94
.L92:
	mov	r4, #0
	ldr	r3, .L120+4
	mov	r8, #512
	mov	r5, r4
	mov	r7, #128
	mov	r10, #1
	ldr	r2, .L120+8
	ldr	r6, .L120+12
	add	ip, r3, #352
	b	.L104
.L101:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	bne	.L102
	ldm	r3, {r0, r1}
	orr	r1, r1, r6
	strh	r7, [r2, #12]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
.L95:
	add	r3, r3, #44
	cmp	r3, ip
	add	r2, r2, #8
	beq	.L118
.L104:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L95
	ldr	r1, [r3, #40]
	add	r1, r1, #1
	cmp	r1, #50
	str	r1, [r3, #40]
	beq	.L119
.L97:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	bgt	.L101
	mov	r4, #1
	str	r5, [r3, #28]
	str	r10, [r3, #32]
	sub	lr, lr, #1
.L102:
	add	r3, r3, #44
	cmp	r3, ip
	strh	r8, [r2, #8]	@ movhi
	add	r2, r2, #8
	bne	.L104
.L118:
	cmp	r4, #0
	strne	lr, [fp]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L119:
	mov	r0, #0
	str	r5, [r3, #40]
	ldr	r9, .L120+16
	b	.L99
.L98:
	add	r0, r0, #1
	cmp	r0, #16
	add	r9, r9, #28
	beq	.L97
.L99:
	ldr	r1, [r9, #20]
	cmp	r1, #0
	bne	.L98
	ldr	r9, .L120+16
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
	str	r10, [r9, #20]
	ldr	r1, [sp, #12]
	ldr	r9, .L120+16
	str	r0, [r9, r1, lsl #2]
	ldr	r1, [r3, #4]
	ldr	r9, [sp, #4]
	str	r1, [r9, #4]
	b	.L97
.L117:
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	add	r0, r0, r3, lsl #2
	ldr	r2, .L120+20
	ldr	r3, [r0, #36]
	ldr	r2, [r2]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #36]
	bne	.L92
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
	b	.L92
.L121:
	.align	2
.L120:
	.word	enemiesOnScreen
	.word	enemies
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
	ldr	r0, .L132
	mov	r3, #0
	mov	r2, r0
	b	.L125
.L123:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #28
	bxeq	lr
.L125:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L123
	push	{r4, r5, r6, lr}
	mov	r6, #1
	ldr	lr, .L132+4
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
.L133:
	.align	2
.L132:
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
	ldr	r3, .L162
	ldrh	r3, [r3]
	tst	r3, #64
	push	{r4, lr}
	bne	.L155
	ldr	r4, .L162+4
.L135:
	tst	r3, #128
	beq	.L136
	ldr	r2, .L162+8
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L158
.L136:
	tst	r3, #32
	beq	.L137
	ldr	r2, .L162+8
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L159
.L137:
	tst	r3, #16
	beq	.L138
	ldr	r2, .L162+8
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L160
.L138:
	tst	r3, #1
	beq	.L139
	ldr	r3, .L162+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L161
.L139:
	ldr	r3, [r4, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #0
	mvn	r3, r3, lsr #17
	ldr	r2, .L162+12
	ldr	r0, [r4]
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L155:
	ldr	r2, .L162+8
	ldrh	r2, [r2]
	tst	r2, #64
	ldr	r4, .L162+4
	bne	.L135
	ldr	r2, [r4]
	cmp	r2, #4
	ldrgt	r1, [r4, #12]
	subgt	r2, r2, r1
	strgt	r2, [r4]
	b	.L135
.L160:
	ldr	r2, [r4, #4]
	cmp	r2, #83
	ldrle	r1, [r4, #8]
	addle	r2, r1, r2
	strle	r2, [r4, #4]
	b	.L138
.L159:
	ldr	r2, [r4, #4]
	cmp	r2, #4
	ldrgt	r1, [r4, #8]
	subgt	r2, r2, r1
	strgt	r2, [r4, #4]
	b	.L137
.L158:
	ldr	r2, [r4]
	cmp	r2, #123
	ldrle	r1, [r4, #12]
	addle	r2, r1, r2
	strle	r2, [r4]
	b	.L136
.L161:
	bl	fireSyringe
	b	.L139
.L163:
	.align	2
.L162:
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
	bl	updateEnemies
	bl	updateSyringes
	bl	updateRNAs
	ldr	r3, .L166
	mov	lr, pc
	bx	r3
	ldr	r4, .L166+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L166+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L167:
	.align	2
.L166:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.comm	enemySpawnRate,4,4
	.comm	enemiesOnScreen,4,4
	.comm	rnas,448,4
	.comm	syringes,280,4
	.comm	quarantines,140,4
	.comm	enemies,352,4
	.comm	player,28,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
