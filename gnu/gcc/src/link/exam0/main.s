	.cpu cortex-a8
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfpv3-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.global	var1
	.data
	.align	2
	.type	var1, %object
	.size	var1, 4
var1:
	.word	286331153
	.comm	var2,4,4
	.global	var3
	.bss
	.align	2
	.type	var3, %object
	.size	var3, 4
var3:
	.space	4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"This is main() function!\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	puts
	bl	func1
	bl	func2
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
	.local	var5.4556
	.comm	var5.4556,4,4
	.data
	.align	2
	.type	var4.4555, %object
	.size	var4.4555, 4
var4.4555:
	.word	572662306
	.ident	"GCC: (Buildroot 2015.08.1-ge0f4659) 4.9.3"
	.section	.note.GNU-stack,"",%progbits
