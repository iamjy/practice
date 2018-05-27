	.file	"main.cpp"
	.text
.Ltext0:
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.text._ZN4BookC2EPKcii,"axG",@progbits,_ZN4BookC5EPKcii,comdat
	.align 2
	.weak	_ZN4BookC2EPKcii
	.type	_ZN4BookC2EPKcii, @function
_ZN4BookC2EPKcii:
.LFB1022:
	.file 1 "main.cpp"
	.loc 1 35 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	%ecx, -24(%rbp)
.LBB2:
	.loc 1 36 0
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	movl	-24(%rbp), %edx
	movl	%edx, 36(%rax)
.LBE2:
	.loc 1 38 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1022:
	.size	_ZN4BookC2EPKcii, .-_ZN4BookC2EPKcii
	.weak	_ZN4BookC1EPKcii
	.set	_ZN4BookC1EPKcii,_ZN4BookC2EPKcii
	.section	.text._ZN4Book5inputEv,"axG",@progbits,_ZN4Book5inputEv,comdat
	.align 2
	.weak	_ZN4Book5inputEv
	.type	_ZN4Book5inputEv, @function
_ZN4Book5inputEv:
.LFB1024:
	.loc 1 40 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 42 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1024:
	.size	_ZN4Book5inputEv, .-_ZN4Book5inputEv
	.section	.text._ZN4Book6outputEv,"axG",@progbits,_ZN4Book6outputEv,comdat
	.align 2
	.weak	_ZN4Book6outputEv
	.type	_ZN4Book6outputEv, @function
_ZN4Book6outputEv:
.LFB1025:
	.loc 1 44 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 46 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1025:
	.size	_ZN4Book6outputEv, .-_ZN4Book6outputEv
	.section	.rodata
