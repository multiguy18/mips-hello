	.file	1 "ctest.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	testfun
	.set	nomips16
	.set	nomicromips
	.ent	testfun
	.type	testfun, @function
testfun:
	.frame	$fp,56,$31		# vars= 24, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,44($fp)
	li	$2,959643648			# 0x39330000
	ori	$2,$2,0x3300
	sw	$2,32($fp)
	addiu	$2,$fp,32
	move	$4,$2
	.option	pic0
	jal	atoi
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,28($fp)
	addiu	$2,$fp,36
	move	$5,$2
	lw	$4,28($fp)
	.option	pic0
	jal	itoa
	nop

	.option	pic2
	lw	$28,16($fp)
	nop
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$3,44($fp)
	lw	$2,0($2)
	beq	$3,$2,$L2
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L2:
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	testfun
	.size	testfun, .-testfun
	.align	2
	.globl	add
	.set	nomips16
	.set	nomicromips
	.ent	add
	.type	add, @function
add:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	sw	$5,12($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	addu	$2,$3,$2
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	add
	.size	add, .-add
	.align	2
	.globl	atoi
	.set	nomips16
	.set	nomicromips
	.ent	atoi
	.type	atoi, @function
atoi:
	.frame	$fp,56,$31		# vars= 24, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	sw	$4,56($fp)
	sw	$0,32($fp)
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,36($fp)
	li	$2,1			# 0x1
	sw	$2,40($fp)
	li	$2,48			# 0x30
	sb	$2,30($fp)
	li	$2,57			# 0x39
	sb	$2,31($fp)
	.option	pic0
	b	$L6
	nop

	.option	pic2
$L12:
	lw	$2,36($fp)
	lw	$3,56($fp)
	addu	$2,$3,$2
	lb	$2,0($2)
	move	$4,$2
	.option	pic0
	jal	isspace
	nop

	.option	pic2
	beq	$2,$0,$L7
	nop

	lw	$2,40($fp)
	beq	$2,$0,$L8
	nop

	.option	pic0
	b	$L6
	nop

	.option	pic2
$L8:
	li	$2,-2147483648			# 0xffffffff80000000
	.option	pic0
	b	$L9
	nop

	.option	pic2
$L7:
	lw	$2,36($fp)
	lw	$3,56($fp)
	addu	$2,$3,$2
	lb	$3,0($2)
	li	$2,45			# 0x2d
	bne	$3,$2,$L10
	nop

	lw	$2,40($fp)
	beq	$2,$0,$L11
	nop

	sw	$0,40($fp)
	li	$2,1			# 0x1
	sw	$2,44($fp)
	.option	pic0
	b	$L6
	nop

	.option	pic2
$L11:
	li	$2,-2147483648			# 0xffffffff80000000
	.option	pic0
	b	$L9
	nop

	.option	pic2
$L10:
	lw	$2,36($fp)
	lw	$3,56($fp)
	addu	$2,$3,$2
	lb	$2,0($2)
	lb	$3,30($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L6
	nop

	lw	$2,36($fp)
	lw	$3,56($fp)
	addu	$2,$3,$2
	lb	$2,0($2)
	lb	$3,31($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L6
	nop

	lw	$3,32($fp)
	move	$2,$3
	sll	$2,$2,2
	addu	$2,$2,$3
	sll	$2,$2,1
	sw	$2,32($fp)
	lw	$2,36($fp)
	lw	$3,56($fp)
	addu	$2,$3,$2
	lb	$2,0($2)
	move	$3,$2
	lb	$2,30($fp)
	subu	$2,$3,$2
	lw	$3,32($fp)
	addu	$2,$3,$2
	sw	$2,32($fp)
$L6:
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
	lw	$2,36($fp)
	lw	$3,56($fp)
	addu	$2,$3,$2
	lb	$2,0($2)
	bne	$2,$0,$L12
	nop

	lw	$2,32($fp)
$L9:
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	atoi
	.size	atoi, .-atoi
	.align	2
	.globl	itoa
	.set	nomips16
	.set	nomicromips
	.ent	itoa
	.type	itoa, @function
itoa:
	.frame	$fp,32,$31		# vars= 24, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	li	$2,48			# 0x30
	sb	$2,6($fp)
	lw	$2,32($fp)
	bgez	$2,$L15
	nop

	li	$2,1			# 0x1
	sw	$2,20($fp)
	lw	$2,32($fp)
	subu	$2,$0,$2
	sw	$2,32($fp)
	lw	$2,8($fp)
	addiu	$2,$2,1
	sw	$2,8($fp)
$L15:
	lw	$3,32($fp)
	li	$2,1717960704			# 0x66660000
	ori	$2,$2,0x6667
	mult	$3,$2
	mfhi	$2
	sra	$4,$2,2
	sra	$2,$3,31
	subu	$4,$4,$2
	move	$2,$4
	sll	$2,$2,2
	addu	$2,$2,$4
	sll	$2,$2,1
	subu	$4,$3,$2
	andi	$3,$4,0x00ff
	lbu	$2,6($fp)
	addu	$2,$3,$2
	andi	$4,$2,0x00ff
	lw	$2,8($fp)
	addiu	$3,$2,1
	sw	$3,8($fp)
	move	$3,$2
	lw	$2,36($fp)
	addu	$2,$2,$3
	seb	$3,$4
	sb	$3,0($2)
	lw	$2,32($fp)
	li	$3,1717960704			# 0x66660000
	ori	$3,$3,0x6667
	mult	$2,$3
	mfhi	$3
	sra	$3,$3,2
	sra	$2,$2,31
	subu	$2,$3,$2
	sw	$2,32($fp)
	lw	$2,32($fp)
	bne	$2,$0,$L15
	nop

	lw	$2,20($fp)
	beq	$2,$0,$L16
	nop

	lw	$2,8($fp)
	addiu	$2,$2,-1
	sw	$2,8($fp)
$L16:
	lw	$2,8($fp)
	addiu	$2,$2,-1
	sw	$2,8($fp)
	lw	$2,8($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	sw	$2,12($fp)
	lw	$2,20($fp)
	beq	$2,$0,$L18
	nop

	lw	$2,8($fp)
	addiu	$2,$2,1
	sw	$2,8($fp)
	lw	$2,12($fp)
	addiu	$2,$2,1
	sw	$2,12($fp)
	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
	lw	$2,36($fp)
	li	$3,45			# 0x2d
	sb	$3,0($2)
	.option	pic0
	b	$L18
	nop

	.option	pic2
$L19:
	lw	$2,8($fp)
	lw	$3,36($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	sb	$2,7($fp)
	lw	$2,16($fp)
	lw	$3,36($fp)
	addu	$3,$3,$2
	lw	$2,8($fp)
	addiu	$4,$2,-1
	sw	$4,8($fp)
	move	$4,$2
	lw	$2,36($fp)
	addu	$2,$2,$4
	lb	$3,0($3)
	sb	$3,0($2)
	lw	$2,16($fp)
	addiu	$3,$2,1
	sw	$3,16($fp)
	move	$3,$2
	lw	$2,36($fp)
	addu	$2,$2,$3
	lbu	$3,7($fp)
	sb	$3,0($2)
$L18:
	lw	$3,8($fp)
	lw	$2,12($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L19
	nop

	nop
	nop
	move	$sp,$fp
	lw	$fp,28($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	itoa
	.size	itoa, .-itoa
	.align	2
	.globl	isspace
	.set	nomips16
	.set	nomicromips
	.ent	isspace
	.type	isspace, @function
isspace:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	move	$2,$4
	sb	$2,8($fp)
	lb	$3,8($fp)
	li	$2,32			# 0x20
	beq	$3,$2,$L21
	nop

	lb	$3,8($fp)
	li	$2,9			# 0x9
	beq	$3,$2,$L21
	nop

	lb	$3,8($fp)
	li	$2,13			# 0xd
	beq	$3,$2,$L21
	nop

	lb	$3,8($fp)
	li	$2,10			# 0xa
	beq	$3,$2,$L21
	nop

	lb	$3,8($fp)
	li	$2,11			# 0xb
	beq	$3,$2,$L21
	nop

	lb	$3,8($fp)
	li	$2,12			# 0xc
	bne	$3,$2,$L22
	nop

$L21:
	li	$2,1			# 0x1
	.option	pic0
	b	$L23
	nop

	.option	pic2
$L22:
	move	$2,$0
$L23:
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	isspace
	.size	isspace, .-isspace
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
