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
	.file	"astall.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.local	mutex
	.comm	mutex,24,4
	.local	i
	.comm	i,4,4
	.align	2
	.global	astall_func
	.thumb
	.thumb_func
	.type	astall_func, %function
astall_func:
.LFB2:
	.file 1 "astall.c"
	.loc 1 48 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 49 0
	movw	r0, #:lower16:mutex
	movt	r0, #:upper16:mutex
	bl	pthread_mutex_lock
	.loc 1 50 0
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	movs	r2, #0
	str	r2, [r3]
	.loc 1 51 0
	movw	r0, #:lower16:mutex
	movt	r0, #:upper16:mutex
	bl	pthread_mutex_unlock
	.loc 1 52 0
	pop	{r7, pc}
	.cfi_endproc
.LFE2:
	.size	astall_func, .-astall_func
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\012\000"
	.text
	.align	2
	.global	astall_thread
	.thumb
	.thumb_func
	.type	astall_thread, %function
astall_thread:
.LFB3:
	.loc 1 55 0
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
.L5:
	.loc 1 57 0
	movw	r0, #:lower16:mutex
	movt	r0, #:upper16:mutex
	bl	pthread_mutex_lock
	.loc 1 59 0
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	cmp	r3, #2
	ble	.L3
	.loc 1 60 0
	bl	astall_func
	b	.L4
.L3:
	.loc 1 62 0
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	adds	r2, r3, #1
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	str	r2, [r3]
.L4:
	.loc 1 64 0
	movw	r0, #:lower16:mutex
	movt	r0, #:upper16:mutex
	bl	pthread_mutex_unlock
	.loc 1 66 0
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	mov	r1, r3
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	.loc 1 67 0
	movs	r0, #1
	bl	sleep
	.loc 1 68 0
	b	.L5
	.cfi_endproc
.LFE3:
	.size	astall_thread, .-astall_thread
.Letext0:
	.file 2 "/media/iamjy1005/978ada6f-9596-4951-b412-6e8a78f4241d/backup/root/opt/toolchain/arm/linux/linaro/latest-4/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/include/stdint.h"
	.file 3 "/media/iamjy1005/978ada6f-9596-4951-b412-6e8a78f4241d/backup/root/opt/toolchain/arm/linux/linaro/latest-4/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/include/bits/pthreadtypes.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1b9
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x1
	.4byte	.LASF29
	.4byte	.LASF30
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
	.4byte	.LASF11
	.byte	0x2
	.byte	0x26
	.4byte	0x3e
	.uleb128 0x4
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
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x4
	.byte	0x3
	.byte	0x33
	.4byte	0x9f
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x3
	.byte	0x35
	.4byte	0x9f
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x86
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x36
	.4byte	0x86
	.uleb128 0x9
	.byte	0x4
	.byte	0x3
	.byte	0x46
	.4byte	0xcf
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x3
	.byte	0x48
	.4byte	0x3e
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x3
	.byte	0x49
	.4byte	0xa5
	.byte	0
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x18
	.byte	0x3
	.byte	0x3d
	.4byte	0x11e
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x3
	.byte	0x3f
	.4byte	0x3e
	.byte	0
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x3
	.byte	0x40
	.4byte	0x5a
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x3
	.byte	0x41
	.4byte	0x3e
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x3
	.byte	0x44
	.4byte	0x3e
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x3
	.byte	0x45
	.4byte	0x5a
	.byte	0x10
	.uleb128 0xb
	.4byte	0xb0
	.byte	0x14
	.byte	0
	.uleb128 0x9
	.byte	0x18
	.byte	0x3
	.byte	0x3b
	.4byte	0x148
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x3
	.byte	0x4b
	.4byte	0xcf
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x3
	.byte	0x4c
	.4byte	0x148
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x3
	.byte	0x4d
	.4byte	0x6f
	.byte	0
	.uleb128 0xc
	.4byte	0x7f
	.4byte	0x158
	.uleb128 0xd
	.4byte	0x76
	.byte	0x17
	.byte	0
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x3
	.byte	0x4e
	.4byte	0x11e
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x1
	.byte	0x2f
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF32
	.byte	0x1
	.byte	0x36
	.4byte	0x7d
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19c
	.uleb128 0x10
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF27
	.byte	0x1
	.byte	0x21
	.4byte	0x158
	.uleb128 0x5
	.byte	0x3
	.4byte	mutex
	.uleb128 0x12
	.ascii	"i\000"
	.byte	0x1
	.byte	0x22
	.4byte	0x33
	.uleb128 0x5
	.byte	0x3
	.4byte	i
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x5
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
	.uleb128 0x11
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
.LASF25:
	.ascii	"__align\000"
.LASF23:
	.ascii	"__data\000"
.LASF32:
	.ascii	"astall_thread\000"
.LASF8:
	.ascii	"long int\000"
.LASF16:
	.ascii	"__pthread_mutex_s\000"
.LASF20:
	.ascii	"__owner\000"
.LASF18:
	.ascii	"__lock\000"
.LASF21:
	.ascii	"__kind\000"
.LASF26:
	.ascii	"pthread_mutex_t\000"
.LASF15:
	.ascii	"__pthread_internal_slist\000"
.LASF24:
	.ascii	"__size\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF30:
	.ascii	"/media/iamjy1005/97b53b95-bba5-4bcc-ab12-5539c6a738"
	.ascii	"ef/work/lab/practice/system-library/src/thread/src\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF4:
	.ascii	"short unsigned int\000"
.LASF5:
	.ascii	"unsigned int\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF13:
	.ascii	"__spins\000"
.LASF11:
	.ascii	"int32_t\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF2:
	.ascii	"long long int\000"
.LASF10:
	.ascii	"char\000"
.LASF12:
	.ascii	"__pthread_slist_t\000"
.LASF27:
	.ascii	"mutex\000"
.LASF22:
	.ascii	"__nusers\000"
.LASF19:
	.ascii	"__count\000"
.LASF1:
	.ascii	"short int\000"
.LASF28:
	.ascii	"GNU C 4.9.4 -march=armv7-a -mtune=cortex-a9 -mfloat"
	.ascii	"-abi=hard -mfpu=vfpv3-d16 -mthumb -mtls-dialect=gnu"
	.ascii	" -g\000"
.LASF14:
	.ascii	"__list\000"
.LASF31:
	.ascii	"astall_func\000"
.LASF17:
	.ascii	"__next\000"
.LASF0:
	.ascii	"signed char\000"
.LASF29:
	.ascii	"astall.c\000"
	.ident	"GCC: (Linaro GCC 4.9-2017.01) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
