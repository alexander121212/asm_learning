.data

format_string:
	.string	"answer --> %s\n"
yes_string:
	.string "yes"
	.set yes_string_len, 	.-yes_string - 1
no_string:
	.string "no" 
	.set no_string_len, 	.-no_string - 1

triangle_sides:
	.long 0x00000003, 0x00000004, 0x00000005

.text
.globl main
main:

	movl	triangle_sides,		%eax
	movl	triangle_sides+4,	%ebx
	movl	triangle_sides+8,	%ecx
	call 	check_sides
	
	testl	%eax,	%eax
	je	print_no

	movl	triangle_sides+4,	%eax
	movl	triangle_sides+8,	%ebx
	movl	triangle_sides,		%ecx
	call 	check_sides
	
	testl	%eax,	%eax
	je	print_no

	movl	triangle_sides+8,	%eax
	movl	triangle_sides,		%ebx
	movl	triangle_sides+4,	%ecx
	call 	check_sides
	
	testl	%eax,	%eax
	je	print_no

	call print_yes

	movq	$1, 		%rax
	movq	$0, 		%rbx
	int	$0x80

check_sides:
 	pushq 	%rbp
        movq  	%rsp, 	%rbp

	addl	%eax,	%ebx
	cmpl	%ecx,	%ebx
	jg 	true_result
	movl	$0,	%eax

        movq  	%rbp, 	%rsp
        popq  	%rbp
	ret

true_result:
	movl	$1,	%eax

        movq  	%rbp, 	%rsp
        popq  	%rbp
	ret

print_yes:
 	pushq 	%rbp
        movq  	%rsp, 	%rbp

	movl	$4, 		%eax
	movl	$1, 		%ebx
	movl	$yes_string, 	%ecx
	movl	$yes_string_len, %edx
	int	$0x80

        movq  	%rbp, 	%rsp
        popq  	%rbp
	ret

print_no:
 	pushq 	%rbp
        movq  	%rsp, 	%rbp

	movl	$4, 		%eax
	movl	$1, 		%ebx
	movl	$no_string, 	%ecx
	movl	$no_string_len, %edx
	int	$0x80

        movq  	%rbp, 	%rsp
        popq  	%rbp
	ret
