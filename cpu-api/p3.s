	.file	"p3.c"
	.text
	.section	.rodata
.LC0:
	.string	"hello world (pid:%d)\n"
.LC1:
	.string	"fork failed\n"
.LC2:
	.string	"hello, I am child (pid:%d)\n"
.LC3:
	.string	"wc"
.LC4:
	.string	"p3.c"
.LC5:
	.string	"this shouldn't print out"
	.align 8
.LC6:
	.string	"hello, I am parent of %d (wc:%d) (pid:%d)\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	getpid@PLT
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	call	fork@PLT
	movl	%eax, -40(%rbp)
	cmpl	$0, -40(%rbp)
	jns	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	cmpl	$0, -40(%rbp)
	jne	.L3
	call	getpid@PLT
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC3(%rip), %rdi
	call	strdup@PLT
	movq	%rax, -32(%rbp)
	leaq	.LC4(%rip), %rdi
	call	strdup@PLT
	movq	%rax, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	-32(%rbp), %rax
	leaq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L4
.L3:
	movl	$0, %edi
	call	wait@PLT
	movl	%eax, -36(%rbp)
	call	getpid@PLT
	movl	%eax, %ecx
	movl	-36(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L4:
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
