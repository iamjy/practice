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
	.file 3 "/usr/include/c++/5/cwchar"
	.file 4 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++config.h"
	.file 5 "/usr/include/c++/5/debug/debug.h"
	.file 6 "/usr/include/c++/5/clocale"
	.file 7 "/usr/include/c++/5/bits/ios_base.h"
	.file 8 "/usr/include/c++/5/cwctype"
	.file 9 "/usr/include/c++/5/bits/predefined_ops.h"
	.file 10 "/usr/include/c++/5/ext/new_allocator.h"
	.file 11 "/usr/include/c++/5/ext/numeric_traits.h"
	.file 12 "/usr/include/libio.h"
	.file 13 "/usr/include/stdio.h"
	.file 14 "<built-in>"
	.file 15 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 16 "/usr/include/wchar.h"
	.file 17 "/usr/include/time.h"
	.file 18 "/usr/include/locale.h"
	.file 19 "/usr/include/x86_64-linux-gnu/bits/types.h"
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
	.string	"std"
	.byte	0xe
	.byte	0
	.long	0x62b
	.uleb128 0x3
	.long	.LASF0
	.byte	0x4
	.byte	0xda
	.uleb128 0x4
	.byte	0x4
	.byte	0xda
	.long	0x34
	.uleb128 0x5
	.byte	0x3
	.byte	0x40
	.long	0xa17
	.uleb128 0x5
	.byte	0x3
	.byte	0x8b
	.long	0x99e
	.uleb128 0x5
	.byte	0x3
	.byte	0x8d
	.long	0xa39
	.uleb128 0x5
	.byte	0x3
	.byte	0x8e
	.long	0xa4f
	.uleb128 0x5
	.byte	0x3
	.byte	0x8f
	.long	0xa6b
	.uleb128 0x5
	.byte	0x3
	.byte	0x90
	.long	0xa98
	.uleb128 0x5
	.byte	0x3
	.byte	0x91
	.long	0xab3
	.uleb128 0x5
	.byte	0x3
	.byte	0x92
	.long	0xad9
	.uleb128 0x5
	.byte	0x3
	.byte	0x93
	.long	0xaf4
	.uleb128 0x5
	.byte	0x3
	.byte	0x94
	.long	0xb10
	.uleb128 0x5
	.byte	0x3
	.byte	0x95
	.long	0xb2c
	.uleb128 0x5
	.byte	0x3
	.byte	0x96
	.long	0xb42
	.uleb128 0x5
	.byte	0x3
	.byte	0x97
	.long	0xb4e
	.uleb128 0x5
	.byte	0x3
	.byte	0x98
	.long	0xb74
	.uleb128 0x5
	.byte	0x3
	.byte	0x99
	.long	0xb99
	.uleb128 0x5
	.byte	0x3
	.byte	0x9a
	.long	0xbba
	.uleb128 0x5
	.byte	0x3
	.byte	0x9b
	.long	0xbe5
	.uleb128 0x5
	.byte	0x3
	.byte	0x9c
	.long	0xc00
	.uleb128 0x5
	.byte	0x3
	.byte	0x9e
	.long	0xc16
	.uleb128 0x5
	.byte	0x3
	.byte	0xa0
	.long	0xc37
	.uleb128 0x5
	.byte	0x3
	.byte	0xa1
	.long	0xc53
	.uleb128 0x5
	.byte	0x3
	.byte	0xa2
	.long	0xc6e
	.uleb128 0x5
	.byte	0x3
	.byte	0xa4
	.long	0xc94
	.uleb128 0x5
	.byte	0x3
	.byte	0xa7
	.long	0xcb4
	.uleb128 0x5
	.byte	0x3
	.byte	0xaa
	.long	0xcd9
	.uleb128 0x5
	.byte	0x3
	.byte	0xac
	.long	0xcf9
	.uleb128 0x5
	.byte	0x3
	.byte	0xae
	.long	0xd14
	.uleb128 0x5
	.byte	0x3
	.byte	0xb0
	.long	0xd2f
	.uleb128 0x5
	.byte	0x3
	.byte	0xb1
	.long	0xd55
	.uleb128 0x5
	.byte	0x3
	.byte	0xb2
	.long	0xd6f
	.uleb128 0x5
	.byte	0x3
	.byte	0xb3
	.long	0xd89
	.uleb128 0x5
	.byte	0x3
	.byte	0xb4
	.long	0xda3
	.uleb128 0x5
	.byte	0x3
	.byte	0xb5
	.long	0xdbd
	.uleb128 0x5
	.byte	0x3
	.byte	0xb6
	.long	0xdd7
	.uleb128 0x5
	.byte	0x3
	.byte	0xb7
	.long	0xe97
	.uleb128 0x5
	.byte	0x3
	.byte	0xb8
	.long	0xead
	.uleb128 0x5
	.byte	0x3
	.byte	0xb9
	.long	0xecc
	.uleb128 0x5
	.byte	0x3
	.byte	0xba
	.long	0xeeb
	.uleb128 0x5
	.byte	0x3
	.byte	0xbb
	.long	0xf0a
	.uleb128 0x5
	.byte	0x3
	.byte	0xbc
	.long	0xf35
	.uleb128 0x5
	.byte	0x3
	.byte	0xbd
	.long	0xf50
	.uleb128 0x5
	.byte	0x3
	.byte	0xbf
	.long	0xf78
	.uleb128 0x5
	.byte	0x3
	.byte	0xc1
	.long	0xf9a
	.uleb128 0x5
	.byte	0x3
	.byte	0xc2
	.long	0xfba
	.uleb128 0x5
	.byte	0x3
	.byte	0xc3
	.long	0xfe1
	.uleb128 0x5
	.byte	0x3
	.byte	0xc4
	.long	0x1001
	.uleb128 0x5
	.byte	0x3
	.byte	0xc5
	.long	0x1020
	.uleb128 0x5
	.byte	0x3
	.byte	0xc6
	.long	0x1036
	.uleb128 0x5
	.byte	0x3
	.byte	0xc7
	.long	0x1056
	.uleb128 0x5
	.byte	0x3
	.byte	0xc8
	.long	0x1076
	.uleb128 0x5
	.byte	0x3
	.byte	0xc9
	.long	0x1096
	.uleb128 0x5
	.byte	0x3
	.byte	0xca
	.long	0x10b6
	.uleb128 0x5
	.byte	0x3
	.byte	0xcb
	.long	0x10cd
	.uleb128 0x5
	.byte	0x3
	.byte	0xcc
	.long	0x10e4
	.uleb128 0x5
	.byte	0x3
	.byte	0xcd
	.long	0x1102
	.uleb128 0x5
	.byte	0x3
	.byte	0xce
	.long	0x1121
	.uleb128 0x5
	.byte	0x3
	.byte	0xcf
	.long	0x113f
	.uleb128 0x5
	.byte	0x3
	.byte	0xd0
	.long	0x115e
	.uleb128 0x6
	.byte	0x3
	.value	0x108
	.long	0x1182
	.uleb128 0x6
	.byte	0x3
	.value	0x109
	.long	0x11a4
	.uleb128 0x6
	.byte	0x3
	.value	0x10a
	.long	0x11cb
	.uleb128 0x3
	.long	.LASF1
	.byte	0x5
	.byte	0x30
	.uleb128 0x7
	.long	.LASF2
	.byte	0x4
	.byte	0xc4
	.long	0x997
	.uleb128 0x5
	.byte	0x6
	.byte	0x35
	.long	0x1221
	.uleb128 0x5
	.byte	0x6
	.byte	0x36
	.long	0x134e
	.uleb128 0x5
	.byte	0x6
	.byte	0x37
	.long	0x1368
	.uleb128 0x7
	.long	.LASF3
	.byte	0x4
	.byte	0xc5
	.long	0xfda
	.uleb128 0x8
	.long	.LASF25
	.byte	0x4
	.long	0xa05
	.byte	0x7
	.byte	0x39
	.long	0x2c3
	.uleb128 0x9
	.long	.LASF4
	.byte	0x1
	.uleb128 0x9
	.long	.LASF5
	.byte	0x2
	.uleb128 0x9
	.long	.LASF6
	.byte	0x4
	.uleb128 0x9
	.long	.LASF7
	.byte	0x8
	.uleb128 0x9
	.long	.LASF8
	.byte	0x10
	.uleb128 0x9
	.long	.LASF9
	.byte	0x20
	.uleb128 0x9
	.long	.LASF10
	.byte	0x40
	.uleb128 0x9
	.long	.LASF11
	.byte	0x80
	.uleb128 0xa
	.long	.LASF12
	.value	0x100
	.uleb128 0xa
	.long	.LASF13
	.value	0x200
	.uleb128 0xa
	.long	.LASF14
	.value	0x400
	.uleb128 0xa
	.long	.LASF15
	.value	0x800
	.uleb128 0xa
	.long	.LASF16
	.value	0x1000
	.uleb128 0xa
	.long	.LASF17
	.value	0x2000
	.uleb128 0xa
	.long	.LASF18
	.value	0x4000
	.uleb128 0x9
	.long	.LASF19
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4a
	.uleb128 0xa
	.long	.LASF21
	.value	0x104
	.uleb128 0xb
	.long	.LASF22
	.long	0x10000
	.uleb128 0xb
	.long	.LASF23
	.long	0x7fffffff
	.uleb128 0xc
	.long	.LASF24
	.sleb128 -2147483648
	.byte	0
	.uleb128 0x8
	.long	.LASF26
	.byte	0x4
	.long	0xa05
	.byte	0x7
	.byte	0x6f
	.long	0x314
	.uleb128 0x9
	.long	.LASF27
	.byte	0x1
	.uleb128 0x9
	.long	.LASF28
	.byte	0x2
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.uleb128 0x9
	.long	.LASF30
	.byte	0x8
	.uleb128 0x9
	.long	.LASF31
	.byte	0x10
	.uleb128 0x9
	.long	.LASF32
	.byte	0x20
	.uleb128 0xb
	.long	.LASF33
	.long	0x10000
	.uleb128 0xb
	.long	.LASF34
	.long	0x7fffffff
	.uleb128 0xc
	.long	.LASF35
	.sleb128 -2147483648
	.byte	0
	.uleb128 0x8
	.long	.LASF36
	.byte	0x4
	.long	0xa05
	.byte	0x7
	.byte	0x99
	.long	0x359
	.uleb128 0x9
	.long	.LASF37
	.byte	0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x1
	.uleb128 0x9
	.long	.LASF39
	.byte	0x2
	.uleb128 0x9
	.long	.LASF40
	.byte	0x4
	.uleb128 0xb
	.long	.LASF41
	.long	0x10000
	.uleb128 0xb
	.long	.LASF42
	.long	0x7fffffff
	.uleb128 0xc
	.long	.LASF43
	.sleb128 -2147483648
	.byte	0
	.uleb128 0x8
	.long	.LASF44
	.byte	0x4
	.long	0x983
	.byte	0x7
	.byte	0xc1
	.long	0x385
	.uleb128 0x9
	.long	.LASF45
	.byte	0
	.uleb128 0x9
	.long	.LASF46
	.byte	0x1
	.uleb128 0x9
	.long	.LASF47
	.byte	0x2
	.uleb128 0xb
	.long	.LASF48
	.long	0x10000
	.byte	0
	.uleb128 0xd
	.long	.LASF296
	.long	0x5ee
	.uleb128 0xe
	.long	.LASF263
	.byte	0x1
	.byte	0x7
	.value	0x259
	.byte	0x1
	.long	0x3ec
	.uleb128 0xf
	.long	.LASF49
	.byte	0x7
	.value	0x261
	.long	0x13aa
	.uleb128 0xf
	.long	.LASF50
	.byte	0x7
	.value	0x262
	.long	0x121a
	.uleb128 0x10
	.long	.LASF263
	.byte	0x7
	.value	0x25d
	.long	.LASF297
	.byte	0x1
	.long	0x3c9
	.long	0x3cf
	.uleb128 0x11
	.long	0x13bf
	.byte	0
	.uleb128 0x12
	.long	.LASF200
	.byte	0x7
	.value	0x25e
	.long	.LASF203
	.byte	0x1
	.long	0x3e0
	.uleb128 0x11
	.long	0x13bf
	.uleb128 0x11
	.long	0xa05
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	.LASF66
	.byte	0x7
	.value	0x143
	.long	0x222
	.byte	0x1
	.uleb128 0x14
	.long	.LASF51
	.byte	0x7
	.value	0x146
	.long	0x407
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.long	0x3ec
	.uleb128 0x16
	.string	"dec"
	.byte	0x7
	.value	0x149
	.long	0x407
	.byte	0x1
	.byte	0x2
	.uleb128 0x14
	.long	.LASF52
	.byte	0x7
	.value	0x14c
	.long	0x407
	.byte	0x1
	.byte	0x4
	.uleb128 0x16
	.string	"hex"
	.byte	0x7
	.value	0x14f
	.long	0x407
	.byte	0x1
	.byte	0x8
	.uleb128 0x14
	.long	.LASF53
	.byte	0x7
	.value	0x154
	.long	0x407
	.byte	0x1
	.byte	0x10
	.uleb128 0x14
	.long	.LASF54
	.byte	0x7
	.value	0x158
	.long	0x407
	.byte	0x1
	.byte	0x20
	.uleb128 0x16
	.string	"oct"
	.byte	0x7
	.value	0x15b
	.long	0x407
	.byte	0x1
	.byte	0x40
	.uleb128 0x14
	.long	.LASF55
	.byte	0x7
	.value	0x15f
	.long	0x407
	.byte	0x1
	.byte	0x80
	.uleb128 0x17
	.long	.LASF56
	.byte	0x7
	.value	0x162
	.long	0x407
	.byte	0x1
	.value	0x100
	.uleb128 0x17
	.long	.LASF57
	.byte	0x7
	.value	0x166
	.long	0x407
	.byte	0x1
	.value	0x200
	.uleb128 0x17
	.long	.LASF58
	.byte	0x7
	.value	0x16a
	.long	0x407
	.byte	0x1
	.value	0x400
	.uleb128 0x17
	.long	.LASF59
	.byte	0x7
	.value	0x16d
	.long	0x407
	.byte	0x1
	.value	0x800
	.uleb128 0x17
	.long	.LASF60
	.byte	0x7
	.value	0x170
	.long	0x407
	.byte	0x1
	.value	0x1000
	.uleb128 0x17
	.long	.LASF61
	.byte	0x7
	.value	0x173
	.long	0x407
	.byte	0x1
	.value	0x2000
	.uleb128 0x17
	.long	.LASF62
	.byte	0x7
	.value	0x177
	.long	0x407
	.byte	0x1
	.value	0x4000
	.uleb128 0x14
	.long	.LASF63
	.byte	0x7
	.value	0x17a
	.long	0x407
	.byte	0x1
	.byte	0xb0
	.uleb128 0x14
	.long	.LASF64
	.byte	0x7
	.value	0x17d
	.long	0x407
	.byte	0x1
	.byte	0x4a
	.uleb128 0x17
	.long	.LASF65
	.byte	0x7
	.value	0x180
	.long	0x407
	.byte	0x1
	.value	0x104
	.uleb128 0x13
	.long	.LASF67
	.byte	0x7
	.value	0x18e
	.long	0x314
	.byte	0x1
	.uleb128 0x14
	.long	.LASF68
	.byte	0x7
	.value	0x192
	.long	0x51d
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.long	0x502
	.uleb128 0x14
	.long	.LASF69
	.byte	0x7
	.value	0x195
	.long	0x51d
	.byte	0x1
	.byte	0x2
	.uleb128 0x14
	.long	.LASF70
	.byte	0x7
	.value	0x19a
	.long	0x51d
	.byte	0x1
	.byte	0x4
	.uleb128 0x14
	.long	.LASF71
	.byte	0x7
	.value	0x19d
	.long	0x51d
	.byte	0x1
	.byte	0
	.uleb128 0x13
	.long	.LASF72
	.byte	0x7
	.value	0x1ad
	.long	0x2c3
	.byte	0x1
	.uleb128 0x16
	.string	"app"
	.byte	0x7
	.value	0x1b0
	.long	0x567
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.long	0x54c
	.uleb128 0x16
	.string	"ate"
	.byte	0x7
	.value	0x1b3
	.long	0x567
	.byte	0x1
	.byte	0x2
	.uleb128 0x14
	.long	.LASF73
	.byte	0x7
	.value	0x1b8
	.long	0x567
	.byte	0x1
	.byte	0x4
	.uleb128 0x16
	.string	"in"
	.byte	0x7
	.value	0x1bb
	.long	0x567
	.byte	0x1
	.byte	0x8
	.uleb128 0x16
	.string	"out"
	.byte	0x7
	.value	0x1be
	.long	0x567
	.byte	0x1
	.byte	0x10
	.uleb128 0x14
	.long	.LASF74
	.byte	0x7
	.value	0x1c1
	.long	0x567
	.byte	0x1
	.byte	0x20
	.uleb128 0x13
	.long	.LASF75
	.byte	0x7
	.value	0x1cd
	.long	0x359
	.byte	0x1
	.uleb128 0x16
	.string	"beg"
	.byte	0x7
	.value	0x1d0
	.long	0x5cc
	.byte	0x1
	.byte	0
	.uleb128 0x15
	.long	0x5b1
	.uleb128 0x16
	.string	"cur"
	.byte	0x7
	.value	0x1d3
	.long	0x5cc
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.string	"end"
	.byte	0x7
	.value	0x1d6
	.long	0x5cc
	.byte	0x1
	.byte	0x2
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.byte	0x52
	.long	0x13d0
	.uleb128 0x5
	.byte	0x8
	.byte	0x53
	.long	0x13c5
	.uleb128 0x5
	.byte	0x8
	.byte	0x54
	.long	0x99e
	.uleb128 0x5
	.byte	0x8
	.byte	0x5c
	.long	0x13e6
	.uleb128 0x5
	.byte	0x8
	.byte	0x65
	.long	0x1400
	.uleb128 0x5
	.byte	0x8
	.byte	0x68
	.long	0x141a
	.uleb128 0x5
	.byte	0x8
	.byte	0x69
	.long	0x142f
	.uleb128 0x18
	.long	.LASF277
	.byte	0x2
	.byte	0x4a
	.long	0x38e
	.byte	0
	.uleb128 0x19
	.long	.LASF76
	.byte	0x4
	.byte	0xdd
	.long	0x7b7
	.uleb128 0x3
	.long	.LASF0
	.byte	0x4
	.byte	0xde
	.uleb128 0x4
	.byte	0x4
	.byte	0xde
	.long	0x636
	.uleb128 0x5
	.byte	0x3
	.byte	0xf8
	.long	0x1182
	.uleb128 0x6
	.byte	0x3
	.value	0x101
	.long	0x11a4
	.uleb128 0x6
	.byte	0x3
	.value	0x102
	.long	0x11cb
	.uleb128 0x3
	.long	.LASF77
	.byte	0x9
	.byte	0x24
	.uleb128 0x5
	.byte	0xa
	.byte	0x2c
	.long	0x1f7
	.uleb128 0x5
	.byte	0xa
	.byte	0x2d
	.long	0x217
	.uleb128 0x1a
	.long	.LASF82
	.byte	0x1
	.byte	0xb
	.byte	0x37
	.long	0x6b2
	.uleb128 0x1b
	.long	.LASF78
	.byte	0xb
	.byte	0x3a
	.long	0xa29
	.uleb128 0x1b
	.long	.LASF79
	.byte	0xb
	.byte	0x3b
	.long	0xa29
	.uleb128 0x1b
	.long	.LASF80
	.byte	0xb
	.byte	0x3f
	.long	0x13b5
	.uleb128 0x1b
	.long	.LASF81
	.byte	0xb
	.byte	0x40
	.long	0xa29
	.uleb128 0x1c
	.long	.LASF84
	.long	0xa05
	.byte	0
	.uleb128 0x1a
	.long	.LASF83
	.byte	0x1
	.byte	0xb
	.byte	0x37
	.long	0x6f4
	.uleb128 0x1b
	.long	.LASF78
	.byte	0xb
	.byte	0x3a
	.long	0x13ba
	.uleb128 0x1b
	.long	.LASF79
	.byte	0xb
	.byte	0x3b
	.long	0x13ba
	.uleb128 0x1b
	.long	.LASF80
	.byte	0xb
	.byte	0x3f
	.long	0x13b5
	.uleb128 0x1b
	.long	.LASF81
	.byte	0xb
	.byte	0x40
	.long	0xa29
	.uleb128 0x1c
	.long	.LASF84
	.long	0x997
	.byte	0
	.uleb128 0x1a
	.long	.LASF85
	.byte	0x1
	.byte	0xb
	.byte	0x37
	.long	0x736
	.uleb128 0x1b
	.long	.LASF78
	.byte	0xb
	.byte	0x3a
	.long	0xa34
	.uleb128 0x1b
	.long	.LASF79
	.byte	0xb
	.byte	0x3b
	.long	0xa34
	.uleb128 0x1b
	.long	.LASF80
	.byte	0xb
	.byte	0x3f
	.long	0x13b5
	.uleb128 0x1b
	.long	.LASF81
	.byte	0xb
	.byte	0x40
	.long	0xa29
	.uleb128 0x1c
	.long	.LASF84
	.long	0x9fe
	.byte	0
	.uleb128 0x1a
	.long	.LASF86
	.byte	0x1
	.byte	0xb
	.byte	0x37
	.long	0x778
	.uleb128 0x1b
	.long	.LASF78
	.byte	0xb
	.byte	0x3a
	.long	0x1444
	.uleb128 0x1b
	.long	.LASF79
	.byte	0xb
	.byte	0x3b
	.long	0x1444
	.uleb128 0x1b
	.long	.LASF80
	.byte	0xb
	.byte	0x3f
	.long	0x13b5
	.uleb128 0x1b
	.long	.LASF81
	.byte	0xb
	.byte	0x40
	.long	0xa29
	.uleb128 0x1c
	.long	.LASF84
	.long	0x1200
	.byte	0
	.uleb128 0x1d
	.long	.LASF298
	.byte	0x1
	.byte	0xb
	.byte	0x37
	.uleb128 0x1b
	.long	.LASF78
	.byte	0xb
	.byte	0x3a
	.long	0x1449
	.uleb128 0x1b
	.long	.LASF79
	.byte	0xb
	.byte	0x3b
	.long	0x1449
	.uleb128 0x1b
	.long	.LASF80
	.byte	0xb
	.byte	0x3f
	.long	0x13b5
	.uleb128 0x1b
	.long	.LASF81
	.byte	0xb
	.byte	0x40
	.long	0xa29
	.uleb128 0x1c
	.long	.LASF84
	.long	0xfda
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF87
	.byte	0xd8
	.byte	0xc
	.byte	0xf1
	.long	0x934
	.uleb128 0x1e
	.long	.LASF88
	.byte	0xc
	.byte	0xf2
	.long	0xa05
	.byte	0
	.uleb128 0x1e
	.long	.LASF89
	.byte	0xc
	.byte	0xf7
	.long	0xd4f
	.byte	0x8
	.uleb128 0x1e
	.long	.LASF90
	.byte	0xc
	.byte	0xf8
	.long	0xd4f
	.byte	0x10
	.uleb128 0x1e
	.long	.LASF91
	.byte	0xc
	.byte	0xf9
	.long	0xd4f
	.byte	0x18
	.uleb128 0x1e
	.long	.LASF92
	.byte	0xc
	.byte	0xfa
	.long	0xd4f
	.byte	0x20
	.uleb128 0x1e
	.long	.LASF93
	.byte	0xc
	.byte	0xfb
	.long	0xd4f
	.byte	0x28
	.uleb128 0x1e
	.long	.LASF94
	.byte	0xc
	.byte	0xfc
	.long	0xd4f
	.byte	0x30
	.uleb128 0x1e
	.long	.LASF95
	.byte	0xc
	.byte	0xfd
	.long	0xd4f
	.byte	0x38
	.uleb128 0x1e
	.long	.LASF96
	.byte	0xc
	.byte	0xfe
	.long	0xd4f
	.byte	0x40
	.uleb128 0x1f
	.long	.LASF97
	.byte	0xc
	.value	0x100
	.long	0xd4f
	.byte	0x48
	.uleb128 0x1f
	.long	.LASF98
	.byte	0xc
	.value	0x101
	.long	0xd4f
	.byte	0x50
	.uleb128 0x1f
	.long	.LASF99
	.byte	0xc
	.value	0x102
	.long	0xd4f
	.byte	0x58
	.uleb128 0x1f
	.long	.LASF100
	.byte	0xc
	.value	0x104
	.long	0x1486
	.byte	0x60
	.uleb128 0x1f
	.long	.LASF101
	.byte	0xc
	.value	0x106
	.long	0x148c
	.byte	0x68
	.uleb128 0x1f
	.long	.LASF102
	.byte	0xc
	.value	0x108
	.long	0xa05
	.byte	0x70
	.uleb128 0x1f
	.long	.LASF103
	.byte	0xc
	.value	0x10c
	.long	0xa05
	.byte	0x74
	.uleb128 0x1f
	.long	.LASF104
	.byte	0xc
	.value	0x10e
	.long	0x1384
	.byte	0x78
	.uleb128 0x1f
	.long	.LASF105
	.byte	0xc
	.value	0x112
	.long	0xa22
	.byte	0x80
	.uleb128 0x1f
	.long	.LASF106
	.byte	0xc
	.value	0x113
	.long	0x11f9
	.byte	0x82
	.uleb128 0x1f
	.long	.LASF107
	.byte	0xc
	.value	0x114
	.long	0x1492
	.byte	0x83
	.uleb128 0x1f
	.long	.LASF108
	.byte	0xc
	.value	0x118
	.long	0x14a2
	.byte	0x88
	.uleb128 0x1f
	.long	.LASF109
	.byte	0xc
	.value	0x121
	.long	0x138f
	.byte	0x90
	.uleb128 0x1f
	.long	.LASF110
	.byte	0xc
	.value	0x129
	.long	0x98a
	.byte	0x98
	.uleb128 0x1f
	.long	.LASF111
	.byte	0xc
	.value	0x12a
	.long	0x98a
	.byte	0xa0
	.uleb128 0x1f
	.long	.LASF112
	.byte	0xc
	.value	0x12b
	.long	0x98a
	.byte	0xa8
	.uleb128 0x1f
	.long	.LASF113
	.byte	0xc
	.value	0x12c
	.long	0x98a
	.byte	0xb0
	.uleb128 0x1f
	.long	.LASF114
	.byte	0xc
	.value	0x12e
	.long	0x98c
	.byte	0xb8
	.uleb128 0x1f
	.long	.LASF115
	.byte	0xc
	.value	0x12f
	.long	0xa05
	.byte	0xc0
	.uleb128 0x1f
	.long	.LASF116
	.byte	0xc
	.value	0x131
	.long	0x14a8
	.byte	0xc4
	.byte	0
	.uleb128 0x7
	.long	.LASF117
	.byte	0xd
	.byte	0x40
	.long	0x7b7
	.uleb128 0x20
	.byte	0x8
	.byte	0x7
	.long	.LASF123
	.uleb128 0x1a
	.long	.LASF118
	.byte	0x18
	.byte	0xe
	.byte	0
	.long	0x983
	.uleb128 0x1e
	.long	.LASF119
	.byte	0xe
	.byte	0
	.long	0x983
	.byte	0
	.uleb128 0x1e
	.long	.LASF120
	.byte	0xe
	.byte	0
	.long	0x983
	.byte	0x4
	.uleb128 0x1e
	.long	.LASF121
	.byte	0xe
	.byte	0
	.long	0x98a
	.byte	0x8
	.uleb128 0x1e
	.long	.LASF122
	.byte	0xe
	.byte	0
	.long	0x98a
	.byte	0x10
	.byte	0
	.uleb128 0x20
	.byte	0x4
	.byte	0x7
	.long	.LASF124
	.uleb128 0x21
	.byte	0x8
	.uleb128 0x7
	.long	.LASF2
	.byte	0xf
	.byte	0xd8
	.long	0x997
	.uleb128 0x20
	.byte	0x8
	.byte	0x7
	.long	.LASF125
	.uleb128 0x22
	.long	.LASF126
	.byte	0xf
	.value	0x165
	.long	0x983
	.uleb128 0x23
	.byte	0x8
	.byte	0x10
	.byte	0x53
	.long	.LASF299
	.long	0x9ee
	.uleb128 0x24
	.byte	0x4
	.byte	0x10
	.byte	0x56
	.long	0x9d5
	.uleb128 0x25
	.long	.LASF127
	.byte	0x10
	.byte	0x58
	.long	0x983
	.uleb128 0x25
	.long	.LASF128
	.byte	0x10
	.byte	0x5c
	.long	0x9ee
	.byte	0
	.uleb128 0x1e
	.long	.LASF129
	.byte	0x10
	.byte	0x54
	.long	0xa05
	.byte	0
	.uleb128 0x1e
	.long	.LASF130
	.byte	0x10
	.byte	0x5d
	.long	0x9b6
	.byte	0x4
	.byte	0
	.uleb128 0x26
	.long	0x9fe
	.long	0x9fe
	.uleb128 0x27
	.long	0x93f
	.byte	0x3
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.byte	0x6
	.long	.LASF131
	.uleb128 0x28
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x7
	.long	.LASF132
	.byte	0x10
	.byte	0x5e
	.long	0x9aa
	.uleb128 0x7
	.long	.LASF133
	.byte	0x10
	.byte	0x6a
	.long	0xa0c
	.uleb128 0x20
	.byte	0x2
	.byte	0x7
	.long	.LASF134
	.uleb128 0x15
	.long	0xa05
	.uleb128 0x29
	.byte	0x8
	.long	0xa34
	.uleb128 0x15
	.long	0x9fe
	.uleb128 0x2a
	.long	.LASF135
	.byte	0x10
	.value	0x164
	.long	0x99e
	.long	0xa4f
	.uleb128 0x2b
	.long	0xa05
	.byte	0
	.uleb128 0x2a
	.long	.LASF136
	.byte	0x10
	.value	0x2ec
	.long	0x99e
	.long	0xa65
	.uleb128 0x2b
	.long	0xa65
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0x934
	.uleb128 0x2a
	.long	.LASF137
	.byte	0x10
	.value	0x309
	.long	0xa8b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xa05
	.uleb128 0x2b
	.long	0xa65
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0xa91
	.uleb128 0x20
	.byte	0x4
	.byte	0x5
	.long	.LASF138
	.uleb128 0x2a
	.long	.LASF139
	.byte	0x10
	.value	0x2fa
	.long	0x99e
	.long	0xab3
	.uleb128 0x2b
	.long	0xa91
	.uleb128 0x2b
	.long	0xa65
	.byte	0
	.uleb128 0x2a
	.long	.LASF140
	.byte	0x10
	.value	0x310
	.long	0xa05
	.long	0xace
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xa65
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0xad4
	.uleb128 0x15
	.long	0xa91
	.uleb128 0x2a
	.long	.LASF141
	.byte	0x10
	.value	0x24e
	.long	0xa05
	.long	0xaf4
	.uleb128 0x2b
	.long	0xa65
	.uleb128 0x2b
	.long	0xa05
	.byte	0
	.uleb128 0x2a
	.long	.LASF142
	.byte	0x10
	.value	0x255
	.long	0xa05
	.long	0xb10
	.uleb128 0x2b
	.long	0xa65
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2c
	.byte	0
	.uleb128 0x2a
	.long	.LASF143
	.byte	0x10
	.value	0x27e
	.long	0xa05
	.long	0xb2c
	.uleb128 0x2b
	.long	0xa65
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2c
	.byte	0
	.uleb128 0x2a
	.long	.LASF144
	.byte	0x10
	.value	0x2ed
	.long	0x99e
	.long	0xb42
	.uleb128 0x2b
	.long	0xa65
	.byte	0
	.uleb128 0x2d
	.long	.LASF244
	.byte	0x10
	.value	0x2f3
	.long	0x99e
	.uleb128 0x2a
	.long	.LASF145
	.byte	0x10
	.value	0x17b
	.long	0x98c
	.long	0xb6e
	.uleb128 0x2b
	.long	0xa2e
	.uleb128 0x2b
	.long	0x98c
	.uleb128 0x2b
	.long	0xb6e
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0xa17
	.uleb128 0x2a
	.long	.LASF146
	.byte	0x10
	.value	0x170
	.long	0x98c
	.long	0xb99
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xa2e
	.uleb128 0x2b
	.long	0x98c
	.uleb128 0x2b
	.long	0xb6e
	.byte	0
	.uleb128 0x2a
	.long	.LASF147
	.byte	0x10
	.value	0x16c
	.long	0xa05
	.long	0xbaf
	.uleb128 0x2b
	.long	0xbaf
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0xbb5
	.uleb128 0x15
	.long	0xa17
	.uleb128 0x2a
	.long	.LASF148
	.byte	0x10
	.value	0x19b
	.long	0x98c
	.long	0xbdf
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xbdf
	.uleb128 0x2b
	.long	0x98c
	.uleb128 0x2b
	.long	0xb6e
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0xa2e
	.uleb128 0x2a
	.long	.LASF149
	.byte	0x10
	.value	0x2fb
	.long	0x99e
	.long	0xc00
	.uleb128 0x2b
	.long	0xa91
	.uleb128 0x2b
	.long	0xa65
	.byte	0
	.uleb128 0x2a
	.long	.LASF150
	.byte	0x10
	.value	0x301
	.long	0x99e
	.long	0xc16
	.uleb128 0x2b
	.long	0xa91
	.byte	0
	.uleb128 0x2a
	.long	.LASF151
	.byte	0x10
	.value	0x25f
	.long	0xa05
	.long	0xc37
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0x98c
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2c
	.byte	0
	.uleb128 0x2a
	.long	.LASF152
	.byte	0x10
	.value	0x288
	.long	0xa05
	.long	0xc53
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2c
	.byte	0
	.uleb128 0x2a
	.long	.LASF153
	.byte	0x10
	.value	0x318
	.long	0x99e
	.long	0xc6e
	.uleb128 0x2b
	.long	0x99e
	.uleb128 0x2b
	.long	0xa65
	.byte	0
	.uleb128 0x2a
	.long	.LASF154
	.byte	0x10
	.value	0x267
	.long	0xa05
	.long	0xc8e
	.uleb128 0x2b
	.long	0xa65
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xc8e
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0x946
	.uleb128 0x2a
	.long	.LASF155
	.byte	0x10
	.value	0x2b4
	.long	0xa05
	.long	0xcb4
	.uleb128 0x2b
	.long	0xa65
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xc8e
	.byte	0
	.uleb128 0x2a
	.long	.LASF156
	.byte	0x10
	.value	0x274
	.long	0xa05
	.long	0xcd9
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0x98c
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xc8e
	.byte	0
	.uleb128 0x2a
	.long	.LASF157
	.byte	0x10
	.value	0x2c0
	.long	0xa05
	.long	0xcf9
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xc8e
	.byte	0
	.uleb128 0x2a
	.long	.LASF158
	.byte	0x10
	.value	0x26f
	.long	0xa05
	.long	0xd14
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xc8e
	.byte	0
	.uleb128 0x2a
	.long	.LASF159
	.byte	0x10
	.value	0x2bc
	.long	0xa05
	.long	0xd2f
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xc8e
	.byte	0
	.uleb128 0x2a
	.long	.LASF160
	.byte	0x10
	.value	0x175
	.long	0x98c
	.long	0xd4f
	.uleb128 0x2b
	.long	0xd4f
	.uleb128 0x2b
	.long	0xa91
	.uleb128 0x2b
	.long	0xb6e
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0x9fe
	.uleb128 0x2e
	.long	.LASF161
	.byte	0x10
	.byte	0x9d
	.long	0xa8b
	.long	0xd6f
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xace
	.byte	0
	.uleb128 0x2e
	.long	.LASF162
	.byte	0x10
	.byte	0xa6
	.long	0xa05
	.long	0xd89
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xace
	.byte	0
	.uleb128 0x2e
	.long	.LASF163
	.byte	0x10
	.byte	0xc3
	.long	0xa05
	.long	0xda3
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xace
	.byte	0
	.uleb128 0x2e
	.long	.LASF164
	.byte	0x10
	.byte	0x93
	.long	0xa8b
	.long	0xdbd
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xace
	.byte	0
	.uleb128 0x2e
	.long	.LASF165
	.byte	0x10
	.byte	0xff
	.long	0x98c
	.long	0xdd7
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xace
	.byte	0
	.uleb128 0x2a
	.long	.LASF166
	.byte	0x10
	.value	0x35a
	.long	0x98c
	.long	0xdfc
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0x98c
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xdfc
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0xe92
	.uleb128 0x2f
	.string	"tm"
	.byte	0x38
	.byte	0x11
	.byte	0x85
	.long	0xe92
	.uleb128 0x1e
	.long	.LASF167
	.byte	0x11
	.byte	0x87
	.long	0xa05
	.byte	0
	.uleb128 0x1e
	.long	.LASF168
	.byte	0x11
	.byte	0x88
	.long	0xa05
	.byte	0x4
	.uleb128 0x1e
	.long	.LASF169
	.byte	0x11
	.byte	0x89
	.long	0xa05
	.byte	0x8
	.uleb128 0x1e
	.long	.LASF170
	.byte	0x11
	.byte	0x8a
	.long	0xa05
	.byte	0xc
	.uleb128 0x1e
	.long	.LASF171
	.byte	0x11
	.byte	0x8b
	.long	0xa05
	.byte	0x10
	.uleb128 0x1e
	.long	.LASF172
	.byte	0x11
	.byte	0x8c
	.long	0xa05
	.byte	0x14
	.uleb128 0x1e
	.long	.LASF173
	.byte	0x11
	.byte	0x8d
	.long	0xa05
	.byte	0x18
	.uleb128 0x1e
	.long	.LASF174
	.byte	0x11
	.byte	0x8e
	.long	0xa05
	.byte	0x1c
	.uleb128 0x1e
	.long	.LASF175
	.byte	0x11
	.byte	0x8f
	.long	0xa05
	.byte	0x20
	.uleb128 0x1e
	.long	.LASF176
	.byte	0x11
	.byte	0x92
	.long	0xfda
	.byte	0x28
	.uleb128 0x1e
	.long	.LASF177
	.byte	0x11
	.byte	0x93
	.long	0xa2e
	.byte	0x30
	.byte	0
	.uleb128 0x15
	.long	0xe02
	.uleb128 0x2a
	.long	.LASF178
	.byte	0x10
	.value	0x122
	.long	0x98c
	.long	0xead
	.uleb128 0x2b
	.long	0xace
	.byte	0
	.uleb128 0x2e
	.long	.LASF179
	.byte	0x10
	.byte	0xa1
	.long	0xa8b
	.long	0xecc
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0x98c
	.byte	0
	.uleb128 0x2e
	.long	.LASF180
	.byte	0x10
	.byte	0xa9
	.long	0xa05
	.long	0xeeb
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0x98c
	.byte	0
	.uleb128 0x2e
	.long	.LASF181
	.byte	0x10
	.byte	0x98
	.long	0xa8b
	.long	0xf0a
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0x98c
	.byte	0
	.uleb128 0x2a
	.long	.LASF182
	.byte	0x10
	.value	0x1a1
	.long	0x98c
	.long	0xf2f
	.uleb128 0x2b
	.long	0xd4f
	.uleb128 0x2b
	.long	0xf2f
	.uleb128 0x2b
	.long	0x98c
	.uleb128 0x2b
	.long	0xb6e
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0xace
	.uleb128 0x2a
	.long	.LASF183
	.byte	0x10
	.value	0x103
	.long	0x98c
	.long	0xf50
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xace
	.byte	0
	.uleb128 0x2a
	.long	.LASF184
	.byte	0x10
	.value	0x1c5
	.long	0xf6b
	.long	0xf6b
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xf72
	.byte	0
	.uleb128 0x20
	.byte	0x8
	.byte	0x4
	.long	.LASF185
	.uleb128 0x29
	.byte	0x8
	.long	0xa8b
	.uleb128 0x2a
	.long	.LASF186
	.byte	0x10
	.value	0x1cc
	.long	0xf93
	.long	0xf93
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xf72
	.byte	0
	.uleb128 0x20
	.byte	0x4
	.byte	0x4
	.long	.LASF187
	.uleb128 0x2a
	.long	.LASF188
	.byte	0x10
	.value	0x11d
	.long	0xa8b
	.long	0xfba
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xf72
	.byte	0
	.uleb128 0x2a
	.long	.LASF189
	.byte	0x10
	.value	0x1d7
	.long	0xfda
	.long	0xfda
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xf72
	.uleb128 0x2b
	.long	0xa05
	.byte	0
	.uleb128 0x20
	.byte	0x8
	.byte	0x5
	.long	.LASF190
	.uleb128 0x2a
	.long	.LASF191
	.byte	0x10
	.value	0x1dc
	.long	0x997
	.long	0x1001
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xf72
	.uleb128 0x2b
	.long	0xa05
	.byte	0
	.uleb128 0x2e
	.long	.LASF192
	.byte	0x10
	.byte	0xc7
	.long	0x98c
	.long	0x1020
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0x98c
	.byte	0
	.uleb128 0x2a
	.long	.LASF193
	.byte	0x10
	.value	0x168
	.long	0xa05
	.long	0x1036
	.uleb128 0x2b
	.long	0x99e
	.byte	0
	.uleb128 0x2a
	.long	.LASF194
	.byte	0x10
	.value	0x148
	.long	0xa05
	.long	0x1056
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0x98c
	.byte	0
	.uleb128 0x2a
	.long	.LASF195
	.byte	0x10
	.value	0x14c
	.long	0xa8b
	.long	0x1076
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0x98c
	.byte	0
	.uleb128 0x2a
	.long	.LASF196
	.byte	0x10
	.value	0x151
	.long	0xa8b
	.long	0x1096
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0x98c
	.byte	0
	.uleb128 0x2a
	.long	.LASF197
	.byte	0x10
	.value	0x155
	.long	0xa8b
	.long	0x10b6
	.uleb128 0x2b
	.long	0xa8b
	.uleb128 0x2b
	.long	0xa91
	.uleb128 0x2b
	.long	0x98c
	.byte	0
	.uleb128 0x2a
	.long	.LASF198
	.byte	0x10
	.value	0x25c
	.long	0xa05
	.long	0x10cd
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2c
	.byte	0
	.uleb128 0x2a
	.long	.LASF199
	.byte	0x10
	.value	0x285
	.long	0xa05
	.long	0x10e4
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2c
	.byte	0
	.uleb128 0x30
	.long	.LASF201
	.byte	0x10
	.byte	0xe3
	.long	.LASF201
	.long	0xace
	.long	0x1102
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xa91
	.byte	0
	.uleb128 0x31
	.long	.LASF202
	.byte	0x10
	.value	0x109
	.long	.LASF202
	.long	0xace
	.long	0x1121
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xace
	.byte	0
	.uleb128 0x30
	.long	.LASF204
	.byte	0x10
	.byte	0xed
	.long	.LASF204
	.long	0xace
	.long	0x113f
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xa91
	.byte	0
	.uleb128 0x31
	.long	.LASF205
	.byte	0x10
	.value	0x114
	.long	.LASF205
	.long	0xace
	.long	0x115e
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xace
	.byte	0
	.uleb128 0x31
	.long	.LASF206
	.byte	0x10
	.value	0x13f
	.long	.LASF206
	.long	0xace
	.long	0x1182
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xa91
	.uleb128 0x2b
	.long	0x98c
	.byte	0
	.uleb128 0x2a
	.long	.LASF207
	.byte	0x10
	.value	0x1ce
	.long	0x119d
	.long	0x119d
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xf72
	.byte	0
	.uleb128 0x20
	.byte	0x10
	.byte	0x4
	.long	.LASF208
	.uleb128 0x2a
	.long	.LASF209
	.byte	0x10
	.value	0x1e6
	.long	0x11c4
	.long	0x11c4
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xf72
	.uleb128 0x2b
	.long	0xa05
	.byte	0
	.uleb128 0x20
	.byte	0x8
	.byte	0x5
	.long	.LASF210
	.uleb128 0x2a
	.long	.LASF211
	.byte	0x10
	.value	0x1ed
	.long	0x11eb
	.long	0x11eb
	.uleb128 0x2b
	.long	0xace
	.uleb128 0x2b
	.long	0xf72
	.uleb128 0x2b
	.long	0xa05
	.byte	0
	.uleb128 0x20
	.byte	0x8
	.byte	0x7
	.long	.LASF212
	.uleb128 0x20
	.byte	0x1
	.byte	0x8
	.long	.LASF213
	.uleb128 0x20
	.byte	0x1
	.byte	0x6
	.long	.LASF214
	.uleb128 0x20
	.byte	0x2
	.byte	0x5
	.long	.LASF215
	.uleb128 0x19
	.long	.LASF216
	.byte	0x5
	.byte	0x37
	.long	0x121a
	.uleb128 0x4
	.byte	0x5
	.byte	0x38
	.long	0x1f0
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.byte	0x2
	.long	.LASF217
	.uleb128 0x1a
	.long	.LASF218
	.byte	0x60
	.byte	0x12
	.byte	0x35
	.long	0x134e
	.uleb128 0x1e
	.long	.LASF219
	.byte	0x12
	.byte	0x39
	.long	0xd4f
	.byte	0
	.uleb128 0x1e
	.long	.LASF220
	.byte	0x12
	.byte	0x3a
	.long	0xd4f
	.byte	0x8
	.uleb128 0x1e
	.long	.LASF221
	.byte	0x12
	.byte	0x40
	.long	0xd4f
	.byte	0x10
	.uleb128 0x1e
	.long	.LASF222
	.byte	0x12
	.byte	0x46
	.long	0xd4f
	.byte	0x18
	.uleb128 0x1e
	.long	.LASF223
	.byte	0x12
	.byte	0x47
	.long	0xd4f
	.byte	0x20
	.uleb128 0x1e
	.long	.LASF224
	.byte	0x12
	.byte	0x48
	.long	0xd4f
	.byte	0x28
	.uleb128 0x1e
	.long	.LASF225
	.byte	0x12
	.byte	0x49
	.long	0xd4f
	.byte	0x30
	.uleb128 0x1e
	.long	.LASF226
	.byte	0x12
	.byte	0x4a
	.long	0xd4f
	.byte	0x38
	.uleb128 0x1e
	.long	.LASF227
	.byte	0x12
	.byte	0x4b
	.long	0xd4f
	.byte	0x40
	.uleb128 0x1e
	.long	.LASF228
	.byte	0x12
	.byte	0x4c
	.long	0xd4f
	.byte	0x48
	.uleb128 0x1e
	.long	.LASF229
	.byte	0x12
	.byte	0x4d
	.long	0x9fe
	.byte	0x50
	.uleb128 0x1e
	.long	.LASF230
	.byte	0x12
	.byte	0x4e
	.long	0x9fe
	.byte	0x51
	.uleb128 0x1e
	.long	.LASF231
	.byte	0x12
	.byte	0x50
	.long	0x9fe
	.byte	0x52
	.uleb128 0x1e
	.long	.LASF232
	.byte	0x12
	.byte	0x52
	.long	0x9fe
	.byte	0x53
	.uleb128 0x1e
	.long	.LASF233
	.byte	0x12
	.byte	0x54
	.long	0x9fe
	.byte	0x54
	.uleb128 0x1e
	.long	.LASF234
	.byte	0x12
	.byte	0x56
	.long	0x9fe
	.byte	0x55
	.uleb128 0x1e
	.long	.LASF235
	.byte	0x12
	.byte	0x5d
	.long	0x9fe
	.byte	0x56
	.uleb128 0x1e
	.long	.LASF236
	.byte	0x12
	.byte	0x5e
	.long	0x9fe
	.byte	0x57
	.uleb128 0x1e
	.long	.LASF237
	.byte	0x12
	.byte	0x61
	.long	0x9fe
	.byte	0x58
	.uleb128 0x1e
	.long	.LASF238
	.byte	0x12
	.byte	0x63
	.long	0x9fe
	.byte	0x59
	.uleb128 0x1e
	.long	.LASF239
	.byte	0x12
	.byte	0x65
	.long	0x9fe
	.byte	0x5a
	.uleb128 0x1e
	.long	.LASF240
	.byte	0x12
	.byte	0x67
	.long	0x9fe
	.byte	0x5b
	.uleb128 0x1e
	.long	.LASF241
	.byte	0x12
	.byte	0x6e
	.long	0x9fe
	.byte	0x5c
	.uleb128 0x1e
	.long	.LASF242
	.byte	0x12
	.byte	0x6f
	.long	0x9fe
	.byte	0x5d
	.byte	0
	.uleb128 0x2e
	.long	.LASF243
	.byte	0x12
	.byte	0x7c
	.long	0xd4f
	.long	0x1368
	.uleb128 0x2b
	.long	0xa05
	.uleb128 0x2b
	.long	0xa2e
	.byte	0
	.uleb128 0x32
	.long	.LASF245
	.byte	0x12
	.byte	0x7f
	.long	0x1373
	.uleb128 0x29
	.byte	0x8
	.long	0x1221
	.uleb128 0x7
	.long	.LASF246
	.byte	0x13
	.byte	0x28
	.long	0xa05
	.uleb128 0x7
	.long	.LASF247
	.byte	0x13
	.byte	0x83
	.long	0xfda
	.uleb128 0x7
	.long	.LASF248
	.byte	0x13
	.byte	0x84
	.long	0xfda
	.uleb128 0x26
	.long	0x9fe
	.long	0x13aa
	.uleb128 0x27
	.long	0x93f
	.byte	0x1f
	.byte	0
	.uleb128 0x7
	.long	.LASF249
	.byte	0x14
	.byte	0x20
	.long	0xa05
	.uleb128 0x15
	.long	0x121a
	.uleb128 0x15
	.long	0x997
	.uleb128 0x29
	.byte	0x8
	.long	0x38e
	.uleb128 0x7
	.long	.LASF250
	.byte	0x15
	.byte	0x34
	.long	0x997
	.uleb128 0x7
	.long	.LASF251
	.byte	0x15
	.byte	0xba
	.long	0x13db
	.uleb128 0x29
	.byte	0x8
	.long	0x13e1
	.uleb128 0x15
	.long	0x1379
	.uleb128 0x2e
	.long	.LASF252
	.byte	0x15
	.byte	0xaf
	.long	0xa05
	.long	0x1400
	.uleb128 0x2b
	.long	0x99e
	.uleb128 0x2b
	.long	0x13c5
	.byte	0
	.uleb128 0x2e
	.long	.LASF253
	.byte	0x15
	.byte	0xdd
	.long	0x99e
	.long	0x141a
	.uleb128 0x2b
	.long	0x99e
	.uleb128 0x2b
	.long	0x13d0
	.byte	0
	.uleb128 0x2e
	.long	.LASF254
	.byte	0x15
	.byte	0xda
	.long	0x13d0
	.long	0x142f
	.uleb128 0x2b
	.long	0xa2e
	.byte	0
	.uleb128 0x2e
	.long	.LASF255
	.byte	0x15
	.byte	0xab
	.long	0x13c5
	.long	0x1444
	.uleb128 0x2b
	.long	0xa2e
	.byte	0
	.uleb128 0x15
	.long	0x1200
	.uleb128 0x15
	.long	0xfda
	.uleb128 0x33
	.long	.LASF300
	.byte	0xc
	.byte	0x96
	.uleb128 0x1a
	.long	.LASF256
	.byte	0x18
	.byte	0xc
	.byte	0x9c
	.long	0x1486
	.uleb128 0x1e
	.long	.LASF257
	.byte	0xc
	.byte	0x9d
	.long	0x1486
	.byte	0
	.uleb128 0x1e
	.long	.LASF258
	.byte	0xc
	.byte	0x9e
	.long	0x148c
	.byte	0x8
	.uleb128 0x1e
	.long	.LASF259
	.byte	0xc
	.byte	0xa2
	.long	0xa05
	.byte	0x10
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0x1455
	.uleb128 0x29
	.byte	0x8
	.long	0x7b7
	.uleb128 0x26
	.long	0x9fe
	.long	0x14a2
	.uleb128 0x27
	.long	0x93f
	.byte	0
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0x144e
	.uleb128 0x26
	.long	0x9fe
	.long	0x14b8
	.uleb128 0x27
	.long	0x93f
	.byte	0x13
	.byte	0
	.uleb128 0x34
	.long	.LASF264
	.byte	0x28
	.byte	0x1
	.byte	0x1c
	.long	0x1542
	.uleb128 0x1e
	.long	.LASF260
	.byte	0x1
	.byte	0x1e
	.long	0x139a
	.byte	0
	.uleb128 0x1e
	.long	.LASF261
	.byte	0x1
	.byte	0x1f
	.long	0xa05
	.byte	0x20
	.uleb128 0x1e
	.long	.LASF262
	.byte	0x1
	.byte	0x20
	.long	0xa05
	.byte	0x24
	.uleb128 0x35
	.long	.LASF264
	.byte	0x1
	.byte	0x23
	.long	.LASF266
	.byte	0x1
	.long	0x14fc
	.long	0x1511
	.uleb128 0x11
	.long	0x1542
	.uleb128 0x2b
	.long	0xa2e
	.uleb128 0x2b
	.long	0xa05
	.uleb128 0x2b
	.long	0xa05
	.byte	0
	.uleb128 0x35
	.long	.LASF265
	.byte	0x1
	.byte	0x28
	.long	.LASF267
	.byte	0x1
	.long	0x1525
	.long	0x152b
	.uleb128 0x11
	.long	0x1542
	.byte	0
	.uleb128 0x36
	.long	.LASF268
	.byte	0x1
	.byte	0x2c
	.long	.LASF269
	.byte	0x1
	.long	0x153b
	.uleb128 0x11
	.long	0x1542
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.long	0xa2e
	.uleb128 0x39
	.long	.LASF271
	.byte	0x1
	.byte	0x23
	.long	0xa05
	.uleb128 0x39
	.long	.LASF272
	.byte	0x1
	.byte	0x23
	.long	0xa05
	.byte	0
	.uleb128 0x15
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
	.long	0xa05
	.quad	.LFB1026
	.quad	.LFE1026-.LFB1026
	.uleb128 0x1
	.byte	0x9c
	.long	0x168e
	.uleb128 0x3f
	.long	.LASF274
	.byte	0x1
	.byte	0x44
	.long	0xa05
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x3f
	.long	.LASF275
	.byte	0x1
	.byte	0x44
	.long	0xbdf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3f
	.long	.LASF276
	.byte	0x1
	.byte	0x44
	.long	0xbdf
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
	.byte	0xe
	.byte	0
	.long	0x16af
	.uleb128 0x1e
	.long	.LASF280
	.byte	0x1
	.byte	0x49
	.long	0x16be
	.byte	0
	.uleb128 0x1e
	.long	.LASF281
	.byte	0x1
	.byte	0x49
	.long	0xfda
	.byte	0x8
	.byte	0
	.uleb128 0x42
	.long	0x16b8
	.long	0x16be
	.uleb128 0x11
	.long	0x1542
	.byte	0
	.uleb128 0x29
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
	.long	0xa05
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3f
	.long	.LASF283
	.byte	0x1
	.byte	0x4f
	.long	0xa05
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
	.long	0x98a
	.uleb128 0x46
	.long	0x61f
	.uleb128 0x9
	.byte	0x3
	.quad	_ZStL8__ioinit
	.uleb128 0x47
	.long	0x67c
	.long	.LASF285
	.sleb128 -2147483648
	.uleb128 0x48
	.long	0x687
	.long	.LASF286
	.long	0x7fffffff
	.uleb128 0x49
	.long	0x6df
	.long	.LASF287
	.byte	0x40
	.uleb128 0x49
	.long	0x70b
	.long	.LASF288
	.byte	0x7f
	.uleb128 0x47
	.long	0x742
	.long	.LASF289
	.sleb128 -32768
	.uleb128 0x4a
	.long	0x74d
	.long	.LASF290
	.value	0x7fff
	.uleb128 0x47
	.long	0x780
	.long	.LASF291
	.sleb128 -9223372036854775808
	.uleb128 0x4b
	.long	0x78b
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x2f
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x32
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
	.uleb128 0x33
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
.LASF47:
	.string	"_S_end"
