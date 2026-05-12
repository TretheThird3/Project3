	.file	"project3.c"
	.text
	.section	.rodata
.LC0:
	.string	"rb"
.LC1:
	.string	"Error opening file"
.LC2:
	.string	"%08x  "
.LC3:
	.string	"%02x "
.LC4:
	.string	"   "
.LC5:
	.string	" |"
.LC6:
	.string	"|"
	.text
	.globl	print_hexdump
	.type	print_hexdump, @function
print_hexdump:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L2
	movl	$.LC1, %edi
	call	perror
	jmp	.L1
.L2:
	movl	$0, -4(%rbp)
	jmp	.L4
.L13:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -8(%rbp)
	jmp	.L5
.L8:
	movl	-8(%rbp), %eax
	cltq
	cmpq	%rax, -32(%rbp)
	jbe	.L6
	movl	-8(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	jmp	.L7
.L6:
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
.L7:
	addl	$1, -8(%rbp)
.L5:
	cmpl	$15, -8(%rbp)
	jle	.L8
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -12(%rbp)
	jmp	.L9
.L12:
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	movzbl	%al, %eax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$16384, %eax
	testl	%eax, %eax
	je	.L10
	movl	-12(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	putchar
	jmp	.L11
.L10:
	movl	$46, %edi
	call	putchar
.L11:
	addl	$1, -12(%rbp)
.L9:
	movl	-12(%rbp), %eax
	cltq
	cmpq	%rax, -32(%rbp)
	ja	.L12
	movl	$.LC6, %edi
	call	puts
	movq	-32(%rbp), %rax
	addl	%eax, -4(%rbp)
.L4:
	movq	-24(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L13
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L1:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	print_hexdump, .-print_hexdump
	.section	.rodata
.LC7:
	.string	"binary.out"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$.LC7, %edi
	call	print_hexdump
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
