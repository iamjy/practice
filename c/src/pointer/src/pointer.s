	.file	"pointer.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"%s is called!\n"
	.text
	.globl	func_a
	.type	func_a, @function
func_a:
.LFB2:
	.file 1 "pointer.c"
	.loc 1 49 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	.loc 1 50 0
	movl	$__FUNCTION__.3200, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	info_printf
	.loc 1 51 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_a, .-func_a
	.globl	func_b
	.type	func_b, @function
func_b:
.LFB3:
	.loc 1 54 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	.loc 1 55 0
	movl	$__FUNCTION__.3205, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	info_printf
	.loc 1 56 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_b, .-func_b
	.globl	func_c
	.type	func_c, @function
func_c:
.LFB4:
	.loc 1 59 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	.loc 1 60 0
	movl	$__FUNCTION__.3210, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	info_printf
	.loc 1 61 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	func_c, .-func_c
	.section	.rodata
	.type	__FUNCTION__.3200, @object
	.size	__FUNCTION__.3200, 7
__FUNCTION__.3200:
	.string	"func_a"
	.type	__FUNCTION__.3205, @object
	.size	__FUNCTION__.3205, 7
__FUNCTION__.3205:
	.string	"func_b"
	.type	__FUNCTION__.3210, @object
	.size	__FUNCTION__.3210, 7
__FUNCTION__.3210:
	.string	"func_c"
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x184
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF16
	.byte	0xc
	.long	.LASF17
	.long	.LASF18
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
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
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x4
	.long	0x7a
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x5
	.long	.LASF12
	.byte	0x1
	.byte	0x30
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0xd6
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x30
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x6
	.string	"j"
	.byte	0x1
	.byte	0x30
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.long	.LASF14
	.long	0xe6
	.uleb128 0x9
	.byte	0x3
	.quad	__FUNCTION__.3200
	.byte	0
	.uleb128 0x8
	.long	0x81
	.long	0xe6
	.uleb128 0x9
	.long	0x73
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	0xd6
	.uleb128 0x5
	.long	.LASF13
	.byte	0x1
	.byte	0x35
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x134
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x35
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x6
	.string	"j"
	.byte	0x1
	.byte	0x35
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.long	.LASF14
	.long	0x134
	.uleb128 0x9
	.byte	0x3
	.quad	__FUNCTION__.3205
	.byte	0
	.uleb128 0x4
	.long	0xd6
	.uleb128 0x5
	.long	.LASF15
	.byte	0x1
	.byte	0x3a
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x182
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x3a
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x6
	.string	"j"
	.byte	0x1
	.byte	0x3a
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.long	.LASF14
	.long	0x182
	.uleb128 0x9
	.byte	0x3
	.quad	__FUNCTION__.3210
	.byte	0
	.uleb128 0x4
	.long	0xd6
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x34
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
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"long long int"
.LASF5:
	.string	"unsigned int"
.LASF14:
	.string	"__FUNCTION__"
.LASF6:
	.string	"long unsigned int"
.LASF11:
	.string	"long long unsigned int"
.LASF3:
	.string	"unsigned char"
.LASF10:
	.string	"char"
.LASF2:
	.string	"long int"
.LASF12:
	.string	"func_a"
.LASF13:
	.string	"func_b"
.LASF15:
	.string	"func_c"
.LASF18:
	.string	"/home/iamjy1005/work/lab/practice/c/src/pointer/src"
.LASF16:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF4:
	.string	"short unsigned int"
.LASF0:
	.string	"signed char"
.LASF8:
	.string	"long double"
.LASF1:
	.string	"short int"
.LASF9:
	.string	"sizetype"
.LASF17:
	.string	"pointer.c"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