.LASF2:
	.string	"size_t"
.LASF123:
	.string	"sizetype"
.LASF169:
	.string	"tm_hour"
.LASF80:
	.string	"__is_signed"
.LASF293:
	.string	"GNU C++ 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF82:
	.string	"__numeric_traits_integer<int>"
.LASF286:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIiE5__maxE"
.LASF51:
	.string	"boolalpha"
.LASF269:
	.string	"_ZN4Book6outputEv"
.LASF99:
	.string	"_IO_save_end"
.LASF56:
	.string	"scientific"
.LASF79:
	.string	"__max"
.LASF165:
	.string	"wcscspn"
.LASF245:
	.string	"localeconv"
.LASF24:
	.string	"_S_ios_fmtflags_min"
.LASF230:
	.string	"frac_digits"
.LASF92:
	.string	"_IO_write_base"
.LASF42:
	.string	"_S_ios_iostate_max"
.LASF108:
	.string	"_lock"
.LASF222:
	.string	"int_curr_symbol"
.LASF71:
	.string	"goodbit"
.LASF201:
	.string	"wcschr"
.LASF4:
	.string	"_S_boolalpha"
.LASF70:
	.string	"failbit"
.LASF90:
	.string	"_IO_read_end"
.LASF97:
	.string	"_IO_save_base"
