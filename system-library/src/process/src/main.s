	.file	"main.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"Failed to create pipe..."
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.file 1 "main.c"
	.loc 1 42 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	.loc 1 42 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 43 0
	movq	$0, -48(%rbp)
	movl	$-1, -48(%rbp)
	.loc 1 46 0
	movq	$0, -32(%rbp)
	movw	$0, -24(%rbp)
	.loc 1 48 0
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	pipe
	cmpl	$-1, %eax
	jne	.L2
	.loc 1 50 0
	movl	$.LC0, %edi
	call	error_exit
	.loc 1 51 0
	movl	$1, %edi
	call	exit
.L2:
	.loc 1 54 0
	movl	-48(%rbp), %eax
	movl	%eax, %edi
	call	close
	.loc 1 55 0
	movl	-44(%rbp), %eax
	movl	%eax, %edi
	call	close
	.loc 1 57 0
	movl	$0, %eax
	.loc 1 58 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L4
	call	__stack_chk_fail
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x135
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF15
	.byte	0xc
	.long	.LASF16
	.long	.LASF17
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
	.uleb128 0x4
	.long	0x3b
	.long	0x75
	.uleb128 0x5
	.long	0x75
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x6
	.byte	0x8
	.long	0x82
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x7
	.long	.LASF18
	.byte	0x1
	.byte	0x29
	.long	0x3b
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x126
	.uleb128 0x8
	.long	.LASF12
	.byte	0x1
	.byte	0x29
	.long	0x3b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x8
	.long	.LASF13
	.byte	0x1
	.byte	0x29
	.long	0x126
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x8
	.long	.LASF14
	.byte	0x1
	.byte	0x29
	.long	0x126
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x9
	.string	"fd"
	.byte	0x1
	.byte	0x2b
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xa
	.string	"in"
	.byte	0x1
	.byte	0x2c
	.long	0x3b
	.uleb128 0xa
	.string	"out"
	.byte	0x1
	.byte	0x2c
	.long	0x3b
	.uleb128 0xa
	.string	"n"
	.byte	0x1
	.byte	0x2d
	.long	0x3b
	.uleb128 0x9
	.string	"buf"
	.byte	0x1
	.byte	0x2e
	.long	0x12c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x7c
	.uleb128 0xb
	.long	0x82
	.uleb128 0x5
	.long	0x75
	.byte	0x9
	.byte	0
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
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
.LASF9:
	.string	"long long int"
.LASF5:
	.string	"unsigned int"
.LASF16:
	.string	"main.c"
.LASF14:
	.string	"envp"
.LASF6:
	.string	"long unsigned int"
.LASF11:
	.string	"long long unsigned int"
.LASF3:
	.string	"unsigned char"
.LASF17:
	.string	"/home/iamjy1005/work/lab/practice/system-library/src/process/src"
.LASF8:
	.string	"char"
.LASF2:
	.string	"long int"
.LASF12:
	.string	"argc"
.LASF15:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF4:
	.string	"short unsigned int"
.LASF0:
	.string	"signed char"
.LASF18:
	.string	"main"
.LASF10:
	.string	"long double"
.LASF1:
	.string	"short int"
.LASF7:
	.string	"sizetype"
.LASF13:
	.string	"argv"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
