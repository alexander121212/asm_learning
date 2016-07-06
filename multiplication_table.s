.data
input_promt:
	.string "enter size (0-255)"
	.set	input_promt_size, .-input_promt
scanf_format:
	.string "%d"

printf_format:
	.string "%5ll "

printf_newline:
	.string "\n"
	.set	printf_newline_size, .-printf_newline

size:
	.long 0x00000000

.text
.globl main
main:

	movq	$4, 			%rax
	movq	$1, 			%rbx
	movq	$input_promt, 		%rcx
	movq	$input_promt_size, 	%rdx
	int	$0x80

	pushq	$size
	pushq	$scanf_format
	call	scanf
	addq	$16,	%rsp 	

	movq	$0,	%rax
	movq	$0,	%rbx


print_line:
	incq	%rbx
	cmpq	size,	%rcx
	ja	print_line_end

	movq	$0,	%rcx

print_num:
	incq	%rcx
	cmpq	size,	%rcx
	ja	print_num_end

	movb	%bl,	%al
	mulb	%cl

	pushq	%rbx
	pushq	%rcx

	movq	%rax,	%rdx
	movq	$4, 	%rax
	movq	$1,	%rbx
	movq	%rdx,	%rcx
	movq	$4, 	%rdx
	int	$0x80

	popq	%rcx
	popq	%rbx

	jmp	print_num


print_num_end:
	pushq	%rbx
	
	movq	$4, 			%rax
	movq	$1, 			%rbx
	movq	$printf_newline, 	%rcx
	movq	$printf_newline_size, 	%rdx
	int	$0x80

	popq	%rbx

	jmp	print_line

print_line_end:
	movq	$0, %rax
	ret