.LASF146:
	.string	"mbrtowc"
.LASF192:
	.string	"wcsxfrm"
.LASF229:
	.string	"int_frac_digits"
.LASF45:
	.string	"_S_beg"
.LASF163:
	.string	"wcscoll"
.LASF105:
	.string	"_cur_column"
.LASF60:
	.string	"skipws"
.LASF127:
	.string	"__wch"
.LASF62:
	.string	"uppercase"
.LASF20:
	.string	"_S_basefield"
.LASF204:
	.string	"wcsrchr"
.LASF224:
	.string	"mon_decimal_point"
.LASF190:
	.string	"long int"
.LASF175:
	.string	"tm_isdst"
.LASF85:
	.string	"__numeric_traits_integer<char>"
.LASF158:
	.string	"vwprintf"
.LASF26:
	.string	"_Ios_Openmode"
.LASF256:
	.string	"_IO_marker"
.LASF302:
	.string	"main"
.LASF239:
	.string	"int_n_cs_precedes"
.LASF35:
	.string	"_S_ios_openmode_min"
.LASF253:
	.string	"towctrans"
.LASF276:
	.string	"envp"
.LASF133:
	.string	"mbstate_t"
.LASF277:
	.string	"__ioinit"
.LASF38:
	.string	"_S_badbit"
