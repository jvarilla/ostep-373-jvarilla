	.file	"threadsv1.c"
	.text
	.comm	m,40,32
	.globl	counter
	.bss
	.align 4
	.type	counter, @object
	.size	counter, 4
counter:
	.zero	4
	.comm	loops,4,4
	.section	.rodata
.LC0:
	.string	"threadsv1.c"
.LC1:
	.string	"pthread_mutex_lock(&m) == 0"
.LC2:
	.string	"pthread_mutex_unlock(&m) == 0"
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
.L5:
	leaq	m(%rip), %rdi
	call	pthread_mutex_lock@PLT
	testl	%eax, %eax
	je	.L3
	leaq	__PRETTY_FUNCTION__.3315(%rip), %rcx
	movl	$12, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	__assert_fail@PLT
.L3:
	movl	counter(%rip), %eax
	addl	$1, %eax
	movl	%eax, counter(%rip)
	leaq	m(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	testl	%eax, %eax
	je	.L4
	leaq	__PRETTY_FUNCTION__.3315(%rip), %rcx
	movl	$14, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L4:
	addl	$1, -4(%rbp)
.L2:
	movl	loops(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L5
	movl	$0, %edi
	call	pthread_exit@PLT
	.cfi_endproc
.LFE5:
	.size	worker, .-worker
	.section	.rodata
.LC3:
	.string	"usage: threads <value>\n"
.LC4:
	.string	"Initial value : %d\n"
	.align 8
.LC5:
	.string	"pthread_create(&p1, ((void *)0), worker, ((void *)0)) == 0"
	.align 8
.LC6:
	.string	"pthread_create(&p2, ((void *)0), worker, ((void *)0)) == 0"
	.align 8
.LC7:
	.string	"pthread_join(p1, ((void *)0)) == 0"
	.align 8
.LC8:
	.string	"pthread_join(p2, ((void *)0)) == 0"
.LC9:
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
	je	.L7
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$23, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L7:
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, loops(%rip)
	movl	counter(%rip), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %esi
	leaq	m(%rip), %rdi
	call	pthread_mutex_init@PLT
	leaq	-24(%rbp), %rax
	movl	$0, %ecx
	leaq	worker(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	je	.L8
	leaq	__PRETTY_FUNCTION__.3325(%rip), %rcx
	movl	$28, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	__assert_fail@PLT
.L8:
	leaq	-16(%rbp), %rax
	movl	$0, %ecx
	leaq	worker(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	je	.L9
	leaq	__PRETTY_FUNCTION__.3325(%rip), %rcx
	movl	$29, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	__assert_fail@PLT
.L9:
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L10
	leaq	__PRETTY_FUNCTION__.3325(%rip), %rcx
	movl	$30, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	__assert_fail@PLT
.L10:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L11
	leaq	__PRETTY_FUNCTION__.3325(%rip), %rcx
	movl	$31, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	__assert_fail@PLT
.L11:
	movl	counter(%rip), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.3315, @object
	.size	__PRETTY_FUNCTION__.3315, 7
__PRETTY_FUNCTION__.3315:
	.string	"worker"
	.type	__PRETTY_FUNCTION__.3325, @object
	.size	__PRETTY_FUNCTION__.3325, 5
__PRETTY_FUNCTION__.3325:
	.string	"main"
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
