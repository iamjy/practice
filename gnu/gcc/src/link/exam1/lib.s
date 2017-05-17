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
	.file	"lib.c"
	.comm	i,4,4
	.text
	.align	2
	.global	set_i
	.type	set_i, %function
set_i:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	set_i, .-set_i
	.ident	"GCC: (Buildroot 2015.08.1-ge0f4659) 4.9.3"
	.section	.note.GNU-stack,"",%progbits
