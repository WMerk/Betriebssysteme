	.file	"funktion.c"
	.comm	ein_Array,40,32
	.globl	eine_initialisierte_Zahl
	.data
	.align 4
	.type	eine_initialisierte_Zahl, @object
	.size	eine_initialisierte_Zahl, 4
eine_initialisierte_Zahl:
	.long	200
	.comm	a,4,4
	.comm	b,4,4
	.comm	c,4,4
	.text
	.globl	func
	.type	func, @function
func:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	imull	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	func, .-func
	.section	.rodata
.LC0:
	.string	"Ergebnis: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$4, %esp
	movl	$10, a
	movl	$300, b
	movl	b, %eax
	testl	%eax, %eax
	jle	.L4
	movl	b, %edx
	movl	c, %eax
	addl	%edx, %eax
	movl	%eax, a
.L4:
	movl	b, %edx
	movl	a, %eax
	pushl	%edx
	pushl	%eax
	call	func
	addl	$8, %esp
	movl	%eax, b
	movl	b, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	movl	$0, %eax
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (SUSE Linux) 6.3.1 20170202 [gcc-6-branch revision 245119]"
	.section	.note.GNU-stack,"",@progbits