.LASF50:
	.string	"_S_synced_with_stdio"
.LASF84:
	.string	"_Value"
.LASF39:
	.string	"_S_eofbit"
.LASF294:
	.string	"main.cpp"
.LASF174:
	.string	"tm_yday"
.LASF214:
	.string	"signed char"
.LASF87:
	.string	"_IO_FILE"
.LASF130:
	.string	"__value"
.LASF250:
	.string	"wctype_t"
.LASF136:
	.string	"fgetwc"
.LASF244:
	.string	"getwchar"
.LASF137:
	.string	"fgetws"
.LASF11:
	.string	"_S_right"
.LASF213:
	.string	"unsigned char"
.LASF234:
	.string	"n_sep_by_space"
.LASF206:
	.string	"wmemchr"
.LASF37:
	.string	"_S_goodbit"
.LASF290:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIsE5__maxE"
.LASF29:
	.string	"_S_bin"
.LASF162:
	.string	"wcscmp"
.LASF151:
	.string	"swprintf"
.LASF279:
	.string	"input_ptr"
.LASF202:
	.string	"wcspbrk"
.LASF261:
	.string	"price"
.LASF31:
	.string	"_S_out"
.LASF131:
	.string	"char"
.LASF268:
	.string	"output"
.LASF27:
	.string	"_S_app"
