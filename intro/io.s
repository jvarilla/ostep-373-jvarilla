	.file	"io.c"
	.text
	.section	.rodata
.LC0:
	.string	"/tmp/file"
.LC1:
	.string	"io.c"
.LC2:
	.string	"fd >= 0"
.LC3:
	.string	"rc == (strlen(buffer))"
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
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$384, %edx
	movl	$577, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jns	.L2
	leaq	__PRETTY_FUNCTION__.3362(%rip), %rcx
	movl	$11, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L2:
	leaq	-48(%rbp), %rax
	movabsq	$8031924123371070824, %rbx
	movq	%rbx, (%rax)
	movl	$174353522, 8(%rax)
	movb	$0, 12(%rax)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-48(%rbp), %rcx
	movl	-56(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	%eax, -52(%rbp)
	movl	-52(%rbp), %eax
	movslq	%eax, %rbx
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	%rax, %rbx
	je	.L3
	leaq	__PRETTY_FUNCTION__.3362(%rip), %rcx
	movl	$15, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
.L3:
	movl	-56(%rbp), %eax
	movl	%eax, %edi
	call	fsync@PLT
	movl	-56(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.3362, @object
	.size	__PRETTY_FUNCTION__.3362, 5
__PRETTY_FUNCTION__.3362:
	.string	"main"
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
