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
	.file	"builtin-prefetch.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	mov	r3, #2
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [r3, #-16]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	sub	r1, fp, #4
	add	r3, r1, r3
	ldr	r3, [r3, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	sub	r2, fp, #20
	mov	r3, r3, asl #2
	add	r3, r2, r3
	pld	[r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	sub	r2, fp, #28
	mov	r3, r3, asl #2
	add	r3, r2, r3
	pld	[r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	blt	.L3
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	main, .-main
	.ident	"GCC: (Buildroot 2015.08.1-ge0f4659) 4.9.3"
	.section	.note.GNU-stack,"",%progbits
