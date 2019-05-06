	.file	"lottery.c"
	.text
	.globl	gtickets
	.bss
	.align 4
	.type	gtickets, @object
	.size	gtickets, 4
gtickets:
	.zero	4
	.globl	head
	.align 8
	.type	head, @object
	.size	head, 8
head:
	.zero	8
	.section	.rodata
.LC0:
	.string	"lottery.c"
.LC1:
	.string	"tmp != NULL"
	.text
	.globl	insert
	.type	insert, @function
insert:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L2
	leaq	__PRETTY_FUNCTION__.2964(%rip), %rcx
	movl	$18, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	__assert_fail@PLT
.L2:
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, (%rax)
	movq	head(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, head(%rip)
	movl	gtickets(%rip), %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, gtickets(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	insert, .-insert
	.section	.rodata
.LC2:
	.string	"List: "
.LC3:
	.string	"[%d] "
	.text
	.globl	print_list
	.type	print_list, @function
print_list:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	head(%rip), %rax
	movq	%rax, -8(%rbp)
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L4
.L5:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L4:
	cmpq	$0, -8(%rbp)
	jne	.L5
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print_list, .-print_list
	.section	.rodata
	.align 8
.LC4:
	.string	"usage: lottery <seed> <loops>\n"
.LC5:
	.string	"winner: %d %d\n\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	cmpl	$3, -36(%rbp)
	je	.L7
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L7:
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -20(%rbp)
	movq	-48(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -16(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	srandom@PLT
	movl	$50, %edi
	call	insert
	movl	$100, %edi
	call	insert
	movl	$25, %edi
	call	insert
	movl	$0, %eax
	call	print_list
	movl	$0, -28(%rbp)
	jmp	.L8
.L13:
	movl	$0, -24(%rbp)
	call	random@PLT
	movq	%rax, %rdx
	movl	gtickets(%rip), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	cqto
	idivq	%rcx
	movq	%rdx, %rax
	movl	%eax, -12(%rbp)
	movq	head(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L9
.L12:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	addl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jg	.L15
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L9:
	cmpq	$0, -8(%rbp)
	jne	.L12
	jmp	.L11
.L15:
	nop
.L11:
	movl	$0, %eax
	call	print_list
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -28(%rbp)
.L8:
	movl	-28(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.L13
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.2964, @object
	.size	__PRETTY_FUNCTION__.2964, 7
__PRETTY_FUNCTION__.2964:
	.string	"insert"
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
