	.file	"volatile-1.c"
	.text
.Ltext0:
	.globl	discard1
	.type	discard1, @function
discard1:
.LFB0:
	.file 1 "volatile-1.c"
	.loc 1 2 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 4 0
	movl	$1, -4(%rbp)
	.loc 1 5 0
	movl	$0, -8(%rbp)
	.loc 1 7 0
	movl	$0, -12(%rbp)
	jmp	.L2
.L3:
	.loc 1 8 0 discriminator 3
	movl	-4(%rbp), %eax
	addl	%eax, -8(%rbp)
	.loc 1 7 0 discriminator 3
	addl	$1, -12(%rbp)
.L2:
	.loc 1 7 0 is_stmt 0 discriminator 1
	cmpl	$9, -12(%rbp)
	jle	.L3
	.loc 1 9 0 is_stmt 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	discard1, .-discard1
	.globl	discard2
	.type	discard2, @function
discard2:
.LFB1:
	.loc 1 12 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 14 0
	movl	$1, -12(%rbp)
	.loc 1 15 0
	movl	$0, -4(%rbp)
	.loc 1 17 0
	movl	$0, -8(%rbp)
	jmp	.L5
.L6:
	.loc 1 18 0 discriminator 3
	movl	-12(%rbp), %eax
	addl	%eax, -4(%rbp)
	.loc 1 17 0 discriminator 3
	addl	$1, -8(%rbp)
.L5:
	.loc 1 17 0 is_stmt 0 discriminator 1
	cmpl	$9, -8(%rbp)
	jle	.L6
	.loc 1 19 0 is_stmt 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	discard2, .-discard2
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xc0
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF2
	.byte	0xc
	.long	.LASF3
	.long	.LASF4
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x1
	.byte	0x1
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x72
	.uleb128 0x3
	.string	"i"
	.byte	0x1
	.byte	0x3
	.long	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x3
	.string	"d1"
	.byte	0x1
	.byte	0x4
	.long	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.string	"sum"
	.byte	0x1
	.byte	0x5
	.long	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.long	.LASF1
	.byte	0x1
	.byte	0xb
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0xbe
	.uleb128 0x3
	.string	"i"
	.byte	0x1
	.byte	0xd
	.long	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3
	.string	"d2"
	.byte	0x1
	.byte	0xe
	.long	0xbe
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x3
	.string	"sum"
	.byte	0x1
	.byte	0xf
	.long	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.long	0x72
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x35
	.byte	0
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
.LASF2:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF3:
	.string	"volatile-1.c"
.LASF0:
	.string	"discard1"
.LASF1:
	.string	"discard2"
.LASF4:
	.string	"/home/iamjy1005/work/lab/practice/c/src/keyword/src"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
