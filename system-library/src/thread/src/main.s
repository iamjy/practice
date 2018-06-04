	.syntax unified
	.arch armv7-a
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
	.thumb
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Failed to init mutex!\012\000"
	.align	2
.LC1:
	.ascii	"Failed to init condition value!\012\000"
	.align	2
.LC2:
	.ascii	"Failed to init attr!\012\000"
	.align	2
.LC3:
	.ascii	"snd_th stack size %ld\012\000"
	.align	2
.LC4:
	.ascii	"rcv_th stack size %ld\012\000"
	.align	2
.LC5:
	.ascii	"dt_th stack size %ld\012\000"
	.align	2
.LC6:
	.ascii	"Failed to setdetachestate for dt_attr!\012\000"
	.align	2
.LC7:
	.ascii	"Failed to create a sig_receive_thread!\012\000"
	.align	2
.LC8:
	.ascii	"Failed to create a sig_send_thread!\012\000"
	.align	2
.LC9:
	.ascii	"Failed to create a detached_thread0!\012\000"
	.align	2
.LC10:
	.ascii	"Failed to create a detached_thread1!\012\000"
	.align	2
.LC11:
	.ascii	"Failed to join the sig_receive_thread!\012\000"
	.align	2
.LC12:
	.ascii	"ret_val %d\012\000"
	.align	2
.LC13:
	.ascii	"Failed to join the sig_send_thread!\012\000"
	.align	2
.LC14:
	.ascii	"Failed to destroy attr!\012\000"
	.align	2
.LC15:
	.ascii	"Failed to destroy condition variable!\012\000"
	.align	2