.LASF255:
	.string	"wctype"
.LASF72:
	.string	"openmode"
.LASF180:
	.string	"wcsncmp"
.LASF300:
	.string	"_IO_lock_t"
.LASF242:
	.string	"int_n_sign_posn"
.LASF236:
	.string	"n_sign_posn"
.LASF203:
	.string	"_ZNSt8ios_base4InitD4Ev"
.LASF196:
	.string	"wmemmove"
.LASF78:
	.string	"__min"
.LASF135:
	.string	"btowc"
.LASF89:
	.string	"_IO_read_ptr"
.LASF199:
	.string	"wscanf"
.LASF225:
	.string	"mon_thousands_sep"
.LASF153:
	.string	"ungetwc"
.LASF120:
	.string	"fp_offset"
.LASF3:
	.string	"ptrdiff_t"
.LASF285:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIiE5__minE"
.LASF251:
	.string	"wctrans_t"
.LASF145:
	.string	"mbrlen"
.LASF259:
	.string	"_pos"
.LASF228:
	.string	"negative_sign"
.LASF7:
	.string	"_S_hex"
.LASF237:
	.string	"int_p_cs_precedes"
.LASF142:
	.string	"fwprintf"
.LASF43:
	.string	"_S_ios_iostate_min"
.LASF265:
	.string	"input"
