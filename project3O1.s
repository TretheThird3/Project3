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
	.globl	print_hexdump
	.type	print_hexdump, @function
print_hexdump:
.LFB13:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	movl	$.LC0, %esi
	call	fopen
	testq	%rax, %rax
	je	.L15
	movq	%rax, %r14
	movl	$0, %r13d
	jmp	.L2
.L15:
	movl	$.LC1, %edi
	call	perror
	jmp	.L1
.L4:
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
.L5:
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L16
.L6:
	cmpq	%rbx, %rbp
	jbe	.L4
	movzbl	(%rsp,%rbx), %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	jmp	.L5
.L16:
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	call	__ctype_b_loc
	movq	%rax, %r12
	movq	%rsp, %rbx
	leaq	(%rbx,%rbp), %r15
	jmp	.L9
.L7:
	movl	$46, %edi
	call	putchar
.L8:
	addq	$1, %rbx
	cmpq	%rbx, %r15
	je	.L17
.L9:
	movzbl	(%rbx), %edi
	movzbl	%dil, %edx
	movq	(%r12), %rax
	testb	$64, 1(%rax,%rdx,2)
	je	.L7
	movzbl	%dil, %edi
	call	putchar
	jmp	.L8
.L17:
	movl	$.LC6, %edi
	call	puts
	addl	%ebp, %r13d
.L2:
	movq	%r14, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rsp, %rdi
	call	fread
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L18
	movl	%r13d, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %ebx
	jmp	.L6
.L18:
	movq	%r14, %rdi
	call	fclose
.L1:
	addq	$24, %rsp
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
	.cfi_endproc
.LFE13:
	.size	print_hexdump, .-print_hexdump
	.section	.rodata.str1.1
.LC7:
	.string	"binary.out"
	.text
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$.LC7, %edi
	call	print_hexdump
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