.LC0:
	.string	"abc"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1026:
	.loc 1 69 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	.loc 1 69 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 70 0
	leaq	-48(%rbp), %rax
	movl	$2, %ecx
	movl	$1, %edx
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	_ZN4BookC1EPKcii
	.loc 1 71 0
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN4Book6outputEv
	.loc 1 73 0
	movq	$_ZN4Book5inputEv, -64(%rbp)
	movq	$0, -56(%rbp)
	.loc 1 75 0
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	-48(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, %rdi
	call	*%rax
	.loc 1 76 0
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN4Book6outputEv
	.loc 1 78 0
	movl	$0, %eax
	.loc 1 79 0
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L6
	call	__stack_chk_fail
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1026:
	.size	main, .-main
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB1027:
	.loc 1 79 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	.loc 1 79 0
	cmpl	$1, -4(%rbp)
	jne	.L9
	.loc 1 79 0 is_stmt 0 discriminator 1
	cmpl	$65535, -8(%rbp)
	jne	.L9
	.file 2 "/usr/include/c++/5/iostream"
	.loc 2 74 0 is_stmt 1
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	call	__cxa_atexit
.L9:
	.loc 1 79 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1027:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB1028:
	.loc 1 79 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 79 0
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1028:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.text
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/wchar.h"
	.file 8 "<built-in>"
	.file 9 "/usr/include/c++/5/cwchar"
	.file 10 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++config.h"
	.file 11 "/usr/include/c++/5/debug/debug.h"
	.file 12 "/usr/include/c++/5/clocale"
	.file 13 "/usr/include/c++/5/bits/ios_base.h"
	.file 14 "/usr/include/c++/5/cwctype"
	.file 15 "/usr/include/c++/5/bits/predefined_ops.h"
	.file 16 "/usr/include/c++/5/ext/new_allocator.h"
	.file 17 "/usr/include/c++/5/ext/numeric_traits.h"
	.file 18 "/usr/include/time.h"
	.file 19 "/usr/include/locale.h"
	.file 20 "/usr/include/x86_64-linux-gnu/c++/5/bits/atomic_word.h"
	.file 21 "/usr/include/wctype.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1792
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF293
	.byte	0x4
	.long	.LASF294
	.long	.LASF295
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF7
	.byte	0x3
	.byte	0xd8
	.long	0x5a
	.uleb128 0x4
	.long	.LASF8
	.byte	0x4
	.byte	0x28
	.long	0x37
	.uleb128 0x4
	.long	.LASF9
	.byte	0x4
	.byte	0x83
	.long	0x3e
	.uleb128 0x4
	.long	.LASF10
	.byte	0x4
	.byte	0x84
	.long	0x3e
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x7
	.long	.LASF48
	.byte	0xd8
	.byte	0x5
	.byte	0xf1
	.long	0x220
	.uleb128 0x8
	.long	.LASF13
	.byte	0x5
	.byte	0xf2
	.long	0x37
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x5
	.byte	0xf7
	.long	0x96
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x5
	.byte	0xf8
	.long	0x96
	.byte	0x10
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.byte	0xf9
	.long	0x96
	.byte	0x18
	.uleb128 0x8
	.long	.LASF17
	.byte	0x5
	.byte	0xfa
	.long	0x96
	.byte	0x20
	.uleb128 0x8
	.long	.LASF18
	.byte	0x5
	.byte	0xfb
	.long	0x96
	.byte	0x28
	.uleb128 0x8
	.long	.LASF19
	.byte	0x5
	.byte	0xfc
	.long	0x96
	.byte	0x30
	.uleb128 0x8
	.long	.LASF20
	.byte	0x5
	.byte	0xfd
	.long	0x96
	.byte	0x38
	.uleb128 0x8
	.long	.LASF21
	.byte	0x5
	.byte	0xfe
	.long	0x96
	.byte	0x40
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.value	0x100
	.long	0x96
	.byte	0x48
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.value	0x101
	.long	0x96
	.byte	0x50
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.value	0x102
	.long	0x96
	.byte	0x58
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.value	0x104
	.long	0x2ff
	.byte	0x60
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.value	0x106
	.long	0x305
	.byte	0x68
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.value	0x108
	.long	0x37
	.byte	0x70
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x10c
	.long	0x37
	.byte	0x74
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.value	0x10e
	.long	0x77
	.byte	0x78
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.value	0x112
	.long	0x4c
	.byte	0x80
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.value	0x113
	.long	0x29
	.byte	0x82
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.value	0x114
	.long	0x30b
	.byte	0x83
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.value	0x118
	.long	0x31b
	.byte	0x88
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.value	0x121
	.long	0x82
	.byte	0x90
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.value	0x129
	.long	0x94
	.byte	0x98
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.value	0x12a
	.long	0x94
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.value	0x12b
	.long	0x94
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.value	0x12c
	.long	0x94
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.value	0x12e
	.long	0x61
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.value	0x12f
	.long	0x37
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x5
	.value	0x131
	.long	0x321
	.byte	0xc4
	.byte	0
	.uleb128 0x4
	.long	.LASF42
	.byte	0x6
	.byte	0x40
	.long	0xa3
	.uleb128 0xa
	.byte	0x8
	.byte	0x7
	.byte	0x53
	.long	.LASF296
	.long	0x26f
	.uleb128 0xb
	.byte	0x4
	.byte	0x7
	.byte	0x56
	.long	0x256
	.uleb128 0xc
	.long	.LASF43
	.byte	0x7
	.byte	0x58
	.long	0x53
	.uleb128 0xc
	.long	.LASF44
	.byte	0x7
	.byte	0x5c
	.long	0x26f
	.byte	0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x7
	.byte	0x54
	.long	0x37
	.byte	0
	.uleb128 0x8
	.long	.LASF46
	.byte	0x7
	.byte	0x5d
	.long	0x237
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.long	0x9c
	.long	0x27f
	.uleb128 0xe
	.long	0x8d
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF47
	.byte	0x7
	.byte	0x5e
	.long	0x22b
	.uleb128 0x7
	.long	.LASF49
	.byte	0x18
	.byte	0x8
	.byte	0
	.long	0x2c7
	.uleb128 0x8
	.long	.LASF50
	.byte	0x8
	.byte	0
	.long	0x53
	.byte	0
	.uleb128 0x8
	.long	.LASF51
	.byte	0x8
	.byte	0
	.long	0x53
	.byte	0x4
	.uleb128 0x8
	.long	.LASF52
	.byte	0x8
	.byte	0
	.long	0x94
	.byte	0x8
	.uleb128 0x8
	.long	.LASF53
	.byte	0x8
	.byte	0
	.long	0x94
	.byte	0x10
	.byte	0
	.uleb128 0xf
	.long	.LASF297
	.byte	0x5
	.byte	0x96
	.uleb128 0x7
	.long	.LASF54
	.byte	0x18
	.byte	0x5
	.byte	0x9c
	.long	0x2ff
	.uleb128 0x8
	.long	.LASF55
	.byte	0x5
	.byte	0x9d
	.long	0x2ff
	.byte	0
	.uleb128 0x8
	.long	.LASF56
	.byte	0x5
	.byte	0x9e
	.long	0x305
	.byte	0x8
	.uleb128 0x8
	.long	.LASF57
	.byte	0x5
	.byte	0xa2
	.long	0x37
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2ce
	.uleb128 0x6
	.byte	0x8
	.long	0xa3
	.uleb128 0xd
	.long	0x9c
	.long	0x31b
	.uleb128 0xe
	.long	0x8d
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2c7
	.uleb128 0xd
	.long	0x9c
	.long	0x331
	.uleb128 0xe
	.long	0x8d
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x337
	.uleb128 0x10
	.long	0x9c
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF58
	.uleb128 0x10
	.long	0x37
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF59
	.uleb128 0xd
	.long	0x9c
	.long	0x35f
	.uleb128 0xe
	.long	0x8d
	.byte	0x1f
	.byte	0
	.uleb128 0x11
	.string	"std"
	.byte	0x8
	.byte	0
	.long	0x961
	.uleb128 0x12
	.long	.LASF60
	.byte	0xa
	.byte	0xda
	.uleb128 0x13
	.byte	0xa
	.byte	0xda
	.long	0x36a
	.uleb128 0x14
	.byte	0x9
	.byte	0x40
	.long	0xaf9
	.uleb128 0x14
	.byte	0x9
	.byte	0x8b
	.long	0xaed
	.uleb128 0x14
	.byte	0x9
	.byte	0x8d
	.long	0xb04
	.uleb128 0x14
	.byte	0x9
	.byte	0x8e
	.long	0xb1a
	.uleb128 0x14
	.byte	0x9
	.byte	0x8f
	.long	0xb36
	.uleb128 0x14
	.byte	0x9
	.byte	0x90
	.long	0xb63
	.uleb128 0x14
	.byte	0x9
	.byte	0x91
	.long	0xb7e
	.uleb128 0x14
	.byte	0x9
	.byte	0x92
	.long	0xba4
	.uleb128 0x14
	.byte	0x9
	.byte	0x93
	.long	0xbbf
	.uleb128 0x14
	.byte	0x9
	.byte	0x94
	.long	0xbdb
	.uleb128 0x14
	.byte	0x9
	.byte	0x95
	.long	0xbf7
	.uleb128 0x14
	.byte	0x9
	.byte	0x96
	.long	0xc0d
	.uleb128 0x14
	.byte	0x9
	.byte	0x97
	.long	0xc19
	.uleb128 0x14
	.byte	0x9
	.byte	0x98
	.long	0xc3f
	.uleb128 0x14
	.byte	0x9
	.byte	0x99
	.long	0xc64
	.uleb128 0x14
	.byte	0x9
	.byte	0x9a
	.long	0xc85
	.uleb128 0x14
	.byte	0x9
	.byte	0x9b
	.long	0xcb0
	.uleb128 0x14
	.byte	0x9
	.byte	0x9c
	.long	0xccb
	.uleb128 0x14
	.byte	0x9
	.byte	0x9e
	.long	0xce1
	.uleb128 0x14
	.byte	0x9
	.byte	0xa0
	.long	0xd02
	.uleb128 0x14
	.byte	0x9
	.byte	0xa1
	.long	0xd1e
	.uleb128 0x14
	.byte	0x9
	.byte	0xa2
	.long	0xd39
	.uleb128 0x14
	.byte	0x9
	.byte	0xa4
	.long	0xd5f
	.uleb128 0x14
	.byte	0x9
	.byte	0xa7
	.long	0xd7f
	.uleb128 0x14
	.byte	0x9
	.byte	0xaa
	.long	0xda4
	.uleb128 0x14
	.byte	0x9
	.byte	0xac
	.long	0xdc4
	.uleb128 0x14
	.byte	0x9
	.byte	0xae
	.long	0xddf
	.uleb128 0x14
	.byte	0x9
	.byte	0xb0
	.long	0xdfa
	.uleb128 0x14
	.byte	0x9
	.byte	0xb1
	.long	0xe1a
	.uleb128 0x14
	.byte	0x9
	.byte	0xb2
	.long	0xe34
	.uleb128 0x14
	.byte	0x9
	.byte	0xb3
	.long	0xe4e
	.uleb128 0x14
	.byte	0x9
	.byte	0xb4
	.long	0xe68
	.uleb128 0x14
	.byte	0x9
	.byte	0xb5
	.long	0xe82
	.uleb128 0x14
	.byte	0x9
	.byte	0xb6
	.long	0xe9c
	.uleb128 0x14
	.byte	0x9
	.byte	0xb7
	.long	0xf5c
	.uleb128 0x14
	.byte	0x9
	.byte	0xb8
	.long	0xf72
	.uleb128 0x14
	.byte	0x9
	.byte	0xb9
	.long	0xf91
	.uleb128 0x14
	.byte	0x9
	.byte	0xba
	.long	0xfb0
	.uleb128 0x14
	.byte	0x9
	.byte	0xbb
	.long	0xfcf
	.uleb128 0x14
	.byte	0x9
	.byte	0xbc
	.long	0xffa
	.uleb128 0x14
	.byte	0x9
	.byte	0xbd
	.long	0x1015
	.uleb128 0x14
	.byte	0x9
	.byte	0xbf
	.long	0x103d
	.uleb128 0x14
	.byte	0x9
	.byte	0xc1
	.long	0x105f
	.uleb128 0x14
	.byte	0x9
	.byte	0xc2
	.long	0x107f
	.uleb128 0x14
	.byte	0x9
	.byte	0xc3
	.long	0x109f
	.uleb128 0x14
	.byte	0x9
	.byte	0xc4
	.long	0x10bf
	.uleb128 0x14
	.byte	0x9
	.byte	0xc5
	.long	0x10de
	.uleb128 0x14
	.byte	0x9
	.byte	0xc6
	.long	0x10f4
	.uleb128 0x14
	.byte	0x9
	.byte	0xc7
	.long	0x1114
	.uleb128 0x14
	.byte	0x9
	.byte	0xc8
	.long	0x1134
	.uleb128 0x14
	.byte	0x9
	.byte	0xc9
	.long	0x1154
	.uleb128 0x14
	.byte	0x9
	.byte	0xca
	.long	0x1174
	.uleb128 0x14
	.byte	0x9
	.byte	0xcb
	.long	0x118b
	.uleb128 0x14
	.byte	0x9
	.byte	0xcc
	.long	0x11a2
	.uleb128 0x14
	.byte	0x9
	.byte	0xcd
	.long	0x11c0
	.uleb128 0x14
	.byte	0x9
	.byte	0xce
	.long	0x11df
	.uleb128 0x14
	.byte	0x9
	.byte	0xcf
	.long	0x11fd
	.uleb128 0x14
	.byte	0x9
	.byte	0xd0
	.long	0x121c
	.uleb128 0x15
	.byte	0x9
	.value	0x108
	.long	0x1240
	.uleb128 0x15
	.byte	0x9
	.value	0x109
	.long	0x1262
	.uleb128 0x15
	.byte	0x9
	.value	0x10a
	.long	0x1282
	.uleb128 0x12
	.long	.LASF61
	.byte	0xb
	.byte	0x30
	.uleb128 0x4
	.long	.LASF7
	.byte	0xa
	.byte	0xc4
	.long	0x5a
	.uleb128 0x14
	.byte	0xc
	.byte	0x35
	.long	0x12bc
	.uleb128 0x14
	.byte	0xc
	.byte	0x36
	.long	0x13e9
	.uleb128 0x14
	.byte	0xc
	.byte	0x37
	.long	0x1403
	.uleb128 0x4
	.long	.LASF62
	.byte	0xa
	.byte	0xc5
	.long	0x3e
	.uleb128 0x16
	.long	.LASF84
	.byte	0x4
	.long	0x37
	.byte	0xd
	.byte	0x39
	.long	0x5f9
	.uleb128 0x17
	.long	.LASF63
	.byte	0x1
	.uleb128 0x17
	.long	.LASF64
	.byte	0x2
	.uleb128 0x17
	.long	.LASF65
	.byte	0x4
	.uleb128 0x17
	.long	.LASF66
	.byte	0x8
	.uleb128 0x17
	.long	.LASF67
	.byte	0x10
	.uleb128 0x17
	.long	.LASF68
	.byte	0x20
	.uleb128 0x17
	.long	.LASF69
	.byte	0x40
	.uleb128 0x17
	.long	.LASF70
	.byte	0x80
	.uleb128 0x18
	.long	.LASF71
	.value	0x100
	.uleb128 0x18
	.long	.LASF72
	.value	0x200
	.uleb128 0x18
	.long	.LASF73
	.value	0x400
	.uleb128 0x18
	.long	.LASF74
	.value	0x800
	.uleb128 0x18
	.long	.LASF75
	.value	0x1000
	.uleb128 0x18
	.long	.LASF76
	.value	0x2000
	.uleb128 0x18
	.long	.LASF77
	.value	0x4000
	.uleb128 0x17
	.long	.LASF78
	.byte	0xb0
	.uleb128 0x17
	.long	.LASF79
	.byte	0x4a
	.uleb128 0x18
	.long	.LASF80
	.value	0x104
	.uleb128 0x19
	.long	.LASF81
	.long	0x10000
	.uleb128 0x19
	.long	.LASF82
	.long	0x7fffffff
	.uleb128 0x1a
	.long	.LASF83
	.sleb128 -2147483648
	.byte	0
	.uleb128 0x16
	.long	.LASF85
	.byte	0x4
	.long	0x37
	.byte	0xd
	.byte	0x6f
	.long	0x64a
	.uleb128 0x17
	.long	.LASF86
	.byte	0x1
	.uleb128 0x17
	.long	.LASF87
	.byte	0x2
	.uleb128 0x17
	.long	.LASF88
	.byte	0x4
	.uleb128 0x17
	.long	.LASF89
	.byte	0x8
	.uleb128 0x17
	.long	.LASF90
	.byte	0x10
	.uleb128 0x17
	.long	.LASF91
	.byte	0x20
	.uleb128 0x19
	.long	.LASF92
	.long	0x10000
	.uleb128 0x19
	.long	.LASF93
	.long	0x7fffffff
	.uleb128 0x1a
	.long	.LASF94
	.sleb128 -2147483648
	.byte	0
	.uleb128 0x16
	.long	.LASF95
	.byte	0x4
	.long	0x37
	.byte	0xd
	.byte	0x99
	.long	0x68f
	.uleb128 0x17
	.long	.LASF96
	.byte	0
	.uleb128 0x17
	.long	.LASF97
	.byte	0x1
	.uleb128 0x17
	.long	.LASF98
	.byte	0x2
	.uleb128 0x17
	.long	.LASF99
	.byte	0x4
	.uleb128 0x19
	.long	.LASF100
	.long	0x10000
	.uleb128 0x19
	.long	.LASF101
	.long	0x7fffffff
	.uleb128 0x1a
	.long	.LASF102
	.sleb128 -2147483648
	.byte	0
	.uleb128 0x16
	.long	.LASF103
	.byte	0x4
	.long	0x53
	.byte	0xd
	.byte	0xc1
	.long	0x6bb
	.uleb128 0x17
	.long	.LASF104
	.byte	0
	.uleb128 0x17
	.long	.LASF105
	.byte	0x1
	.uleb128 0x17
	.long	.LASF106
	.byte	0x2
	.uleb128 0x19
	.long	.LASF107
	.long	0x10000
	.byte	0
	.uleb128 0x1b
	.long	.LASF298
	.long	0x924
	.uleb128 0x1c
	.long	.LASF263
	.byte	0x1
	.byte	0xd
	.value	0x259
	.byte	0x1
	.long	0x722
	.uleb128 0x1d
	.long	.LASF108
	.byte	0xd
	.value	0x261
	.long	0x1414
	.uleb128 0x1d
	.long	.LASF109
	.byte	0xd
	.value	0x262
	.long	0x12b5
	.uleb128 0x1e
	.long	.LASF263
	.byte	0xd
	.value	0x25d
	.long	.LASF299
	.byte	0x1
	.long	0x6ff
	.long	0x705
	.uleb128 0x1f
	.long	0x1429
	.byte	0
	.uleb128 0x20
	.long	.LASF212
	.byte	0xd
	.value	0x25e
	.long	.LASF215
	.byte	0x1
	.long	0x716
	.uleb128 0x1f
	.long	0x1429
	.uleb128 0x1f
	.long	0x37
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.LASF125
	.byte	0xd
	.value	0x143
	.long	0x558
	.byte	0x1
	.uleb128 0x22
	.long	.LASF110
	.byte	0xd
	.value	0x146
	.long	0x73d
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.long	0x722
	.uleb128 0x23
	.string	"dec"
	.byte	0xd
	.value	0x149
	.long	0x73d
	.byte	0x1
	.byte	0x2
	.uleb128 0x22
	.long	.LASF111
	.byte	0xd
	.value	0x14c
	.long	0x73d
	.byte	0x1
	.byte	0x4
	.uleb128 0x23
	.string	"hex"
	.byte	0xd
	.value	0x14f
	.long	0x73d
	.byte	0x1
	.byte	0x8
	.uleb128 0x22
	.long	.LASF112
	.byte	0xd
	.value	0x154
	.long	0x73d
	.byte	0x1
	.byte	0x10
	.uleb128 0x22
	.long	.LASF113
	.byte	0xd
	.value	0x158
	.long	0x73d
	.byte	0x1
	.byte	0x20
	.uleb128 0x23
	.string	"oct"
	.byte	0xd
	.value	0x15b
	.long	0x73d
	.byte	0x1
	.byte	0x40
	.uleb128 0x22
	.long	.LASF114
	.byte	0xd
	.value	0x15f
	.long	0x73d
	.byte	0x1
	.byte	0x80
	.uleb128 0x24
	.long	.LASF115
	.byte	0xd
	.value	0x162
	.long	0x73d
	.byte	0x1
	.value	0x100
	.uleb128 0x24
	.long	.LASF116
	.byte	0xd
	.value	0x166
	.long	0x73d
	.byte	0x1
	.value	0x200
	.uleb128 0x24
	.long	.LASF117
	.byte	0xd
	.value	0x16a
	.long	0x73d
	.byte	0x1
	.value	0x400
	.uleb128 0x24
	.long	.LASF118
	.byte	0xd
	.value	0x16d
	.long	0x73d
	.byte	0x1
	.value	0x800
	.uleb128 0x24
	.long	.LASF119
	.byte	0xd
	.value	0x170
	.long	0x73d
	.byte	0x1
	.value	0x1000
	.uleb128 0x24
	.long	.LASF120
	.byte	0xd
	.value	0x173
	.long	0x73d
	.byte	0x1
	.value	0x2000
	.uleb128 0x24
	.long	.LASF121
	.byte	0xd
	.value	0x177
	.long	0x73d
	.byte	0x1
	.value	0x4000
	.uleb128 0x22
	.long	.LASF122
	.byte	0xd
	.value	0x17a
	.long	0x73d
	.byte	0x1
	.byte	0xb0
	.uleb128 0x22
	.long	.LASF123
	.byte	0xd
	.value	0x17d
	.long	0x73d
	.byte	0x1
	.byte	0x4a
	.uleb128 0x24
	.long	.LASF124
	.byte	0xd
	.value	0x180
	.long	0x73d
	.byte	0x1
	.value	0x104
	.uleb128 0x21
	.long	.LASF126
	.byte	0xd
	.value	0x18e
	.long	0x64a
	.byte	0x1
	.uleb128 0x22
	.long	.LASF127
	.byte	0xd
	.value	0x192
	.long	0x853
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.long	0x838
	.uleb128 0x22
	.long	.LASF128
	.byte	0xd
	.value	0x195
	.long	0x853
	.byte	0x1
	.byte	0x2
	.uleb128 0x22
	.long	.LASF129
	.byte	0xd
	.value	0x19a
	.long	0x853
	.byte	0x1
	.byte	0x4
	.uleb128 0x22
	.long	.LASF130
	.byte	0xd
	.value	0x19d
	.long	0x853
	.byte	0x1
	.byte	0
	.uleb128 0x21
	.long	.LASF131
	.byte	0xd
	.value	0x1ad
	.long	0x5f9
	.byte	0x1
	.uleb128 0x23
	.string	"app"
	.byte	0xd
	.value	0x1b0
	.long	0x89d
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.long	0x882
	.uleb128 0x23
	.string	"ate"
	.byte	0xd
	.value	0x1b3
	.long	0x89d
	.byte	0x1
	.byte	0x2
	.uleb128 0x22
	.long	.LASF132
	.byte	0xd
	.value	0x1b8
	.long	0x89d
	.byte	0x1
	.byte	0x4
	.uleb128 0x23
	.string	"in"
	.byte	0xd
	.value	0x1bb
	.long	0x89d
	.byte	0x1
	.byte	0x8
	.uleb128 0x23
	.string	"out"
	.byte	0xd
	.value	0x1be
	.long	0x89d
	.byte	0x1
	.byte	0x10
	.uleb128 0x22
	.long	.LASF133
	.byte	0xd
	.value	0x1c1
	.long	0x89d
	.byte	0x1
	.byte	0x20
	.uleb128 0x21
	.long	.LASF134
	.byte	0xd
	.value	0x1cd
	.long	0x68f
	.byte	0x1
	.uleb128 0x23
	.string	"beg"
	.byte	0xd
	.value	0x1d0
	.long	0x902
	.byte	0x1
	.byte	0
	.uleb128 0x10
	.long	0x8e7
	.uleb128 0x23
	.string	"cur"
	.byte	0xd
	.value	0x1d3
	.long	0x902
	.byte	0x1
	.byte	0x1
	.uleb128 0x23
	.string	"end"
	.byte	0xd
	.value	0x1d6
	.long	0x902
	.byte	0x1
	.byte	0x2
	.byte	0
	.uleb128 0x14
	.byte	0xe
	.byte	0x52
	.long	0x143a
	.uleb128 0x14
	.byte	0xe
	.byte	0x53
	.long	0x142f
	.uleb128 0x14
	.byte	0xe
	.byte	0x54
	.long	0xaed
	.uleb128 0x14
	.byte	0xe
	.byte	0x5c
	.long	0x1450
	.uleb128 0x14
	.byte	0xe
	.byte	0x65
	.long	0x146a
	.uleb128 0x14
	.byte	0xe
	.byte	0x68
	.long	0x1484
	.uleb128 0x14
	.byte	0xe
	.byte	0x69
	.long	0x1499
	.uleb128 0x25
	.long	.LASF277
	.byte	0x2
	.byte	0x4a
	.long	0x6c4
	.byte	0
	.uleb128 0x26
	.long	.LASF135
	.byte	0xa
	.byte	0xdd
	.long	0xaed
	.uleb128 0x12
	.long	.LASF60
	.byte	0xa
	.byte	0xde
	.uleb128 0x13
	.byte	0xa
	.byte	0xde
	.long	0x96c
	.uleb128 0x14
	.byte	0x9
	.byte	0xf8
	.long	0x1240
	.uleb128 0x15
	.byte	0x9
	.value	0x101
	.long	0x1262
	.uleb128 0x15
	.byte	0x9
	.value	0x102
	.long	0x1282
	.uleb128 0x12
	.long	.LASF136
	.byte	0xf
	.byte	0x24
	.uleb128 0x14
	.byte	0x10
	.byte	0x2c
	.long	0x52d
	.uleb128 0x14
	.byte	0x10
	.byte	0x2d
	.long	0x54d
	.uleb128 0x7
	.long	.LASF137
	.byte	0x1
	.byte	0x11
	.byte	0x37
	.long	0x9e8
	.uleb128 0x27
	.long	.LASF138
	.byte	0x11
	.byte	0x3a
	.long	0x343
	.uleb128 0x27
	.long	.LASF139
	.byte	0x11
	.byte	0x3b
	.long	0x343
	.uleb128 0x27
	.long	.LASF140
	.byte	0x11
	.byte	0x3f
	.long	0x141f
	.uleb128 0x27
	.long	.LASF141
	.byte	0x11
	.byte	0x40
	.long	0x343
	.uleb128 0x28
	.long	.LASF143
	.long	0x37
	.byte	0
	.uleb128 0x7
	.long	.LASF142
	.byte	0x1
	.byte	0x11
	.byte	0x37
	.long	0xa2a
	.uleb128 0x27
	.long	.LASF138
	.byte	0x11
	.byte	0x3a
	.long	0x1424
	.uleb128 0x27
	.long	.LASF139
	.byte	0x11
	.byte	0x3b
	.long	0x1424
	.uleb128 0x27
	.long	.LASF140
	.byte	0x11
	.byte	0x3f
	.long	0x141f
	.uleb128 0x27
	.long	.LASF141
	.byte	0x11
	.byte	0x40
	.long	0x343
	.uleb128 0x28
	.long	.LASF143
	.long	0x5a
	.byte	0
	.uleb128 0x7
	.long	.LASF144
	.byte	0x1
	.byte	0x11
	.byte	0x37
	.long	0xa6c
	.uleb128 0x27
	.long	.LASF138
	.byte	0x11
	.byte	0x3a
	.long	0x337
	.uleb128 0x27
	.long	.LASF139
	.byte	0x11
	.byte	0x3b
	.long	0x337
	.uleb128 0x27
	.long	.LASF140
	.byte	0x11
	.byte	0x3f
	.long	0x141f
	.uleb128 0x27
	.long	.LASF141
	.byte	0x11
	.byte	0x40
	.long	0x343
	.uleb128 0x28
	.long	.LASF143
	.long	0x9c
	.byte	0
	.uleb128 0x7
	.long	.LASF145
	.byte	0x1
	.byte	0x11
	.byte	0x37
	.long	0xaae
	.uleb128 0x27
	.long	.LASF138
	.byte	0x11
	.byte	0x3a
	.long	0x14ae
	.uleb128 0x27
	.long	.LASF139
	.byte	0x11
	.byte	0x3b
	.long	0x14ae
	.uleb128 0x27
	.long	.LASF140
	.byte	0x11
	.byte	0x3f
	.long	0x141f
	.uleb128 0x27
	.long	.LASF141
	.byte	0x11
	.byte	0x40
	.long	0x343
	.uleb128 0x28
	.long	.LASF143
	.long	0x30
	.byte	0
	.uleb128 0x29
	.long	.LASF300
	.byte	0x1
	.byte	0x11
	.byte	0x37
	.uleb128 0x27
	.long	.LASF138
	.byte	0x11
	.byte	0x3a
	.long	0x14b3
	.uleb128 0x27
	.long	.LASF139
	.byte	0x11
	.byte	0x3b
	.long	0x14b3
	.uleb128 0x27
	.long	.LASF140
	.byte	0x11
	.byte	0x3f
	.long	0x141f
	.uleb128 0x27
	.long	.LASF141
	.byte	0x11
	.byte	0x40
	.long	0x343
	.uleb128 0x28
	.long	.LASF143
	.long	0x3e
	.byte	0
	.byte	0
	.uleb128 0x2a
	.long	.LASF146
	.byte	0x3
	.value	0x165
	.long	0x53
	.uleb128 0x4
	.long	.LASF147
	.byte	0x7
	.byte	0x6a
	.long	0x27f
	.uleb128 0x2b
	.long	.LASF148
	.byte	0x7
	.value	0x164
	.long	0xaed
	.long	0xb1a
	.uleb128 0x2c
	.long	0x37
	.byte	0
	.uleb128 0x2b
	.long	.LASF149
	.byte	0x7
	.value	0x2ec
	.long	0xaed
	.long	0xb30
	.uleb128 0x2c
	.long	0xb30
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x220
	.uleb128 0x2b
	.long	.LASF150
	.byte	0x7
	.value	0x309
	.long	0xb56
	.long	0xb56
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0x37
	.uleb128 0x2c
	.long	0xb30
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb5c
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF151
	.uleb128 0x2b
	.long	.LASF152
	.byte	0x7
	.value	0x2fa
	.long	0xaed
	.long	0xb7e
	.uleb128 0x2c
	.long	0xb5c
	.uleb128 0x2c
	.long	0xb30
	.byte	0
	.uleb128 0x2b
	.long	.LASF153
	.byte	0x7
	.value	0x310
	.long	0x37
	.long	0xb99
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb30
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb9f
	.uleb128 0x10
	.long	0xb5c
	.uleb128 0x2b
	.long	.LASF154
	.byte	0x7
	.value	0x24e
	.long	0x37
	.long	0xbbf
	.uleb128 0x2c
	.long	0xb30
	.uleb128 0x2c
	.long	0x37
	.byte	0
	.uleb128 0x2b
	.long	.LASF155
	.byte	0x7
	.value	0x255
	.long	0x37
	.long	0xbdb
	.uleb128 0x2c
	.long	0xb30
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2d
	.byte	0
	.uleb128 0x2b
	.long	.LASF156
	.byte	0x7
	.value	0x27e
	.long	0x37
	.long	0xbf7
	.uleb128 0x2c
	.long	0xb30
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2d
	.byte	0
	.uleb128 0x2b
	.long	.LASF157
	.byte	0x7
	.value	0x2ed
	.long	0xaed
	.long	0xc0d
	.uleb128 0x2c
	.long	0xb30
	.byte	0
	.uleb128 0x2e
	.long	.LASF251
	.byte	0x7
	.value	0x2f3
	.long	0xaed
	.uleb128 0x2b
	.long	.LASF158
	.byte	0x7
	.value	0x17b
	.long	0x61
	.long	0xc39
	.uleb128 0x2c
	.long	0x331
	.uleb128 0x2c
	.long	0x61
	.uleb128 0x2c
	.long	0xc39
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xaf9
	.uleb128 0x2b
	.long	.LASF159
	.byte	0x7
	.value	0x170
	.long	0x61
	.long	0xc64
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0x331
	.uleb128 0x2c
	.long	0x61
	.uleb128 0x2c
	.long	0xc39
	.byte	0
	.uleb128 0x2b
	.long	.LASF160
	.byte	0x7
	.value	0x16c
	.long	0x37
	.long	0xc7a
	.uleb128 0x2c
	.long	0xc7a
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xc80
	.uleb128 0x10
	.long	0xaf9
	.uleb128 0x2b
	.long	.LASF161
	.byte	0x7
	.value	0x19b
	.long	0x61
	.long	0xcaa
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0xcaa
	.uleb128 0x2c
	.long	0x61
	.uleb128 0x2c
	.long	0xc39
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x331
	.uleb128 0x2b
	.long	.LASF162
	.byte	0x7
	.value	0x2fb
	.long	0xaed
	.long	0xccb
	.uleb128 0x2c
	.long	0xb5c
	.uleb128 0x2c
	.long	0xb30
	.byte	0
	.uleb128 0x2b
	.long	.LASF163
	.byte	0x7
	.value	0x301
	.long	0xaed
	.long	0xce1
	.uleb128 0x2c
	.long	0xb5c
	.byte	0
	.uleb128 0x2b
	.long	.LASF164
	.byte	0x7
	.value	0x25f
	.long	0x37
	.long	0xd02
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0x61
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2d
	.byte	0
	.uleb128 0x2b
	.long	.LASF165
	.byte	0x7
	.value	0x288
	.long	0x37
	.long	0xd1e
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2d
	.byte	0
	.uleb128 0x2b
	.long	.LASF166
	.byte	0x7
	.value	0x318
	.long	0xaed
	.long	0xd39
	.uleb128 0x2c
	.long	0xaed
	.uleb128 0x2c
	.long	0xb30
	.byte	0
	.uleb128 0x2b
	.long	.LASF167
	.byte	0x7
	.value	0x267
	.long	0x37
	.long	0xd59
	.uleb128 0x2c
	.long	0xb30
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xd59
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x28a
	.uleb128 0x2b
	.long	.LASF168
	.byte	0x7
	.value	0x2b4
	.long	0x37
	.long	0xd7f
	.uleb128 0x2c
	.long	0xb30
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xd59
	.byte	0
	.uleb128 0x2b
	.long	.LASF169
	.byte	0x7
	.value	0x274
	.long	0x37
	.long	0xda4
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0x61
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xd59
	.byte	0
	.uleb128 0x2b
	.long	.LASF170
	.byte	0x7
	.value	0x2c0
	.long	0x37
	.long	0xdc4
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xd59
	.byte	0
	.uleb128 0x2b
	.long	.LASF171
	.byte	0x7
	.value	0x26f
	.long	0x37
	.long	0xddf
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xd59
	.byte	0
	.uleb128 0x2b
	.long	.LASF172
	.byte	0x7
	.value	0x2bc
	.long	0x37
	.long	0xdfa
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xd59
	.byte	0
	.uleb128 0x2b
	.long	.LASF173
	.byte	0x7
	.value	0x175
	.long	0x61
	.long	0xe1a
	.uleb128 0x2c
	.long	0x96
	.uleb128 0x2c
	.long	0xb5c
	.uleb128 0x2c
	.long	0xc39
	.byte	0
	.uleb128 0x2f
	.long	.LASF174
	.byte	0x7
	.byte	0x9d
	.long	0xb56
	.long	0xe34
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0xb99
	.byte	0
	.uleb128 0x2f
	.long	.LASF175
	.byte	0x7
	.byte	0xa6
	.long	0x37
	.long	0xe4e
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb99
	.byte	0
	.uleb128 0x2f
	.long	.LASF176
	.byte	0x7
	.byte	0xc3
	.long	0x37
	.long	0xe68
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb99
	.byte	0
	.uleb128 0x2f
	.long	.LASF177
	.byte	0x7
	.byte	0x93
	.long	0xb56
	.long	0xe82
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0xb99
	.byte	0
	.uleb128 0x2f
	.long	.LASF178
	.byte	0x7
	.byte	0xff
	.long	0x61
	.long	0xe9c
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb99
	.byte	0
	.uleb128 0x2b
	.long	.LASF179
	.byte	0x7
	.value	0x35a
	.long	0x61
	.long	0xec1
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0x61
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xec1
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xf57
	.uleb128 0x30
	.string	"tm"
	.byte	0x38
	.byte	0x12
	.byte	0x85
	.long	0xf57
	.uleb128 0x8
	.long	.LASF180
	.byte	0x12
	.byte	0x87
	.long	0x37
	.byte	0
	.uleb128 0x8
	.long	.LASF181
	.byte	0x12
	.byte	0x88
	.long	0x37
	.byte	0x4
	.uleb128 0x8
	.long	.LASF182
	.byte	0x12
	.byte	0x89
	.long	0x37
	.byte	0x8
	.uleb128 0x8
	.long	.LASF183
	.byte	0x12
	.byte	0x8a
	.long	0x37
	.byte	0xc
	.uleb128 0x8
	.long	.LASF184
	.byte	0x12
	.byte	0x8b
	.long	0x37
	.byte	0x10
	.uleb128 0x8
	.long	.LASF185
	.byte	0x12
	.byte	0x8c
	.long	0x37
	.byte	0x14
	.uleb128 0x8
	.long	.LASF186
	.byte	0x12
	.byte	0x8d
	.long	0x37
	.byte	0x18
	.uleb128 0x8
	.long	.LASF187
	.byte	0x12
	.byte	0x8e
	.long	0x37
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF188
	.byte	0x12
	.byte	0x8f
	.long	0x37
	.byte	0x20
	.uleb128 0x8
	.long	.LASF189
	.byte	0x12
	.byte	0x92
	.long	0x3e
	.byte	0x28
	.uleb128 0x8
	.long	.LASF190
	.byte	0x12
	.byte	0x93
	.long	0x331
	.byte	0x30
	.byte	0
	.uleb128 0x10
	.long	0xec7
	.uleb128 0x2b
	.long	.LASF191
	.byte	0x7
	.value	0x122
	.long	0x61
	.long	0xf72
	.uleb128 0x2c
	.long	0xb99
	.byte	0
	.uleb128 0x2f
	.long	.LASF192
	.byte	0x7
	.byte	0xa1
	.long	0xb56
	.long	0xf91
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x61
	.byte	0
	.uleb128 0x2f
	.long	.LASF193
	.byte	0x7
	.byte	0xa9
	.long	0x37
	.long	0xfb0
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x61
	.byte	0
	.uleb128 0x2f
	.long	.LASF194
	.byte	0x7
	.byte	0x98
	.long	0xb56
	.long	0xfcf
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x61
	.byte	0
	.uleb128 0x2b
	.long	.LASF195
	.byte	0x7
	.value	0x1a1
	.long	0x61
	.long	0xff4
	.uleb128 0x2c
	.long	0x96
	.uleb128 0x2c
	.long	0xff4
	.uleb128 0x2c
	.long	0x61
	.uleb128 0x2c
	.long	0xc39
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb99
	.uleb128 0x2b
	.long	.LASF196
	.byte	0x7
	.value	0x103
	.long	0x61
	.long	0x1015
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb99
	.byte	0
	.uleb128 0x2b
	.long	.LASF197
	.byte	0x7
	.value	0x1c5
	.long	0x1030
	.long	0x1030
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x1037
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF198
	.uleb128 0x6
	.byte	0x8
	.long	0xb56
	.uleb128 0x2b
	.long	.LASF199
	.byte	0x7
	.value	0x1cc
	.long	0x1058
	.long	0x1058
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x1037
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF200
	.uleb128 0x2b
	.long	.LASF201
	.byte	0x7
	.value	0x11d
	.long	0xb56
	.long	0x107f
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x1037
	.byte	0
	.uleb128 0x2b
	.long	.LASF202
	.byte	0x7
	.value	0x1d7
	.long	0x3e
	.long	0x109f
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x1037
	.uleb128 0x2c
	.long	0x37
	.byte	0
	.uleb128 0x2b
	.long	.LASF203
	.byte	0x7
	.value	0x1dc
	.long	0x5a
	.long	0x10bf
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x1037
	.uleb128 0x2c
	.long	0x37
	.byte	0
	.uleb128 0x2f
	.long	.LASF204
	.byte	0x7
	.byte	0xc7
	.long	0x61
	.long	0x10de
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x61
	.byte	0
	.uleb128 0x2b
	.long	.LASF205
	.byte	0x7
	.value	0x168
	.long	0x37
	.long	0x10f4
	.uleb128 0x2c
	.long	0xaed
	.byte	0
	.uleb128 0x2b
	.long	.LASF206
	.byte	0x7
	.value	0x148
	.long	0x37
	.long	0x1114
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x61
	.byte	0
	.uleb128 0x2b
	.long	.LASF207
	.byte	0x7
	.value	0x14c
	.long	0xb56
	.long	0x1134
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x61
	.byte	0
	.uleb128 0x2b
	.long	.LASF208
	.byte	0x7
	.value	0x151
	.long	0xb56
	.long	0x1154
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x61
	.byte	0
	.uleb128 0x2b
	.long	.LASF209
	.byte	0x7
	.value	0x155
	.long	0xb56
	.long	0x1174
	.uleb128 0x2c
	.long	0xb56
	.uleb128 0x2c
	.long	0xb5c
	.uleb128 0x2c
	.long	0x61
	.byte	0
	.uleb128 0x2b
	.long	.LASF210
	.byte	0x7
	.value	0x25c
	.long	0x37
	.long	0x118b
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2d
	.byte	0
	.uleb128 0x2b
	.long	.LASF211
	.byte	0x7
	.value	0x285
	.long	0x37
	.long	0x11a2
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2d
	.byte	0
	.uleb128 0x31
	.long	.LASF213
	.byte	0x7
	.byte	0xe3
	.long	.LASF213
	.long	0xb99
	.long	0x11c0
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb5c
	.byte	0
	.uleb128 0x32
	.long	.LASF214
	.byte	0x7
	.value	0x109
	.long	.LASF214
	.long	0xb99
	.long	0x11df
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb99
	.byte	0
	.uleb128 0x31
	.long	.LASF216
	.byte	0x7
	.byte	0xed
	.long	.LASF216
	.long	0xb99
	.long	0x11fd
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb5c
	.byte	0
	.uleb128 0x32
	.long	.LASF217
	.byte	0x7
	.value	0x114
	.long	.LASF217
	.long	0xb99
	.long	0x121c
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb99
	.byte	0
	.uleb128 0x32
	.long	.LASF218
	.byte	0x7
	.value	0x13f
	.long	.LASF218
	.long	0xb99
	.long	0x1240
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0xb5c
	.uleb128 0x2c
	.long	0x61
	.byte	0
	.uleb128 0x2b
	.long	.LASF219
	.byte	0x7
	.value	0x1ce
	.long	0x125b
	.long	0x125b
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x1037
	.byte	0
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF220
	.uleb128 0x2b
	.long	.LASF221
	.byte	0x7
	.value	0x1e6
	.long	0x33c
	.long	0x1282
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x1037
	.uleb128 0x2c
	.long	0x37
	.byte	0
	.uleb128 0x2b
	.long	.LASF222
	.byte	0x7
	.value	0x1ed
	.long	0x348
	.long	0x12a2
	.uleb128 0x2c
	.long	0xb99
	.uleb128 0x2c
	.long	0x1037
	.uleb128 0x2c
	.long	0x37
	.byte	0
	.uleb128 0x26
	.long	.LASF223
	.byte	0xb
	.byte	0x37
	.long	0x12b5
	.uleb128 0x13
	.byte	0xb
	.byte	0x38
	.long	0x526
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF224
	.uleb128 0x7
	.long	.LASF225
	.byte	0x60
	.byte	0x13
	.byte	0x35
	.long	0x13e9
	.uleb128 0x8
	.long	.LASF226
	.byte	0x13
	.byte	0x39
	.long	0x96
	.byte	0
	.uleb128 0x8
	.long	.LASF227
	.byte	0x13
	.byte	0x3a
	.long	0x96
	.byte	0x8
	.uleb128 0x8
	.long	.LASF228
	.byte	0x13
	.byte	0x40
	.long	0x96
	.byte	0x10
	.uleb128 0x8
	.long	.LASF229
	.byte	0x13
	.byte	0x46
	.long	0x96
	.byte	0x18
	.uleb128 0x8
	.long	.LASF230
	.byte	0x13
	.byte	0x47
	.long	0x96
	.byte	0x20
	.uleb128 0x8
	.long	.LASF231
	.byte	0x13
	.byte	0x48
	.long	0x96
	.byte	0x28
	.uleb128 0x8
	.long	.LASF232
	.byte	0x13
	.byte	0x49
	.long	0x96
	.byte	0x30
	.uleb128 0x8
	.long	.LASF233
	.byte	0x13
	.byte	0x4a
	.long	0x96
	.byte	0x38
	.uleb128 0x8
	.long	.LASF234
	.byte	0x13
	.byte	0x4b
	.long	0x96
	.byte	0x40
	.uleb128 0x8
	.long	.LASF235
	.byte	0x13
	.byte	0x4c
	.long	0x96
	.byte	0x48
	.uleb128 0x8
	.long	.LASF236
	.byte	0x13
	.byte	0x4d
	.long	0x9c
	.byte	0x50
	.uleb128 0x8
	.long	.LASF237
	.byte	0x13
	.byte	0x4e
	.long	0x9c
	.byte	0x51
	.uleb128 0x8
	.long	.LASF238
	.byte	0x13
	.byte	0x50
	.long	0x9c
	.byte	0x52
	.uleb128 0x8
	.long	.LASF239
	.byte	0x13
	.byte	0x52
	.long	0x9c
	.byte	0x53
	.uleb128 0x8
	.long	.LASF240
	.byte	0x13
	.byte	0x54
	.long	0x9c
	.byte	0x54
	.uleb128 0x8
	.long	.LASF241
	.byte	0x13
	.byte	0x56
	.long	0x9c
	.byte	0x55
	.uleb128 0x8
	.long	.LASF242
	.byte	0x13
	.byte	0x5d
	.long	0x9c
	.byte	0x56
	.uleb128 0x8
	.long	.LASF243
	.byte	0x13
	.byte	0x5e
	.long	0x9c
	.byte	0x57
	.uleb128 0x8
	.long	.LASF244
	.byte	0x13
	.byte	0x61
	.long	0x9c
	.byte	0x58
	.uleb128 0x8
	.long	.LASF245
	.byte	0x13
	.byte	0x63
	.long	0x9c
	.byte	0x59
	.uleb128 0x8
	.long	.LASF246
	.byte	0x13
	.byte	0x65
	.long	0x9c
	.byte	0x5a
	.uleb128 0x8
	.long	.LASF247
	.byte	0x13
	.byte	0x67
	.long	0x9c
	.byte	0x5b
	.uleb128 0x8
	.long	.LASF248
	.byte	0x13
	.byte	0x6e
	.long	0x9c
	.byte	0x5c
	.uleb128 0x8
	.long	.LASF249
	.byte	0x13
	.byte	0x6f
	.long	0x9c
	.byte	0x5d
	.byte	0
	.uleb128 0x2f
	.long	.LASF250
	.byte	0x13
	.byte	0x7c
	.long	0x96
	.long	0x1403
	.uleb128 0x2c
	.long	0x37
	.uleb128 0x2c
	.long	0x331
	.byte	0
	.uleb128 0x33
	.long	.LASF252
	.byte	0x13
	.byte	0x7f
	.long	0x140e
	.uleb128 0x6
	.byte	0x8
	.long	0x12bc
	.uleb128 0x4
	.long	.LASF253
	.byte	0x14
	.byte	0x20
	.long	0x37
	.uleb128 0x10
	.long	0x12b5
	.uleb128 0x10
	.long	0x5a
	.uleb128 0x6
	.byte	0x8
	.long	0x6c4
	.uleb128 0x4
	.long	.LASF254
	.byte	0x15
	.byte	0x34
	.long	0x5a
	.uleb128 0x4
	.long	.LASF255
	.byte	0x15
	.byte	0xba
	.long	0x1445
	.uleb128 0x6
	.byte	0x8
	.long	0x144b
	.uleb128 0x10
	.long	0x6c
	.uleb128 0x2f
	.long	.LASF256
	.byte	0x15
	.byte	0xaf
	.long	0x37
	.long	0x146a
	.uleb128 0x2c
	.long	0xaed
	.uleb128 0x2c
	.long	0x142f
	.byte	0
	.uleb128 0x2f
	.long	.LASF257
	.byte	0x15
	.byte	0xdd
	.long	0xaed
	.long	0x1484
	.uleb128 0x2c
	.long	0xaed
	.uleb128 0x2c
	.long	0x143a
	.byte	0
	.uleb128 0x2f
	.long	.LASF258
	.byte	0x15
	.byte	0xda
	.long	0x143a
	.long	0x1499
	.uleb128 0x2c
	.long	0x331
	.byte	0
	.uleb128 0x2f
	.long	.LASF259
	.byte	0x15
	.byte	0xab
	.long	0x142f
	.long	0x14ae
	.uleb128 0x2c
	.long	0x331
	.byte	0
	.uleb128 0x10
	.long	0x30
	.uleb128 0x10
	.long	0x3e
	.uleb128 0x34
	.long	.LASF264
	.byte	0x28
	.byte	0x1
	.byte	0x1c
	.long	0x1542
	.uleb128 0x8
	.long	.LASF260
	.byte	0x1
	.byte	0x1e
	.long	0x34f
	.byte	0
	.uleb128 0x8
	.long	.LASF261
	.byte	0x1
	.byte	0x1f
	.long	0x37
	.byte	0x20
	.uleb128 0x8
	.long	.LASF262
	.byte	0x1
	.byte	0x20
	.long	0x37
	.byte	0x24
	.uleb128 0x35
	.long	.LASF264
	.byte	0x1
	.byte	0x23
	.long	.LASF266
	.byte	0x1
	.long	0x14fc
	.long	0x1511
	.uleb128 0x1f
	.long	0x1542
	.uleb128 0x2c
	.long	0x331
	.uleb128 0x2c
	.long	0x37
	.uleb128 0x2c
	.long	0x37
	.byte	0
	.uleb128 0x35
	.long	.LASF265
	.byte	0x1
	.byte	0x28
	.long	.LASF267
	.byte	0x1
	.long	0x1525
	.long	0x152b
	.uleb128 0x1f
	.long	0x1542
	.byte	0
	.uleb128 0x36
	.long	.LASF268
	.byte	0x1
	.byte	0x2c
	.long	.LASF269
	.byte	0x1
	.long	0x153b
	.uleb128 0x1f
	.long	0x1542
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x14b8
	.uleb128 0x37
	.long	0x14e8
	.byte	0x2
	.long	0x1556
	.long	0x1581
	.uleb128 0x38
	.long	.LASF273
	.long	0x1581
	.uleb128 0x39
	.long	.LASF270
	.byte	0x1
	.byte	0x23
	.long	0x331
	.uleb128 0x39
	.long	.LASF271
	.byte	0x1
	.byte	0x23
	.long	0x37
	.uleb128 0x39
	.long	.LASF272
	.byte	0x1
	.byte	0x23
	.long	0x37
	.byte	0
	.uleb128 0x10
	.long	0x1542
	.uleb128 0x3a
	.long	0x1548
	.long	.LASF301
	.quad	.LFB1022
	.quad	.LFE1022-.LFB1022
	.uleb128 0x1
	.byte	0x9c
	.long	0x15a9
	.long	0x15ca
	.uleb128 0x3b
	.long	0x1556
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3b
	.long	0x155f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3b
	.long	0x156a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x3b
	.long	0x1575
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x3c
	.long	0x1511
	.quad	.LFB1024
	.quad	.LFE1024-.LFB1024
	.uleb128 0x1
	.byte	0x9c
	.long	0x15e9
	.long	0x15f6
	.uleb128 0x3d
	.long	.LASF273
	.long	0x1581
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x3c
	.long	0x152b
	.quad	.LFB1025
	.quad	.LFE1025-.LFB1025
	.uleb128 0x1
	.byte	0x9c
	.long	0x1615
	.long	0x1622
	.uleb128 0x3d
	.long	.LASF273
	.long	0x1581
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x3e
	.long	.LASF302
	.byte	0x1
	.byte	0x44
	.long	0x37
	.quad	.LFB1026
	.quad	.LFE1026-.LFB1026
	.uleb128 0x1
	.byte	0x9c
	.long	0x168e
	.uleb128 0x3f
	.long	.LASF274
	.byte	0x1
	.byte	0x44
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x3f
	.long	.LASF275
	.byte	0x1
	.byte	0x44
	.long	0xcaa
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3f
	.long	.LASF276
	.byte	0x1
	.byte	0x44
	.long	0xcaa
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x40
	.long	.LASF278
	.byte	0x1
	.byte	0x46
	.long	0x14b8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x40
	.long	.LASF279
	.byte	0x1
	.byte	0x49
	.long	0x168e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x41
	.byte	0x10
	.byte	0x8
	.byte	0
	.long	0x16af
	.uleb128 0x8
	.long	.LASF280
	.byte	0x1
	.byte	0x49
	.long	0x16be
	.byte	0
	.uleb128 0x8
	.long	.LASF281
	.byte	0x1
	.byte	0x49
	.long	0x3e
	.byte	0x8
	.byte	0
	.uleb128 0x42
	.long	0x16b8
	.long	0x16be
	.uleb128 0x1f
	.long	0x1542
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x16af
	.uleb128 0x43
	.long	.LASF303
	.quad	.LFB1027
	.quad	.LFE1027-.LFB1027
	.uleb128 0x1
	.byte	0x9c
	.long	0x16fc
	.uleb128 0x3f
	.long	.LASF282
	.byte	0x1
	.byte	0x4f
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3f
	.long	.LASF283
	.byte	0x1
	.byte	0x4f
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x44
	.long	.LASF304
	.quad	.LFB1028
	.quad	.LFE1028-.LFB1028
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x45
	.long	.LASF284
	.long	0x94
	.uleb128 0x46
	.long	0x955
	.uleb128 0x9
	.byte	0x3
	.quad	_ZStL8__ioinit
	.uleb128 0x47
	.long	0x9b2
	.long	.LASF285
	.sleb128 -2147483648
	.uleb128 0x48
	.long	0x9bd
	.long	.LASF286
	.long	0x7fffffff
	.uleb128 0x49
	.long	0xa15
	.long	.LASF287
	.byte	0x40
	.uleb128 0x49
	.long	0xa41
	.long	.LASF288
	.byte	0x7f
	.uleb128 0x47
	.long	0xa78
	.long	.LASF289
	.sleb128 -32768
	.uleb128 0x4a
	.long	0xa83
	.long	.LASF290
	.value	0x7fff
	.uleb128 0x47
	.long	0xab6
	.long	.LASF291
	.sleb128 -9223372036854775808
	.uleb128 0x4b
	.long	0xac1
	.long	.LASF292
	.quad	0x7fffffffffffffff
	.byte	0
	.section	.debug_abbrev,"",@progbits
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x3a
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2f
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x31
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x2
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
	.uleb128 0x35
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x39
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
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3e
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3f
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
	.uleb128 0x40
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
	.uleb128 0x41
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
	.uleb128 0x42
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x45
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x46
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x47
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x48
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x49
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4a
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x4b
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x7
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x5c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB1022
	.quad	.LFE1022-.LFB1022
	.quad	.LFB1024
	.quad	.LFE1024-.LFB1024
	.quad	.LFB1025
	.quad	.LFE1025-.LFB1025
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB1022
	.quad	.LFE1022
	.quad	.LFB1024
	.quad	.LFE1024
	.quad	.LFB1025
	.quad	.LFE1025
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF304:
	.string	"_GLOBAL__sub_I_main"
.LASF106:
	.string	"_S_end"
.LASF7:
	.string	"size_t"
.LASF11:
	.string	"sizetype"
.LASF182:
	.string	"tm_hour"
.LASF46:
	.string	"__value"
.LASF293:
	.string	"GNU C++ 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF137:
	.string	"__numeric_traits_integer<int>"
.LASF286:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIiE5__maxE"
.LASF110:
	.string	"boolalpha"
.LASF269:
	.string	"_ZN4Book6outputEv"
.LASF24:
	.string	"_IO_save_end"
.LASF115:
	.string	"scientific"
.LASF139:
	.string	"__max"
.LASF178:
	.string	"wcscspn"
.LASF252:
	.string	"localeconv"
.LASF83:
	.string	"_S_ios_fmtflags_min"
.LASF237:
	.string	"frac_digits"
.LASF17:
	.string	"_IO_write_base"
.LASF101:
	.string	"_S_ios_iostate_max"
.LASF33:
	.string	"_lock"
.LASF229:
	.string	"int_curr_symbol"
.LASF130:
	.string	"goodbit"
.LASF213:
	.string	"wcschr"
.LASF63:
	.string	"_S_boolalpha"
.LASF129:
	.string	"failbit"
.LASF240:
	.string	"n_cs_precedes"
.LASF22:
	.string	"_IO_save_base"
.LASF159:
	.string	"mbrtowc"
.LASF204:
	.string	"wcsxfrm"
.LASF236:
	.string	"int_frac_digits"
.LASF26:
	.string	"_chain"
.LASF176:
	.string	"wcscoll"
.LASF30:
	.string	"_cur_column"
.LASF119:
	.string	"skipws"
.LASF43:
	.string	"__wch"
.LASF121:
	.string	"uppercase"
.LASF79:
	.string	"_S_basefield"
.LASF216:
	.string	"wcsrchr"
.LASF231:
	.string	"mon_decimal_point"
.LASF2:
	.string	"long int"
.LASF188:
	.string	"tm_isdst"
.LASF144:
	.string	"__numeric_traits_integer<char>"
.LASF171:
	.string	"vwprintf"
.LASF85:
	.string	"_Ios_Openmode"
.LASF54:
	.string	"_IO_marker"
.LASF302:
	.string	"main"
.LASF246:
	.string	"int_n_cs_precedes"
.LASF94:
	.string	"_S_ios_openmode_min"
.LASF257:
	.string	"towctrans"
.LASF276:
	.string	"envp"
.LASF147:
	.string	"mbstate_t"
.LASF277:
	.string	"__ioinit"
.LASF104:
	.string	"_S_beg"
.LASF97:
	.string	"_S_badbit"
.LASF109:
	.string	"_S_synced_with_stdio"
.LASF143:
	.string	"_Value"
.LASF98:
	.string	"_S_eofbit"
.LASF294:
	.string	"main.cpp"
.LASF187:
	.string	"tm_yday"
.LASF0:
	.string	"signed char"
.LASF48:
	.string	"_IO_FILE"
.LASF254:
	.string	"wctype_t"
.LASF149:
	.string	"fgetwc"
.LASF251:
	.string	"getwchar"
.LASF150:
	.string	"fgetws"
.LASF70:
	.string	"_S_right"
.LASF3:
	.string	"unsigned char"
.LASF241:
	.string	"n_sep_by_space"
.LASF218:
	.string	"wmemchr"
.LASF96:
	.string	"_S_goodbit"
.LASF290:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIsE5__maxE"
.LASF88:
	.string	"_S_bin"
.LASF175:
	.string	"wcscmp"
.LASF164:
	.string	"swprintf"
.LASF279:
	.string	"input_ptr"
.LASF214:
	.string	"wcspbrk"
.LASF292:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIlE5__maxE"
.LASF140:
	.string	"__is_signed"
.LASF261:
	.string	"price"
.LASF90:
	.string	"_S_out"
.LASF12:
	.string	"char"
.LASF268:
	.string	"output"
.LASF86:
	.string	"_S_app"
.LASF259:
	.string	"wctype"
.LASF131:
	.string	"openmode"
.LASF193:
	.string	"wcsncmp"
.LASF297:
	.string	"_IO_lock_t"
.LASF249:
	.string	"int_n_sign_posn"
.LASF243:
	.string	"n_sign_posn"
.LASF215:
	.string	"_ZNSt8ios_base4InitD4Ev"
.LASF208:
	.string	"wmemmove"
.LASF138:
	.string	"__min"
.LASF148:
	.string	"btowc"
.LASF14:
	.string	"_IO_read_ptr"
.LASF211:
	.string	"wscanf"
.LASF232:
	.string	"mon_thousands_sep"
.LASF166:
	.string	"ungetwc"
.LASF51:
	.string	"fp_offset"
.LASF62:
	.string	"ptrdiff_t"
.LASF285:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIiE5__minE"
.LASF255:
	.string	"wctrans_t"
.LASF158:
	.string	"mbrlen"
.LASF57:
	.string	"_pos"
.LASF235:
	.string	"negative_sign"
.LASF66:
	.string	"_S_hex"
.LASF244:
	.string	"int_p_cs_precedes"
.LASF155:
	.string	"fwprintf"
.LASF102:
	.string	"_S_ios_iostate_min"
.LASF265:
	.string	"input"
.LASF25:
	.string	"_markers"
.LASF222:
	.string	"wcstoull"
.LASF67:
	.string	"_S_internal"
.LASF234:
	.string	"positive_sign"
.LASF183:
	.string	"tm_mday"
.LASF123:
	.string	"basefield"
.LASF177:
	.string	"wcscpy"
.LASF111:
	.string	"fixed"
.LASF169:
	.string	"vswprintf"
.LASF209:
	.string	"wmemset"
.LASF134:
	.string	"seekdir"
.LASF154:
	.string	"fwide"
.LASF113:
	.string	"left"
.LASF180:
	.string	"tm_sec"
.LASF34:
	.string	"_offset"
.LASF194:
	.string	"wcsncpy"
.LASF163:
	.string	"putwchar"
.LASF206:
	.string	"wmemcmp"
.LASF87:
	.string	"_S_ate"
.LASF272:
	.string	"_page"
.LASF65:
	.string	"_S_fixed"
.LASF247:
	.string	"int_n_sep_by_space"
.LASF283:
	.string	"__priority"
.LASF6:
	.string	"long unsigned int"
.LASF72:
	.string	"_S_showbase"
.LASF89:
	.string	"_S_in"
.LASF28:
	.string	"_flags2"
.LASF301:
	.string	"_ZN4BookC2EPKcii"
.LASF223:
	.string	"__gnu_debug"
.LASF16:
	.string	"_IO_read_base"
.LASF270:
	.string	"_title"
.LASF167:
	.string	"vfwprintf"
.LASF273:
	.string	"this"
.LASF41:
	.string	"_unused2"
.LASF170:
	.string	"vswscanf"
.LASF239:
	.string	"p_sep_by_space"
.LASF264:
	.string	"Book"
.LASF108:
	.string	"_S_refcount"
.LASF29:
	.string	"_old_offset"
.LASF275:
	.string	"argv"
.LASF91:
	.string	"_S_trunc"
.LASF282:
	.string	"__initialize_p"
.LASF274:
	.string	"arTgc"
.LASF114:
	.string	"right"
.LASF58:
	.string	"long long int"
.LASF47:
	.string	"__mbstate_t"
.LASF280:
	.string	"__pfn"
.LASF207:
	.string	"wmemcpy"
.LASF184:
	.string	"tm_mon"
.LASF64:
	.string	"_S_dec"
.LASF84:
	.string	"_Ios_Fmtflags"
.LASF202:
	.string	"wcstol"
.LASF198:
	.string	"double"
.LASF112:
	.string	"internal"
.LASF19:
	.string	"_IO_write_end"
.LASF266:
	.string	"_ZN4BookC4EPKcii"
.LASF289:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIsE5__minE"
.LASF205:
	.string	"wctob"
.LASF73:
	.string	"_S_showpoint"
.LASF75:
	.string	"_S_skipws"
.LASF50:
	.string	"gp_offset"
.LASF78:
	.string	"_S_adjustfield"
.LASF287:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerImE8__digitsE"
.LASF200:
	.string	"float"
.LASF181:
	.string	"tm_min"
.LASF20:
	.string	"_IO_buf_base"
.LASF68:
	.string	"_S_left"
.LASF271:
	.string	"_price"
.LASF295:
	.string	"/home/iamjy1005/work/lab/practice/c++/src/pointer/src"
.LASF92:
	.string	"_S_ios_openmode_end"
.LASF196:
	.string	"wcsspn"
.LASF242:
	.string	"p_sign_posn"
.LASF5:
	.string	"unsigned int"
.LASF35:
	.string	"__pad1"
.LASF36:
	.string	"__pad2"
.LASF37:
	.string	"__pad3"
.LASF38:
	.string	"__pad4"
.LASF39:
	.string	"__pad5"
.LASF56:
	.string	"_sbuf"
.LASF77:
	.string	"_S_uppercase"
.LASF253:
	.string	"_Atomic_word"
.LASF116:
	.string	"showbase"
.LASF52:
	.string	"overflow_arg_area"
.LASF13:
	.string	"_flags"
.LASF81:
	.string	"_S_ios_fmtflags_end"
.LASF263:
	.string	"Init"
.LASF40:
	.string	"_mode"
.LASF262:
	.string	"page"
.LASF226:
	.string	"decimal_point"
.LASF45:
	.string	"__count"
.LASF135:
	.string	"__gnu_cxx"
.LASF278:
	.string	"book"
.LASF224:
	.string	"bool"
.LASF220:
	.string	"long double"
.LASF162:
	.string	"putwc"
.LASF300:
	.string	"__numeric_traits_integer<long int>"
.LASF118:
	.string	"showpos"
.LASF80:
	.string	"_S_floatfield"
.LASF69:
	.string	"_S_oct"
.LASF44:
	.string	"__wchb"
.LASF132:
	.string	"binary"
.LASF303:
	.string	"__static_initialization_and_destruction_0"
.LASF59:
	.string	"long long unsigned int"
.LASF53:
	.string	"reg_save_area"
.LASF219:
	.string	"wcstold"
.LASF245:
	.string	"int_p_sep_by_space"
.LASF107:
	.string	"_S_ios_seekdir_end"
.LASF221:
	.string	"wcstoll"
.LASF9:
	.string	"__off_t"
.LASF217:
	.string	"wcsstr"
.LASF95:
	.string	"_Ios_Iostate"
.LASF288:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIcE5__maxE"
.LASF195:
	.string	"wcsrtombs"
.LASF122:
	.string	"adjustfield"
.LASF186:
	.string	"tm_wday"
.LASF76:
	.string	"_S_unitbuf"
.LASF124:
	.string	"floatfield"
.LASF165:
	.string	"swscanf"
.LASF141:
	.string	"__digits"
.LASF197:
	.string	"wcstod"
.LASF199:
	.string	"wcstof"
.LASF201:
	.string	"wcstok"
.LASF60:
	.string	"__cxx11"
.LASF133:
	.string	"trunc"
.LASF42:
	.string	"__FILE"
.LASF117:
	.string	"showpoint"
.LASF23:
	.string	"_IO_backup_base"
.LASF250:
	.string	"setlocale"
.LASF32:
	.string	"_shortbuf"
.LASF156:
	.string	"fwscanf"
.LASF146:
	.string	"wint_t"
.LASF93:
	.string	"_S_ios_openmode_max"
.LASF55:
	.string	"_next"
.LASF298:
	.string	"ios_base"
.LASF10:
	.string	"__off64_t"
.LASF127:
	.string	"badbit"
.LASF258:
	.string	"wctrans"
.LASF227:
	.string	"thousands_sep"
.LASF299:
	.string	"_ZNSt8ios_base4InitC4Ev"
.LASF128:
	.string	"eofbit"
.LASF281:
	.string	"__delta"
.LASF21:
	.string	"_IO_buf_end"
.LASF191:
	.string	"wcslen"
.LASF126:
	.string	"iostate"
.LASF82:
	.string	"_S_ios_fmtflags_max"
.LASF61:
	.string	"__debug"
.LASF189:
	.string	"tm_gmtoff"
.LASF230:
	.string	"currency_symbol"
.LASF260:
	.string	"title"
.LASF1:
	.string	"short int"
.LASF179:
	.string	"wcsftime"
.LASF267:
	.string	"_ZN4Book5inputEv"
.LASF31:
	.string	"_vtable_offset"
.LASF233:
	.string	"mon_grouping"
.LASF105:
	.string	"_S_cur"
.LASF174:
	.string	"wcscat"
.LASF296:
	.string	"11__mbstate_t"
.LASF248:
	.string	"int_p_sign_posn"
.LASF190:
	.string	"tm_zone"
.LASF172:
	.string	"vwscanf"
.LASF100:
	.string	"_S_ios_iostate_end"
.LASF173:
	.string	"wcrtomb"
.LASF225:
	.string	"lconv"
.LASF74:
	.string	"_S_showpos"
.LASF15:
	.string	"_IO_read_end"
.LASF192:
	.string	"wcsncat"
.LASF145:
	.string	"__numeric_traits_integer<short int>"
.LASF284:
	.string	"__dso_handle"
.LASF152:
	.string	"fputwc"
.LASF27:
	.string	"_fileno"
.LASF153:
	.string	"fputws"
.LASF212:
	.string	"~Init"
.LASF161:
	.string	"mbsrtowcs"
.LASF99:
	.string	"_S_failbit"
.LASF238:
	.string	"p_cs_precedes"
.LASF142:
	.string	"__numeric_traits_integer<long unsigned int>"
.LASF185:
	.string	"tm_year"
.LASF4:
	.string	"short unsigned int"
.LASF136:
	.string	"__ops"
.LASF168:
	.string	"vfwscanf"
.LASF18:
	.string	"_IO_write_ptr"
.LASF103:
	.string	"_Ios_Seekdir"
.LASF125:
	.string	"fmtflags"
.LASF8:
	.string	"__int32_t"
.LASF120:
	.string	"unitbuf"
.LASF157:
	.string	"getwc"
.LASF160:
	.string	"mbsinit"
.LASF256:
	.string	"iswctype"
.LASF228:
	.string	"grouping"
.LASF210:
	.string	"wprintf"
.LASF291:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIlE5__minE"
.LASF71:
	.string	"_S_scientific"
.LASF151:
	.string	"wchar_t"
.LASF49:
	.string	"typedef __va_list_tag __va_list_tag"
.LASF203:
	.string	"wcstoul"
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