.LASF100:
	.string	"_markers"
.LASF211:
	.string	"wcstoull"
.LASF8:
	.string	"_S_internal"
.LASF227:
	.string	"positive_sign"
.LASF170:
	.string	"tm_mday"
.LASF64:
	.string	"basefield"
.LASF164:
	.string	"wcscpy"
.LASF52:
	.string	"fixed"
.LASF156:
	.string	"vswprintf"
.LASF197:
	.string	"wmemset"
.LASF75:
	.string	"seekdir"
.LASF141:
	.string	"fwide"
.LASF54:
	.string	"left"
.LASF167:
	.string	"tm_sec"
.LASF109:
	.string	"_offset"
.LASF181:
	.string	"wcsncpy"
.LASF150:
	.string	"putwchar"
.LASF194:
	.string	"wmemcmp"
.LASF28:
	.string	"_S_ate"
.LASF272:
	.string	"_page"
.LASF6:
	.string	"_S_fixed"
.LASF240:
	.string	"int_n_sep_by_space"
.LASF283:
	.string	"__priority"
.LASF13:
	.string	"_S_showbase"
.LASF30:
	.string	"_S_in"
.LASF103:
	.string	"_flags2"
.LASF301:
	.string	"_ZN4BookC2EPKcii"
.LASF216:
	.string	"__gnu_debug"
