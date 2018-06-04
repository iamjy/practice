	.file	"fileIO.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"Failed to open %s file (%d)\n"
.LC2:
	.string	"%s: %s\n"
	.text
	.globl	fopen_read
	.type	fopen_read, @function
fopen_read:
.LFB2:
	.file 1 "fileIO.c"
	.loc 1 61 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 62 0
	movq	$0, -8(%rbp)
	.loc 1 65 0
	movq	-24(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L2
	.loc 1 67 0
	call	__errno_location
	.loc 1 67 0
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	.loc 1 69 0
	movq	stderr(%rip), %rax
	movl	-12(%rbp), %ecx
	movq	-24(%rbp), %rdx
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	.loc 1 70 0
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	strerror
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	movq	%rdx, %rcx
	movl	$__FUNCTION__.3143, %edx
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	.loc 1 72 0
	movl	$0, %eax
	jmp	.L3
.L2:
	.loc 1 75 0
	movq	-8(%rbp), %rax
.L3:
	.loc 1 76 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	fopen_read, .-fopen_read
	.section	.rodata
	.align 8
	.type	__FUNCTION__.3143, @object
	.size	__FUNCTION__.3143, 11
__FUNCTION__.3143:
	.string	"fopen_read"
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/libio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x32f
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF51
	.byte	0xc
	.long	.LASF52
	.long	.LASF53
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
	.long	.LASF7
	.byte	0x2
	.byte	0xd8
	.long	0x5e
	.uleb128 0x4
	.long	.LASF8
	.byte	0x3
	.byte	0x83
	.long	0x42
	.uleb128 0x4
	.long	.LASF9
	.byte	0x3
	.byte	0x84
	.long	0x42
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x4
	.long	.LASF12
	.byte	0x4
	.byte	0x30
	.long	0xa7
	.uleb128 0x7
	.long	.LASF42
	.byte	0xd8
	.byte	0x5
	.byte	0xf1
	.long	0x224
	.uleb128 0x8
	.long	.LASF13
	.byte	0x5
	.byte	0xf2
	.long	0x3b
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x5
	.byte	0xf7
	.long	0x8f
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x5
	.byte	0xf8
	.long	0x8f
	.byte	0x10
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.byte	0xf9
	.long	0x8f
	.byte	0x18
	.uleb128 0x8
	.long	.LASF17
	.byte	0x5
	.byte	0xfa
	.long	0x8f
	.byte	0x20
	.uleb128 0x8
	.long	.LASF18
	.byte	0x5
	.byte	0xfb
	.long	0x8f
	.byte	0x28
	.uleb128 0x8
	.long	.LASF19
	.byte	0x5
	.byte	0xfc
	.long	0x8f
	.byte	0x30
	.uleb128 0x8
	.long	.LASF20
	.byte	0x5
	.byte	0xfd
	.long	0x8f
	.byte	0x38
	.uleb128 0x8
	.long	.LASF21
	.byte	0x5
	.byte	0xfe
	.long	0x8f
	.byte	0x40
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.value	0x100
	.long	0x8f
	.byte	0x48
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.value	0x101
	.long	0x8f
	.byte	0x50
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.value	0x102
	.long	0x8f
	.byte	0x58
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.value	0x104
	.long	0x25c
	.byte	0x60
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.value	0x106
	.long	0x262
	.byte	0x68
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.value	0x108
	.long	0x3b
	.byte	0x70
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x10c
	.long	0x3b
	.byte	0x74
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.value	0x10e
	.long	0x70
	.byte	0x78
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.value	0x112
	.long	0x50
	.byte	0x80
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.value	0x113
	.long	0x2d
	.byte	0x82
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.value	0x114
	.long	0x268
	.byte	0x83
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.value	0x118
	.long	0x278
	.byte	0x88
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.value	0x121
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.value	0x129
	.long	0x8d
	.byte	0x98
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.value	0x12a
	.long	0x8d
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.value	0x12b
	.long	0x8d
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.value	0x12c
	.long	0x8d
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.value	0x12e
	.long	0x65
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.value	0x12f
	.long	0x3b
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x5
	.value	0x131
	.long	0x27e
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF54
	.byte	0x5
	.byte	0x96
	.uleb128 0x7
	.long	.LASF43
	.byte	0x18
	.byte	0x5
	.byte	0x9c
	.long	0x25c
	.uleb128 0x8
	.long	.LASF44
	.byte	0x5
	.byte	0x9d
	.long	0x25c
	.byte	0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x5
	.byte	0x9e
	.long	0x262
	.byte	0x8
	.uleb128 0x8
	.long	.LASF46
	.byte	0x5
	.byte	0xa2
	.long	0x3b
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22b
	.uleb128 0x6
	.byte	0x8
	.long	0xa7
	.uleb128 0xb
	.long	0x95
	.long	0x278
	.uleb128 0xc
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x224
	.uleb128 0xb
	.long	0x95
	.long	0x28e
	.uleb128 0xc
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x294
	.uleb128 0xd
	.long	0x95
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF48
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF49
	.uleb128 0xe
	.long	.LASF55
	.byte	0x1
	.byte	0x3d
	.long	0x30c
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x30c
	.uleb128 0xf
	.long	.LASF56
	.byte	0x1
	.byte	0x3d
	.long	0x28e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.string	"pf"
	.byte	0x1
	.byte	0x3e
	.long	0x30c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF50
	.byte	0x1
	.byte	0x3f
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.long	.LASF57
	.long	0x322
	.uleb128 0x9
	.byte	0x3
	.quad	__FUNCTION__.3143
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0xb
	.long	0x294
	.long	0x322
	.uleb128 0xc
	.long	0x86
	.byte	0xa
	.byte	0
	.uleb128 0xd
	.long	0x312
	.uleb128 0x13
	.long	.LASF58
	.byte	0x4
	.byte	0xaa
	.long	0x262
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
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.string	"__off64_t"
.LASF15:
	.string	"_IO_read_end"
.LASF7:
	.string	"size_t"
.LASF42:
	.string	"_IO_FILE"
.LASF58:
	.string	"stderr"
.LASF17:
	.string	"_IO_write_base"
.LASF21:
	.string	"_IO_buf_end"
.LASF36:
	.string	"__pad2"
.LASF45:
	.string	"_sbuf"
.LASF37:
	.string	"__pad3"
.LASF14:
	.string	"_IO_read_ptr"
.LASF39:
	.string	"__pad5"
.LASF5:
	.string	"unsigned int"
.LASF34:
	.string	"_offset"
.LASF52:
	.string	"fileIO.c"
.LASF40:
	.string	"_mode"
.LASF26:
	.string	"_chain"
.LASF22:
	.string	"_IO_save_base"
.LASF3:
	.string	"unsigned char"
.LASF56:
	.string	"f_name"
.LASF6:
	.string	"long unsigned int"
.LASF4:
	.string	"short unsigned int"
.LASF55:
	.string	"fopen_read"
.LASF24:
	.string	"_IO_save_end"
.LASF54:
	.string	"_IO_lock_t"
.LASF25:
	.string	"_markers"
.LASF46:
	.string	"_pos"
.LASF12:
	.string	"FILE"
.LASF28:
	.string	"_flags2"
.LASF57:
	.string	"__FUNCTION__"
.LASF29:
	.string	"_old_offset"
.LASF33:
	.string	"_lock"
.LASF51:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF43:
	.string	"_IO_marker"
.LASF30:
	.string	"_cur_column"
.LASF49:
	.string	"long long unsigned int"
.LASF27:
	.string	"_fileno"
.LASF20:
	.string	"_IO_buf_base"
.LASF44:
	.string	"_next"
.LASF31:
	.string	"_vtable_offset"
.LASF8:
	.string	"__off_t"
.LASF41:
	.string	"_unused2"
.LASF10:
	.string	"sizetype"
.LASF47:
	.string	"long long int"
.LASF11:
	.string	"char"
.LASF50:
	.string	"errnum"
.LASF19:
	.string	"_IO_write_end"
.LASF1:
	.string	"short int"
.LASF23:
	.string	"_IO_backup_base"
.LASF13:
	.string	"_flags"
.LASF35:
	.string	"__pad1"
.LASF2:
	.string	"long int"
.LASF18:
	.string	"_IO_write_ptr"
.LASF38:
	.string	"__pad4"
.LASF48:
	.string	"long double"
.LASF53:
	.string	"/media/iamjy1005/97b53b95-bba5-4bcc-ab12-5539c6a738ef/work/lab/practice/c/src/function/src"
.LASF0:
	.string	"signed char"
.LASF16:
	.string	"_IO_read_base"
.LASF32:
	.string	"_shortbuf"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
