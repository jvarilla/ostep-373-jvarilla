	.file	"threadsv0.c"
	.text
	.globl	counter
	.bss
	.align 4
	.type	counter, @object
	.size	counter, 4
counter:
	.zero	4
	.comm	loops,4,4
	.text
	.globl	worker
	.type	worker, @function
worker:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	counter(%rip), %eax
	addl	$1, %eax
	movl	%eax, counter(%rip)
	addl	$1, -4(%rbp)
.L2:
	movl	loops(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L3
	movl	$0, %edi
	call	pthread_exit@PLT
	.cfi_endproc
.LFE5:
	.size	worker, .-worker
	.section	.rodata
.LC0:
	.string	"usage: threads <loops>\n"
.LC1:
	.string	"Initial value : %d\n"
.LC2:
	.string	"threadsv0.c"
	.align 8
.LC3:
	.string	"pthread_create(&p1, ((void *)0), worker, ((void *)0)) == 0"
	.align 8
.LC4:
	.string	"pthread_create(&p2, ((void *)0), worker, ((void *)0)) == 0"
	.align 8
.LC5:
	.string	"pthread_join(p1, ((void *)0)) == 0"
	.align 8
.LC6:
	.string	"pthread_join(p2, ((void *)0)) == 0"
.LC7:
	.string	"Final value   : %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$2, -36(%rbp)
	je	.L5
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$23, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L5:
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, loops(%rip)
	movl	counter(%rip), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-24(%rbp), %rax
	movl	$0, %ecx
	leaq	worker(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	je	.L6
	leaq	__PRETTY_FUNCTION__.3323(%rip), %rcx
	movl	$24, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
.L6:
	leaq	-16(%rbp), %rax
	movl	$0, %ecx
	leaq	worker(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	je	.L7
	leaq	__PRETTY_FUNCTION__.3323(%rip), %rcx
	movl	$25, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	__assert_fail@PLT
.L7:
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L8
	leaq	__PRETTY_FUNCTION__.3323(%rip), %rcx
	movl	$26, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	__assert_fail@PLT
.L8:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L9
	leaq	__PRETTY_FUNCTION__.3323(%rip), %rcx
	movl	$27, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	__assert_fail@PLT
.L9:
	movl	counter(%rip), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.3323, @object
	.size	__PRETTY_FUNCTION__.3323, 5
__PRETTY_FUNCTION__.3323:
	.string	"main"
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
