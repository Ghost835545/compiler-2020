	.global	main
	.data
global_x:	.int	0
global_y:	.int	0
global_z:	.int	0
	.text
main:
	pushl	%ebp
	movl	%esp,	%ebp
	subl	$0,	%esp
# READ
	call	Lread
	movl	%eax,	%ebx
# ST x
	movl	%ebx,	global_x
# DROP
# READ
	call	Lread
	movl	%eax,	%ebx
# ST y
	movl	%ebx,	global_y
# DROP
# LDA z
	leal	global_z,	%eax
	movl	%eax,	%ebx
# LD y
	movl	global_y,	%ecx
# LD y
	movl	global_y,	%esi
# BINOP *
	movl	%ecx,	%eax
	imull	%esi,	%eax
	movl	%eax,	%ecx
# STI
	movl	%ecx,	%eax
	movl	%ebx,	%edx
	movl	%eax,	(%edx)
	movl	%eax,	%ebx
# DROP
# LD x
	movl	global_x,	%ebx
# LD z
	movl	global_z,	%ecx
# BINOP +
	movl	%ebx,	%eax
	addl	%ecx,	%eax
	movl	%eax,	%ebx
# WRITE
	pushl	%ebx
	call	Lwrite
	popl	%eax
	movl	%ebp,	%esp
	popl	%ebp
	xorl	%eax,	%eax
	ret