.LASF91:
	.string	"_IO_read_base"
.LASF270:
	.string	"_title"
.LASF154:
	.string	"vfwprintf"
.LASF273:
	.string	"this"
.LASF116:
	.string	"_unused2"
.LASF205:
	.string	"wcsstr"
.LASF157:
	.string	"vswscanf"
.LASF232:
	.string	"p_sep_by_space"
.LASF264:
	.string	"Book"
.LASF49:
	.string	"_S_refcount"
.LASF104:
	.string	"_old_offset"
.LASF275:
	.string	"argv"
.LASF32:
	.string	"_S_trunc"
.LASF282:
	.string	"__initialize_p"
.LASF274:
	.string	"arTgc"
.LASF55:
	.string	"right"
.LASF15:
	.string	"_S_showpos"
.LASF132:
	.string	"__mbstate_t"
.LASF280:
	.string	"__pfn"
.LASF195:
	.string	"wmemcpy"
.LASF171:
	.string	"tm_mon"
.LASF5:
	.string	"_S_dec"
.LASF25:
	.string	"_Ios_Fmtflags"
.LASF189:
	.string	"wcstol"
.LASF185:
	.string	"double"
.LASF53:
	.string	"internal"
.LASF94:
	.string	"_IO_write_end"
.LASF266:
	.string	"_ZN4BookC4EPKcii"
