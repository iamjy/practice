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
	.file	"funcs.c"
	.global	var8
	.data
	.align	2
	.type	var8, %object
	.size	var8, 4
var8:
	.word	858993459
	.global	var9
	.section	.rodata
	.align	2
	.type	var9, %object
	.size	var9, 4
var9:
	.word	305419896
	.comm	var10,4,4
	.align	2
.LC0:
	.ascii	"This is func1() function!\000"
	.align	2
.LC1:
	.ascii	"var1 = 0x%X, var2 = 0x%X\012\000"
	.section	.test,"ax",%progbits
	.align	2
	.global	func1
	.type	func1, %function
func1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	puts
	movw	r3, #:lower16:var1
	movt	r3, #:upper16:var1
	ldr	r2, [r3]
	movw	r3, #:lower16:var2
	movt	r3, #:upper16:var2
	ldr	r3, [r3]
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	mov	r1, r2
	mov	r2, r3
	bl	printf
	ldmfd	sp!, {fp, pc}
	.size	func1, .-func1
	.section	.rodata
	.align	2
.LC2:
	.ascii	"This is func2() function!\000"
	.section	.test
	.align	2
	.global	func2
	.type	func2, %function
func2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	ldmfd	sp!, {fp, pc}
	.size	func2, .-func2
	.ident	"GCC: (Buildroot 2015.08.1-ge0f4659) 4.9.3"
	.section	.note.GNU-stack,"",%progbits