.LC16:
	.ascii	"Failed to destroy mutex variable!\012\000"
	.text
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
.LFB2:
	.file 1 "main.c"
	.loc 1 46 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 224
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #224
	.cfi_def_cfa_offset 232
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 47 0
	mov	r3, #-1
	str	r3, [r7, #220]
	.loc 1 48 0
	movs	r3, #0
	strb	r3, [r7, #219]
	.loc 1 49 0
	mov	r3, #-1
	str	r3, [r7, #212]
	.loc 1 50 0
	movs	r3, #0
	str	r3, [r7, #208]
	.loc 1 51 0
	movs	r3, #0
	str	r3, [r7, #204]
	.loc 1 64 0
	movs	r3, #0
	str	r3, [r7, #200]
	.loc 1 65 0
	movs	r3, #0
	str	r3, [r7, #196]
	.loc 1 67 0
	add	r2, r7, #72
	add	r3, r7, #48
	mov	r1, r2
	mov	r0, r3
	bl	pthread_mutex_init
	str	r0, [r7, #220]
	.loc 1 68 0
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L2
	.loc 1 70 0
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	perror
	.loc 1 71 0
	bl	__errno_location
	mov	r3, r0
	ldr	r3, [r3]
	b	.L18
.L2:
	.loc 1 74 0
	add	r2, r7, #76
	mov	r3, r7
	mov	r1, r2
	mov	r0, r3
	bl	pthread_cond_init
	str	r0, [r7, #220]
	.loc 1 75 0
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L4
	.loc 1 77 0
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	perror
	.loc 1 78 0
	bl	__errno_location
	mov	r3, r0
	ldr	r3, [r3]
	b	.L18
.L4:
	.loc 1 81 0
	add	r3, r7, #152
	mov	r0, r3
	bl	pthread_attr_init
	mov	r3, r0
	cmp	r3, #0
	bne	.L5
	.loc 1 82 0 discriminator 1
	add	r3, r7, #116
	mov	r0, r3
	bl	pthread_attr_init
	mov	r3, r0
	.loc 1 81 0 discriminator 1
	cmp	r3, #0
	bne	.L5
	.loc 1 83 0
	add	r3, r7, #80
	mov	r0, r3
	bl	pthread_attr_init
	mov	r3, r0
	.loc 1 82 0
	cmp	r3, #0
	beq	.L6
.L5:
	.loc 1 85 0
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	perror
	.loc 1 86 0
	bl	__errno_location
	mov	r3, r0
	ldr	r3, [r3]
	b	.L18
.L6:
	.loc 1 89 0
	add	r2, r7, #204
	add	r3, r7, #152
	mov	r1, r2
	mov	r0, r3
	bl	pthread_attr_getstacksize
	.loc 1 90 0
	ldr	r3, [r7, #204]
	mov	r1, r3
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	printf
	.loc 1 91 0
	add	r2, r7, #204
	add	r3, r7, #116
	mov	r1, r2
	mov	r0, r3
	bl	pthread_attr_getstacksize
	.loc 1 92 0
	ldr	r3, [r7, #204]
	mov	r1, r3
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	printf
	.loc 1 93 0
	add	r2, r7, #204
	add	r3, r7, #80
	mov	r1, r2
	mov	r0, r3
	bl	pthread_attr_getstacksize
	.loc 1 94 0
	ldr	r3, [r7, #204]
	mov	r1, r3
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	printf
	.loc 1 96 0
	add	r3, r7, #80
	movs	r1, #1
	mov	r0, r3
	bl	pthread_attr_setdetachstate
	str	r0, [r7, #220]
	.loc 1 97 0
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L7
	.loc 1 99 0
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	bl	perror
	.loc 1 100 0
	bl	__errno_location
	mov	r3, r0
	ldr	r3, [r3]
	b	.L18
.L7:
	.loc 1 103 0
	movs	r3, #0
	str	r3, [r7, #212]
	.loc 1 104 0
	add	r3, r7, #212
	add	r1, r7, #116
	add	r0, r7, #196
	movw	r2, #:lower16:sig_receive_thread
	movt	r2, #:upper16:sig_receive_thread
	bl	pthread_create
	str	r0, [r7, #220]
	.loc 1 105 0
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L8
	.loc 1 107 0
	movw	r0, #:lower16:.LC7
	movt	r0, #:upper16:.LC7
	bl	perror
	.loc 1 108 0
	bl	__errno_location
	mov	r3, r0
	ldr	r3, [r3]
	b	.L18
.L8:
	.loc 1 111 0
	movs	r3, #0
	strb	r3, [r7, #219]
	.loc 1 112 0
	add	r3, r7, #219
	add	r1, r7, #152
	add	r0, r7, #200
	movw	r2, #:lower16:sig_send_thread
	movt	r2, #:upper16:sig_send_thread
	bl	pthread_create
	str	r0, [r7, #220]
	.loc 1 113 0
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L9
	.loc 1 115 0
	movw	r0, #:lower16:.LC8
	movt	r0, #:upper16:.LC8
	bl	perror
	.loc 1 116 0
	bl	__errno_location
	mov	r3, r0
	ldr	r3, [r3]
	b	.L18
.L9:
	.loc 1 119 0
	add	r1, r7, #80
	add	r0, r7, #192
	movs	r3, #0
	movw	r2, #:lower16:detached_thread
	movt	r2, #:upper16:detached_thread
	bl	pthread_create
	str	r0, [r7, #220]
	.loc 1 120 0
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L10
	.loc 1 122 0
	movw	r0, #:lower16:.LC9
	movt	r0, #:upper16:.LC9
	bl	perror
	.loc 1 123 0
	bl	__errno_location
	mov	r3, r0
	ldr	r3, [r3]
	b	.L18
.L10:
	.loc 1 125 0
	add	r1, r7, #80
	add	r0, r7, #188
	movs	r3, #0
	movw	r2, #:lower16:detached_thread
	movt	r2, #:upper16:detached_thread
	bl	pthread_create
	str	r0, [r7, #220]
	.loc 1 126 0
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L11
	.loc 1 128 0
	movw	r0, #:lower16:.LC10
	movt	r0, #:upper16:.LC10
	bl	perror
	.loc 1 129 0
	bl	__errno_location
	mov	r3, r0
	ldr	r3, [r3]
	b	.L18
.L11:
	.loc 1 132 0
	ldr	r3, [r7, #196]
	add	r2, r7, #208
	mov	r1, r2
	mov	r0, r3
	bl	pthread_join
	str	r0, [r7, #220]
	.loc 1 134 0
	ldr	r3, [r7, #196]
	add	r2, r7, #208
	mov	r1, r2
	mov	r0, r3
	bl	pthread_join
	str	r0, [r7, #220]
	.loc 1 135 0
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L12
	.loc 1 137 0
	movw	r0, #:lower16:.LC11
	movt	r0, #:upper16:.LC11
	bl	perror
	.loc 1 138 0
	bl	__errno_location
	mov	r3, r0
	ldr	r3, [r3]
	b	.L18
.L12:
	.loc 1 140 0
	ldr	r3, [r7, #208]
	mov	r1, r3
	movw	r0, #:lower16:.LC12
	movt	r0, #:upper16:.LC12
	bl	printf
	.loc 1 142 0
	ldr	r3, [r7, #200]
	add	r2, r7, #208
	mov	r1, r2
	mov	r0, r3
	bl	pthread_join
	str	r0, [r7, #220]
	.loc 1 143 0
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L13
	.loc 1 145 0
	movw	r0, #:lower16:.LC13
	movt	r0, #:upper16:.LC13
	bl	perror
	.loc 1 146 0
	bl	__errno_location
	mov	r3, r0
	ldr	r3, [r3]
	b	.L18
.L13:
	.loc 1 148 0
	ldr	r3, [r7, #208]
	mov	r1, r3
	movw	r0, #:lower16:.LC12
	movt	r0, #:upper16:.LC12
	bl	printf
	.loc 1 150 0
	add	r3, r7, #152
	mov	r0, r3
	bl	pthread_attr_destroy
	mov	r3, r0
	cmp	r3, #0
	bne	.L14
	.loc 1 151 0 discriminator 1
	add	r3, r7, #116
	mov	r0, r3
	bl	pthread_attr_destroy
	mov	r3, r0
	.loc 1 150 0 discriminator 1
	cmp	r3, #0
	bne	.L14
	.loc 1 152 0
	add	r3, r7, #80
	mov	r0, r3
	bl	pthread_attr_destroy
	mov	r3, r0
	.loc 1 151 0
	cmp	r3, #0
	beq	.L15
.L14:
	.loc 1 154 0
	movw	r0, #:lower16:.LC14
	movt	r0, #:upper16:.LC14
	bl	perror
.L15:
	.loc 1 157 0
	mov	r3, r7
	mov	r0, r3
	bl	pthread_cond_destroy
	str	r0, [r7, #220]
	.loc 1 158 0
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L16
	.loc 1 159 0
	movw	r0, #:lower16:.LC15
	movt	r0, #:upper16:.LC15
	bl	perror
.L16:
	.loc 1 161 0
	add	r3, r7, #48
	mov	r0, r3
	bl	pthread_mutex_destroy
	str	r0, [r7, #220]
	.loc 1 162 0
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L17
	.loc 1 163 0
	movw	r0, #:lower16:.LC16
	movt	r0, #:upper16:.LC16
	bl	perror
.L17:
	.loc 1 165 0
	movs	r3, #0
.L18:
	.loc 1 166 0 discriminator 1
	mov	r0, r3
	adds	r7, r7, #224
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE2:
	.size	main, .-main
.Letext0:
	.file 2 "/media/iamjy1005/978ada6f-9596-4951-b412-6e8a78f4241d/backup/root/opt/toolchain/arm/linux/linaro/latest-4/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/lib/gcc/arm-linux-gnueabihf/4.9.4/include/stddef.h"
	.file 3 "/media/iamjy1005/978ada6f-9596-4951-b412-6e8a78f4241d/backup/root/opt/toolchain/arm/linux/linaro/latest-4/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/include/bits/pthreadtypes.h"
	.file 4 "/media/iamjy1005/978ada6f-9596-4951-b412-6e8a78f4241d/backup/root/opt/toolchain/arm/linux/linaro/latest-4/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/include/pthread.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3d8
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0x1
	.4byte	.LASF58
	.4byte	.LASF59
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x2
	.byte	0xd4
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x6
	.4byte	0x7f
	.4byte	0x96
	.uleb128 0x7
	.4byte	0x76
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x25
	.4byte	0x68
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x24
	.byte	0x3
	.byte	0x28
	.4byte	0xc4
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x3
	.byte	0x2a
	.4byte	0xc4
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x3
	.byte	0x2b
	.4byte	0x6f
	.byte	0
	.uleb128 0x6
	.4byte	0x7f
	.4byte	0xd4
	.uleb128 0x7
	.4byte	0x76
	.byte	0x23
	.byte	0
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x3
	.byte	0x2e
	.4byte	0xa1
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x4
	.byte	0x3
	.byte	0x33
	.4byte	0xf8
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.byte	0x35
	.4byte	0xf8
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xdf
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x3
	.byte	0x36
	.4byte	0xdf
	.uleb128 0xd
	.byte	0x4
	.byte	0x3
	.byte	0x46
	.4byte	0x128
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x3
	.byte	0x48
	.4byte	0x33
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x3
	.byte	0x49
	.4byte	0xfe
	.byte	0
	.uleb128 0xa
	.4byte	.LASF20
	.byte	0x18
	.byte	0x3
	.byte	0x3d
	.4byte	0x177
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.byte	0x3f
	.4byte	0x33
	.byte	0
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.byte	0x40
	.4byte	0x4f
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x3
	.byte	0x41
	.4byte	0x33
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x3
	.byte	0x44
	.4byte	0x33
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x3
	.byte	0x45
	.4byte	0x4f
	.byte	0x10
	.uleb128 0xe
	.4byte	0x109
	.byte	0x14
	.byte	0
	.uleb128 0xd
	.byte	0x18
	.byte	0x3
	.byte	0x3b
	.4byte	0x1a1
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x3
	.byte	0x4b
	.4byte	0x128
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x3
	.byte	0x4c
	.4byte	0x1a1
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x3
	.byte	0x4d
	.4byte	0x6f
	.byte	0
	.uleb128 0x6
	.4byte	0x7f
	.4byte	0x1b1
	.uleb128 0x7
	.4byte	0x76
	.byte	0x17
	.byte	0
	.uleb128 0x4
	.4byte	.LASF28
	.byte	0x3
	.byte	0x4e
	.4byte	0x177
	.uleb128 0xd
	.byte	0x4
	.byte	0x3
	.byte	0x50
	.4byte	0x1db
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x3
	.byte	0x52
	.4byte	0x86
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x3
	.byte	0x53
	.4byte	0x6f
	.byte	0
	.uleb128 0x4
	.4byte	.LASF29
	.byte	0x3
	.byte	0x54
	.4byte	0x1bc
	.uleb128 0xf
	.byte	0x30
	.byte	0x3
	.byte	0x5b
	.4byte	0x24f
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.byte	0x5d
	.4byte	0x33
	.byte	0
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x3
	.byte	0x5e
	.4byte	0x4f
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x3
	.byte	0x5f
	.4byte	0x56
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x3
	.byte	0x60
	.4byte	0x56
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x3
	.byte	0x61
	.4byte	0x56
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x3
	.byte	0x62
	.4byte	0x7d
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x3
	.byte	0x63
	.4byte	0x4f
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x3
	.byte	0x64
	.4byte	0x4f
	.byte	0x28
	.byte	0
	.uleb128 0xd
	.byte	0x30
	.byte	0x3
	.byte	0x59
	.4byte	0x279
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x3
	.byte	0x65
	.4byte	0x1e6
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x3
	.byte	0x66
	.4byte	0x279
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x3
	.byte	0x67
	.4byte	0x3a
	.byte	0
	.uleb128 0x6
	.4byte	0x7f
	.4byte	0x289
	.uleb128 0x7
	.4byte	0x76
	.byte	0x2f
	.byte	0
	.uleb128 0x4
	.4byte	.LASF37
	.byte	0x3
	.byte	0x68
	.4byte	0x24f
	.uleb128 0xd
	.byte	0x4
	.byte	0x3
	.byte	0x6a
	.4byte	0x2b3
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x3
	.byte	0x6c
	.4byte	0x86
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x3
	.byte	0x6d
	.4byte	0x6f
	.byte	0
	.uleb128 0x4
	.4byte	.LASF38
	.byte	0x3
	.byte	0x6e
	.4byte	0x294
	.uleb128 0x10
	.byte	0x4
	.byte	0x4
	.byte	0x21
	.4byte	0x2d3
	.uleb128 0x11
	.4byte	.LASF39
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF40
	.sleb128 1
	.byte	0
	.uleb128 0x12
	.4byte	.LASF60
	.byte	0x1
	.byte	0x2d
	.4byte	0x33
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d4
	.uleb128 0x13
	.ascii	"ret\000"
	.byte	0x1
	.byte	0x2f
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF41
	.byte	0x1
	.byte	0x30
	.4byte	0x3d4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x14
	.4byte	.LASF42
	.byte	0x1
	.byte	0x31
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x32
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.byte	0x33
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF45
	.byte	0x1
	.byte	0x34
	.4byte	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF46
	.byte	0x1
	.byte	0x35
	.4byte	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.byte	0x36
	.4byte	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x37
	.4byte	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0x1
	.byte	0x38
	.4byte	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x14
	.4byte	.LASF50
	.byte	0x1
	.byte	0x39
	.4byte	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x1
	.byte	0x3a
	.4byte	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x1
	.byte	0x3b
	.4byte	0x2b3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x1
	.byte	0x3c
	.4byte	0x1db
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x14
	.4byte	.LASF54
	.byte	0x1
	.byte	0x3d
	.4byte	0x1b1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x14
	.4byte	.LASF55
	.byte	0x1
	.byte	0x3e
	.4byte	0x289
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF56
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF2:
	.ascii	"long long int\000"
.LASF14:
	.ascii	"__align\000"
.LASF11:
	.ascii	"size_t\000"
.LASF45:
	.ascii	"snd_th\000"
.LASF44:
	.ascii	"stack_sz\000"
.LASF50:
	.ascii	"rcv_attr\000"
.LASF37:
	.ascii	"pthread_cond_t\000"
.LASF8:
	.ascii	"long int\000"
.LASF53:
	.ascii	"mtx_attr\000"
.LASF1:
	.ascii	"short int\000"
.LASF40:
	.ascii	"PTHREAD_CREATE_DETACHED\000"
.LASF39:
	.ascii	"PTHREAD_CREATE_JOINABLE\000"
.LASF46:
	.ascii	"rcv_th\000"
.LASF32:
	.ascii	"__wakeup_seq\000"
.LASF22:
	.ascii	"__lock\000"
.LASF25:
	.ascii	"__kind\000"
.LASF28:
	.ascii	"pthread_mutex_t\000"
.LASF19:
	.ascii	"__pthread_internal_slist\000"
.LASF36:
	.ascii	"__broadcast_seq\000"
.LASF12:
	.ascii	"pthread_t\000"
.LASF43:
	.ascii	"ret_val\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF13:
	.ascii	"__size\000"
.LASF59:
	.ascii	"/media/iamjy1005/97b53b95-bba5-4bcc-ab12-5539c6a738"
	.ascii	"ef/work/lab/practice/system-library/src/thread/src\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF4:
	.ascii	"short unsigned int\000"
.LASF33:
	.ascii	"__woken_seq\000"
.LASF20:
	.ascii	"__pthread_mutex_s\000"
.LASF42:
	.ascii	"rcv_val\000"
.LASF34:
	.ascii	"__mutex\000"
.LASF26:
	.ascii	"__nusers\000"
.LASF31:
	.ascii	"__total_seq\000"
.LASF41:
	.ascii	"snd_val\000"
.LASF52:
	.ascii	"cond_attr\000"
.LASF18:
	.ascii	"__list\000"
.LASF5:
	.ascii	"unsigned int\000"
.LASF55:
	.ascii	"d_cond\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF17:
	.ascii	"__spins\000"
.LASF60:
	.ascii	"main\000"
.LASF51:
	.ascii	"dt_attr\000"
.LASF24:
	.ascii	"__owner\000"
.LASF47:
	.ascii	"dt_th0\000"
.LASF48:
	.ascii	"dt_th1\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF58:
	.ascii	"main.c\000"
.LASF35:
	.ascii	"__nwaiters\000"
.LASF29:
	.ascii	"pthread_mutexattr_t\000"
.LASF16:
	.ascii	"__pthread_slist_t\000"
.LASF49:
	.ascii	"snd_attr\000"
.LASF23:
	.ascii	"__count\000"
.LASF30:
	.ascii	"__futex\000"
.LASF54:
	.ascii	"d_lock\000"
.LASF38:
	.ascii	"pthread_condattr_t\000"
.LASF57:
	.ascii	"GNU C 4.9.4 -march=armv7-a -mtune=cortex-a9 -mfloat"
	.ascii	"-abi=hard -mfpu=vfpv3-d16 -mthumb -mtls-dialect=gnu"
	.ascii	" -g\000"
.LASF10:
	.ascii	"char\000"
.LASF15:
	.ascii	"pthread_attr_t\000"
.LASF21:
	.ascii	"__next\000"
.LASF0:
	.ascii	"signed char\000"
.LASF27:
	.ascii	"__data\000"
.LASF56:
	.ascii	"_Bool\000"
	.ident	"GCC: (Linaro GCC 4.9-2017.01) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
