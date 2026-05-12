	.file	"project3.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
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
	.p2align 4
	.globl	print_hexdump
	.type	print_hexdump, @function
print_hexdump:
.LFB13:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC0, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	fopen
	testq	%rax, %rax
	je	.L16
	movq	%rax, %r13
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%r13, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rsp, %rdi
	call	fread
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L17
	movl	%r12d, %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	printf
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L19:
	movzbl	(%rsp,%rbx), %esi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	$16, %rbx
	je	.L18
.L5:
	cmpq	%rbx, %rbp
	ja	.L19
	movl	$.LC4, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	$16, %rbx
	jne	.L5
.L18:
	movl	$.LC5, %edi
	xorl	%eax, %eax
	leaq	(%rsp,%rbp), %r14
	movq	%rsp, %rbx
	call	printf
	call	__ctype_b_loc
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L8:
	movzbl	(%rbx), %edx
	movq	(%r15), %rax
	movq	%rdx, %rdi
	testb	$64, 1(%rax,%rdx,2)
	jne	.L14
	movl	$46, %edi
.L14:
	call	putchar
	addq	$1, %rbx
	cmpq	%rbx, %r14
	jne	.L8
	movl	$.LC6, %edi
	addl	%ebp, %r12d
	call	puts
	jmp	.L2
.L17:
	movq	%r13, %rdi
	call	fclose
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movl	$.LC1, %edi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	perror
	.cfi_endproc
.LFE13:
	.size	print_hexdump, .-print_hexdump
	.section	.rodata.str1.1
.LC7:
	.string	"binary.out"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$.LC7, %edi
	call	print_hexdump
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