.LASF289:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIsE5__minE"
.LASF193:
	.string	"wctob"
.LASF14:
	.string	"_S_showpoint"
.LASF16:
	.string	"_S_skipws"
.LASF119:
	.string	"gp_offset"
.LASF19:
	.string	"_S_adjustfield"
.LASF287:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerImE8__digitsE"
.LASF187:
	.string	"float"
.LASF168:
	.string	"tm_min"
.LASF95:
	.string	"_IO_buf_base"
.LASF9:
	.string	"_S_left"
.LASF271:
	.string	"_price"
.LASF295:
	.string	"/home/iamjy1005/work/lab/practice/c++/src/pointer/src"
.LASF33:
	.string	"_S_ios_openmode_end"
.LASF183:
	.string	"wcsspn"
.LASF235:
	.string	"p_sign_posn"
.LASF124:
	.string	"unsigned int"
.LASF110:
	.string	"__pad1"
.LASF111:
	.string	"__pad2"
.LASF112:
	.string	"__pad3"
.LASF113:
	.string	"__pad4"
.LASF114:
	.string	"__pad5"
.LASF258:
	.string	"_sbuf"
.LASF18:
	.string	"_S_uppercase"
.LASF249:
	.string	"_Atomic_word"
.LASF57:
	.string	"showbase"
.LASF121:
	.string	"overflow_arg_area"
.LASF88:
	.string	"_flags"
.LASF22:
	.string	"_S_ios_fmtflags_end"
.LASF263:
	.string	"Init"
.LASF115:
	.string	"_mode"
.LASF262:
	.string	"page"
.LASF219:
	.string	"decimal_point"
.LASF129:
	.string	"__count"
.LASF76:
	.string	"__gnu_cxx"
.LASF278:
	.string	"book"
.LASF217:
	.string	"bool"
.LASF208:
	.string	"long double"
.LASF149:
	.string	"putwc"
.LASF298:
	.string	"__numeric_traits_integer<long int>"
.LASF59:
	.string	"showpos"
.LASF233:
	.string	"n_cs_precedes"
.LASF21:
	.string	"_S_floatfield"
.LASF10:
	.string	"_S_oct"
.LASF128:
	.string	"__wchb"
.LASF73:
	.string	"binary"
.LASF303:
	.string	"__static_initialization_and_destruction_0"
.LASF212:
	.string	"long long unsigned int"
.LASF122:
	.string	"reg_save_area"
.LASF207:
	.string	"wcstold"
.LASF238:
	.string	"int_p_sep_by_space"
.LASF48:
	.string	"_S_ios_seekdir_end"
.LASF209:
	.string	"wcstoll"
.LASF247:
	.string	"__off_t"
.LASF101:
	.string	"_chain"
.LASF36:
	.string	"_Ios_Iostate"
.LASF125:
	.string	"long unsigned int"
.LASF288:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIcE5__maxE"
.LASF182:
	.string	"wcsrtombs"
.LASF63:
	.string	"adjustfield"
.LASF173:
	.string	"tm_wday"
.LASF17:
	.string	"_S_unitbuf"
.LASF65:
	.string	"floatfield"
.LASF152:
	.string	"swscanf"
.LASF81:
	.string	"__digits"
.LASF184:
	.string	"wcstod"
.LASF186:
	.string	"wcstof"
.LASF188:
	.string	"wcstok"
.LASF0:
	.string	"__cxx11"
.LASF74:
	.string	"trunc"
.LASF117:
	.string	"__FILE"
.LASF58:
	.string	"showpoint"
.LASF98:
	.string	"_IO_backup_base"
.LASF243:
	.string	"setlocale"
.LASF107:
	.string	"_shortbuf"
.LASF143:
	.string	"fwscanf"
.LASF126:
	.string	"wint_t"
.LASF34:
	.string	"_S_ios_openmode_max"
.LASF257:
	.string	"_next"
.LASF296:
	.string	"ios_base"
.LASF248:
	.string	"__off64_t"
.LASF68:
	.string	"badbit"
.LASF254:
	.string	"wctrans"
.LASF220:
	.string	"thousands_sep"
.LASF297:
	.string	"_ZNSt8ios_base4InitC4Ev"
.LASF69:
	.string	"eofbit"
.LASF281:
	.string	"__delta"
.LASF96:
	.string	"_IO_buf_end"
.LASF178:
	.string	"wcslen"
.LASF67:
	.string	"iostate"
.LASF23:
	.string	"_S_ios_fmtflags_max"
.LASF1:
	.string	"__debug"
.LASF176:
	.string	"tm_gmtoff"
.LASF223:
	.string	"currency_symbol"
.LASF260:
	.string	"title"
.LASF215:
	.string	"short int"
.LASF166:
	.string	"wcsftime"
.LASF267:
	.string	"_ZN4Book5inputEv"
.LASF106:
	.string	"_vtable_offset"
.LASF226:
	.string	"mon_grouping"
.LASF46:
	.string	"_S_cur"
.LASF161:
	.string	"wcscat"
.LASF299:
	.string	"11__mbstate_t"
.LASF241:
	.string	"int_p_sign_posn"
.LASF177:
	.string	"tm_zone"
.LASF159:
	.string	"vwscanf"
.LASF41:
	.string	"_S_ios_iostate_end"
.LASF160:
	.string	"wcrtomb"
.LASF218:
	.string	"lconv"
.LASF61:
	.string	"unitbuf"
.LASF179:
	.string	"wcsncat"
.LASF86:
	.string	"__numeric_traits_integer<short int>"
.LASF284:
	.string	"__dso_handle"
.LASF210:
	.string	"long long int"
.LASF139:
	.string	"fputwc"
.LASF102:
	.string	"_fileno"
.LASF140:
	.string	"fputws"
.LASF200:
	.string	"~Init"
.LASF148:
	.string	"mbsrtowcs"
.LASF40:
	.string	"_S_failbit"
.LASF231:
	.string	"p_cs_precedes"
.LASF83:
	.string	"__numeric_traits_integer<long unsigned int>"
.LASF172:
	.string	"tm_year"
.LASF134:
	.string	"short unsigned int"
.LASF77:
	.string	"__ops"
.LASF155:
	.string	"vfwscanf"
.LASF93:
	.string	"_IO_write_ptr"
.LASF44:
	.string	"_Ios_Seekdir"
.LASF66:
	.string	"fmtflags"
.LASF246:
	.string	"__int32_t"
.LASF144:
	.string	"getwc"
.LASF147:
	.string	"mbsinit"
.LASF252:
	.string	"iswctype"
.LASF221:
	.string	"grouping"
.LASF198:
	.string	"wprintf"
.LASF292:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIlE5__maxE"
.LASF291:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIlE5__minE"
.LASF12:
	.string	"_S_scientific"
.LASF138:
	.string	"wchar_t"
.LASF118:
	.string	"typedef __va_list_tag __va_list_tag"
.LASF191:
	.string	"wcstoul"
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
