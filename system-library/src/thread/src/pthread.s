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
	.file	"pthread.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.local	s_cond
	.comm	s_cond,48,8
	.local	d_cond
	.comm	d_cond,48,8
	.local	s_lock
	.comm	s_lock,24,4
	.local	d_lock
	.comm	d_lock,24,4
	.local	g_cnt
	.comm	g_cnt,4,4
	.local	vg_cnt
	.comm	vg_cnt,4,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"[%d]vg_cnt %d\012\000"
	.text
	.align	2
	.global	detached_thread
	.thumb
	.thumb_func
	.type	detached_thread, %function
detached_thread:
.LFB2:
	.file 1 "pthread.c"
	.loc 1 53 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 54 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 55 0
	bl	pthread_self
	str	r0, [r7, #8]
	.loc 1 57 0
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L2
.L3:
	.loc 1 58 0 discriminator 3
	movw	r0, #:lower16:d_lock
	movt	r0, #:upper16:d_lock
	bl	pthread_mutex_lock
	.loc 1 59 0 discriminator 3
	movw	r3, #:lower16:vg_cnt
	movt	r3, #:upper16:vg_cnt
	ldr	r2, [r3]
	adds	r1, r2, #1
	movw	r3, #:lower16:vg_cnt
	movt	r3, #:upper16:vg_cnt
	str	r1, [r3]
	ldr	r1, [r7, #8]
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	.loc 1 60 0 discriminator 3
	movs	r0, #1
	bl	sleep
	.loc 1 61 0 discriminator 3
	movw	r0, #:lower16:d_lock
	movt	r0, #:upper16:d_lock
	bl	pthread_mutex_unlock
	.loc 1 57 0 discriminator 3
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	.loc 1 57 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #12]
	movw	r3, #34463
	movt	r3, 1
	cmp	r2, r3
	ble	.L3
	.loc 1 64 0 is_stmt 1
	movs	r0, #0
	bl	pthread_exit
	.cfi_endproc
.LFE2:
	.size	detached_thread, .-detached_thread
	.section	.rodata
	.align	2
.LC1:
	.ascii	"s!\000"
	.text
	.align	2
	.global	sig_send_thread
	.thumb
	.thumb_func
	.type	sig_send_thread, %function
sig_send_thread:
.LFB3:
	.loc 1 68 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 69 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	strb	r3, [r7, #15]
.L6:
	.loc 1 73 0 discriminator 2
	movw	r0, #:lower16:s_cond
	movt	r0, #:upper16:s_cond
	bl	pthread_cond_signal
	.loc 1 75 0 discriminator 2
	ldrb	r3, [r7, #15]
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L5
	.loc 1 75 0 is_stmt 0 discriminator 1
	movw	r3, #:lower16:g_cnt
	movt	r3, #:upper16:g_cnt
	ldr	r3, [r3]
	cmp	r3, #9
	ble	.L6
.L5:
	.loc 1 77 0 is_stmt 1
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	puts
	.loc 1 79 0
	movw	r3, #:lower16:g_cnt
	movt	r3, #:upper16:g_cnt
	ldr	r3, [r3]
	mov	r0, r3
	bl	pthread_exit
	.cfi_endproc
.LFE3:
	.size	sig_send_thread, .-sig_send_thread
	.section	.rodata
	.align	2
.LC2:
	.ascii	"%d\012\000"
	.align	2
.LC3:
	.ascii	"r!\000"
	.text
	.align	2
	.global	sig_receive_thread
	.thumb
	.thumb_func
	.type	sig_receive_thread, %function
sig_receive_thread:
.LFB4:
	.loc 1 83 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 84 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	movw	r3, #:lower16:g_cnt
	movt	r3, #:upper16:g_cnt
	str	r2, [r3]
.L8:
	.loc 1 88 0 discriminator 1
	movw	r1, #:lower16:s_lock
	movt	r1, #:upper16:s_lock
	movw	r0, #:lower16:s_cond
	movt	r0, #:upper16:s_cond
	bl	pthread_cond_wait
	.loc 1 89 0 discriminator 1
	movw	r3, #:lower16:g_cnt
	movt	r3, #:upper16:g_cnt
	ldr	r2, [r3]
	adds	r1, r2, #1
	movw	r3, #:lower16:g_cnt
	movt	r3, #:upper16:g_cnt
	str	r1, [r3]
	mov	r1, r2
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	printf
	.loc 1 91 0 discriminator 1
	movw	r3, #:lower16:g_cnt
	movt	r3, #:upper16:g_cnt
	ldr	r3, [r3]
	cmp	r3, #9
	ble	.L8
	.loc 1 93 0
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	puts
	.loc 1 95 0
	movw	r3, #:lower16:g_cnt
	movt	r3, #:upper16:g_cnt
	ldr	r3, [r3]
	mov	r0, r3
	bl	pthread_exit
	.cfi_endproc
.LFE4:
	.size	sig_receive_thread, .-sig_receive_thread
.Letext0:
	.file 2 "/media/iamjy1005/978ada6f-9596-4951-b412-6e8a78f4241d/backup/root/opt/toolchain/arm/linux/linaro/latest-4/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/include/bits/pthreadtypes.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x320
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x1
	.4byte	.LASF48
	.4byte	.LASF49
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
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x5
	.4byte	.LASF11
	.byte	0x2
	.byte	0x25
	.4byte	0x5d
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x4
	.byte	0x2
	.byte	0x33
	.4byte	0x9f
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x2
	.byte	0x35
	.4byte	0x9f
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x86
	.uleb128 0x5
	.4byte	.LASF12
	.byte	0x2
	.byte	0x36
	.4byte	0x86
	.uleb128 0x9
	.byte	0x4
	.byte	0x2
	.byte	0x46
	.4byte	0xcf
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x2
	.byte	0x48
	.4byte	0x33
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x2
	.byte	0x49
	.4byte	0xa5
	.byte	0
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x18
	.byte	0x2
	.byte	0x3d
	.4byte	0x11e
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x2
	.byte	0x3f
	.4byte	0x33
	.byte	0
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x2
	.byte	0x40
	.4byte	0x4f
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x2
	.byte	0x41
	.4byte	0x33
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x2
	.byte	0x44
	.4byte	0x33
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x2
	.byte	0x45
	.4byte	0x4f
	.byte	0x10
	.uleb128 0xb
	.4byte	0xb0
	.byte	0x14
	.byte	0
	.uleb128 0x9
	.byte	0x18
	.byte	0x2
	.byte	0x3b
	.4byte	0x148
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x2
	.byte	0x4b
	.4byte	0xcf
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x2
	.byte	0x4c
	.4byte	0x148
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x2
	.byte	0x4d
	.4byte	0x64
	.byte	0
	.uleb128 0xc
	.4byte	0x74
	.4byte	0x158
	.uleb128 0xd
	.4byte	0x6b
	.byte	0x17
	.byte	0
	.uleb128 0x5
	.4byte	.LASF26
	.byte	0x2
	.byte	0x4e
	.4byte	0x11e
	.uleb128 0xe
	.byte	0x30
	.byte	0x2
	.byte	0x5b
	.4byte	0x1cc
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x2
	.byte	0x5d
	.4byte	0x33
	.byte	0
	.uleb128 0x7
	.4byte	.LASF27
	.byte	0x2
	.byte	0x5e
	.4byte	0x4f
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0x2
	.byte	0x5f
	.4byte	0x56
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x2
	.byte	0x60
	.4byte	0x56
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0x2
	.byte	0x61
	.4byte	0x56
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x2
	.byte	0x62
	.4byte	0x72
	.byte	0x20
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0x2
	.byte	0x63
	.4byte	0x4f
	.byte	0x24
	.uleb128 0x7
	.4byte	.LASF33
	.byte	0x2
	.byte	0x64
	.4byte	0x4f
	.byte	0x28
	.byte	0
	.uleb128 0x9
	.byte	0x30
	.byte	0x2
	.byte	0x59
	.4byte	0x1f6
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x2
	.byte	0x65
	.4byte	0x163
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x2
	.byte	0x66
	.4byte	0x1f6
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x2
	.byte	0x67
	.4byte	0x3a
	.byte	0
	.uleb128 0xc
	.4byte	0x74
	.4byte	0x206
	.uleb128 0xd
	.4byte	0x6b
	.byte	0x2f
	.byte	0
	.uleb128 0x5
	.4byte	.LASF34
	.byte	0x2
	.byte	0x68
	.4byte	0x1cc
	.uleb128 0xf
	.4byte	0x33
	.uleb128 0x10
	.4byte	.LASF35
	.byte	0x1
	.byte	0x34
	.4byte	0x72
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x258
	.uleb128 0x11
	.4byte	.LASF37
	.byte	0x1
	.byte	0x34
	.4byte	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.ascii	"i\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.ascii	"pid\000"
	.byte	0x1
	.byte	0x37
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x1
	.byte	0x43
	.4byte	0x72
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28e
	.uleb128 0x11
	.4byte	.LASF37
	.byte	0x1
	.byte	0x43
	.4byte	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF38
	.byte	0x1
	.byte	0x45
	.4byte	0x28e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF39
	.uleb128 0x10
	.4byte	.LASF40
	.byte	0x1
	.byte	0x52
	.4byte	0x72
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2bd
	.uleb128 0x11
	.4byte	.LASF37
	.byte	0x1
	.byte	0x52
	.4byte	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF41
	.byte	0x1
	.byte	0x1d
	.4byte	0x206
	.uleb128 0x5
	.byte	0x3
	.4byte	s_cond
	.uleb128 0x13
	.4byte	.LASF42
	.byte	0x1
	.byte	0x1e
	.4byte	0x206
	.uleb128 0x5
	.byte	0x3
	.4byte	d_cond
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x1
	.byte	0x1f
	.4byte	0x158
	.uleb128 0x5
	.byte	0x3
	.4byte	s_lock
	.uleb128 0x13
	.4byte	.LASF44
	.byte	0x1
	.byte	0x20
	.4byte	0x158
	.uleb128 0x5
	.byte	0x3
	.4byte	d_lock
	.uleb128 0x13
	.4byte	.LASF45
	.byte	0x1
	.byte	0x22
	.4byte	0x33
	.uleb128 0x5
	.byte	0x3
	.4byte	g_cnt
	.uleb128 0x13
	.4byte	.LASF46
	.byte	0x1
	.byte	0x23
	.4byte	0x211
	.uleb128 0x5
	.byte	0x3
	.4byte	vg_cnt
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x5
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
	.uleb128 0x12
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
	.uleb128 0x13
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
.LASF36:
	.ascii	"sig_send_thread\000"
.LASF34:
	.ascii	"pthread_cond_t\000"
.LASF8:
	.ascii	"long int\000"
.LASF37:
	.ascii	"data\000"
.LASF38:
	.ascii	"once\000"
.LASF28:
	.ascii	"__total_seq\000"
.LASF16:
	.ascii	"__pthread_mutex_s\000"
.LASF29:
	.ascii	"__wakeup_seq\000"
.LASF18:
	.ascii	"__lock\000"
.LASF21:
	.ascii	"__kind\000"
.LASF35:
	.ascii	"detached_thread\000"
.LASF26:
	.ascii	"pthread_mutex_t\000"
.LASF15:
	.ascii	"__pthread_internal_slist\000"
.LASF33:
	.ascii	"__broadcast_seq\000"
.LASF11:
	.ascii	"pthread_t\000"
.LASF48:
	.ascii	"pthread.c\000"
.LASF24:
	.ascii	"__size\000"
.LASF49:
	.ascii	"/media/iamjy1005/97b53b95-bba5-4bcc-ab12-5539c6a738"
	.ascii	"ef/work/lab/practice/system-library/src/thread/src\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF4:
	.ascii	"short unsigned int\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF31:
	.ascii	"__mutex\000"
.LASF45:
	.ascii	"g_cnt\000"
.LASF43:
	.ascii	"s_lock\000"
.LASF14:
	.ascii	"__list\000"
.LASF5:
	.ascii	"unsigned int\000"
.LASF42:
	.ascii	"d_cond\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF13:
	.ascii	"__spins\000"
.LASF30:
	.ascii	"__woken_seq\000"
.LASF20:
	.ascii	"__owner\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF2:
	.ascii	"long long int\000"
.LASF27:
	.ascii	"__futex\000"
.LASF32:
	.ascii	"__nwaiters\000"
.LASF12:
	.ascii	"__pthread_slist_t\000"
.LASF25:
	.ascii	"__align\000"
.LASF22:
	.ascii	"__nusers\000"
.LASF19:
	.ascii	"__count\000"
.LASF1:
	.ascii	"short int\000"
.LASF44:
	.ascii	"d_lock\000"
.LASF47:
	.ascii	"GNU C 4.9.4 -march=armv7-a -mtune=cortex-a9 -mfloat"
	.ascii	"-abi=hard -mfpu=vfpv3-d16 -mthumb -mtls-dialect=gnu"
	.ascii	" -g\000"
.LASF10:
	.ascii	"char\000"
.LASF17:
	.ascii	"__next\000"
.LASF0:
	.ascii	"signed char\000"
.LASF23:
	.ascii	"__data\000"
.LASF39:
	.ascii	"_Bool\000"
.LASF41:
	.ascii	"s_cond\000"
.LASF46:
	.ascii	"vg_cnt\000"
.LASF40:
	.ascii	"sig_receive_thread\000"
	.ident	"GCC: (Linaro GCC 4.9-2017.01) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
