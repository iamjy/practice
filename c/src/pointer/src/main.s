	.file	"main.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"2 : "
.LC1:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.file 1 "main.c"
	.loc 1 50 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 50 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 51 0
	movl	$-1, -20(%rbp)
	.loc 1 54 0
	movq	$0, -16(%rbp)
	.loc 1 56 0
	movl	$2, %edi
	call	get_func_ptr
	movq	%rax, -16(%rbp)
	.loc 1 58 0
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movl	$0, %edi
	call	*%rax
	.loc 1 61 0
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	.loc 1 62 0
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 64 0
	movl	-20(%rbp), %eax
	cmpl	$2, %eax
	je	.L3
	cmpl	$3, %eax
	je	.L4
	cmpl	$1, %eax
	je	.L5
.LBB2:
	.loc 1 75 0
	jmp	.L6
.L5:
	.loc 1 66 0
	movl	$1, %edx
	movl	$1, %esi
	movl	$func_a, %edi
	movl	$0, %eax
	call	proxy_function
	.loc 1 67 0
	jmp	.L6
.L3:
	.loc 1 69 0
	movl	$2, %edx
	movl	$2, %esi
	movl	$func_b, %edi
	movl	$0, %eax
	call	proxy_function
	.loc 1 70 0
	jmp	.L6
.L4:
	.loc 1 72 0
	movl	$3, %edx
	movl	$3, %esi
	movl	$func_c, %edi
	movl	$0, %eax
	call	proxy_function
	.loc 1 73 0
	nop
.L6:
.LBE2:
	.loc 1 79 0
	movl	$0, %eax
	.loc 1 80 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L8
	call	__stack_chk_fail
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.type	get_func_ptr, @function
get_func_ptr:
.LFB3:
	.loc 1 83 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	.loc 1 84 0
	movl	-4(%rbp), %eax
	cmpl	$2, %eax
	je	.L11
	cmpl	$3, %eax
	je	.L12
	cmpl	$1, %eax
	je	.L13
	.loc 1 92 0
	nop
	.loc 1 95 0
	movl	$0, %eax
	jmp	.L14
.L13:
	.loc 1 86 0
	movl	$func_a, %eax
	jmp	.L14
.L11:
	.loc 1 88 0
	movl	$func_b, %eax
	jmp	.L14
.L12:
	.loc 1 90 0
	movl	$func_c, %eax
.L14:
	.loc 1 96 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	get_func_ptr, .-get_func_ptr
	.globl	proxy_function
	.type	proxy_function, @function
proxy_function:
.LFB4:
	.loc 1 99 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	.loc 1 100 0
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movl	%edx, %edi
	call	*%rax
	.loc 1 101 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	proxy_function, .-proxy_function
	.globl	input_chair
	.type	input_chair, @function
input_chair:
.LFB5:
	.loc 1 104 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 105 0
	movl	$__FUNCTION__.3243, %edi
	call	puts
	.loc 1 106 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	input_chair, .-input_chair
	.globl	output_chair
	.type	output_chair, @function
output_chair:
.LFB6:
	.loc 1 109 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 110 0
	movl	$__FUNCTION__.3247, %edi
	call	puts
	.loc 1 111 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	output_chair, .-output_chair
	.section	.rodata
	.align 8
	.type	__FUNCTION__.3243, @object
	.size	__FUNCTION__.3243, 12
__FUNCTION__.3243:
	.string	"input_chair"
	.align 8
	.type	__FUNCTION__.3247, @object
	.size	__FUNCTION__.3247, 13
__FUNCTION__.3247:
	.string	"output_chair"
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "../include/pointer.h"
	.file 4 "../include/main.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2e9
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF30
	.byte	0xc
	.long	.LASF31
	.long	.LASF32
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
	.uleb128 0x4
	.long	.LASF12
	.byte	0x2
	.byte	0x33
	.long	0x62
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
	.uleb128 0x5
	.byte	0x8
	.long	0x92
	.uleb128 0x6
	.long	0x85
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0x14
	.long	0xa9
	.uleb128 0x5
	.byte	0x8
	.long	0xaf
	.uleb128 0x7
	.long	0xbf
	.uleb128 0x8
	.long	0x3b
	.uleb128 0x8
	.long	0x3b
	.byte	0
	.uleb128 0x4
	.long	.LASF14
	.byte	0x4
	.byte	0x14
	.long	0xca
	.uleb128 0x9
	.long	.LASF33
	.value	0x118
	.byte	0x4
	.byte	0x22
	.long	0x118
	.uleb128 0xa
	.long	.LASF15
	.byte	0x4
	.byte	0x23
	.long	0x145
	.byte	0
	.uleb128 0xb
	.long	.LASF16
	.byte	0x4
	.byte	0x24
	.long	0x57
	.value	0x100
	.uleb128 0xb
	.long	.LASF17
	.byte	0x4
	.byte	0x25
	.long	0x57
	.value	0x104
	.uleb128 0xb
	.long	.LASF18
	.byte	0x4
	.byte	0x27
	.long	0x118
	.value	0x108
	.uleb128 0xb
	.long	.LASF19
	.byte	0x4
	.byte	0x28
	.long	0x13a
	.value	0x110
	.byte	0
	.uleb128 0x4
	.long	.LASF20
	.byte	0x4
	.byte	0x15
	.long	0x123
	.uleb128 0x5
	.byte	0x8
	.long	0x129
	.uleb128 0x7
	.long	0x134
	.uleb128 0x8
	.long	0x134
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0xbf
	.uleb128 0x4
	.long	.LASF21
	.byte	0x4
	.byte	0x16
	.long	0x123
	.uleb128 0xc
	.long	0x85
	.long	0x155
	.uleb128 0xd
	.long	0x7e
	.byte	0xff
	.byte	0
	.uleb128 0xe
	.long	.LASF34
	.byte	0x1
	.byte	0x31
	.long	0x3b
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1cc
	.uleb128 0xf
	.long	.LASF22
	.byte	0x1
	.byte	0x31
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xf
	.long	.LASF23
	.byte	0x1
	.byte	0x31
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x10
	.string	"i"
	.byte	0x1
	.byte	0x33
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.long	.LASF24
	.byte	0x1
	.byte	0x36
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x13
	.long	.LASF25
	.byte	0x1
	.byte	0x42
	.long	0x3b
	.uleb128 0x14
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x8c
	.uleb128 0x15
	.long	.LASF35
	.byte	0x1
	.byte	0x52
	.long	0x9e
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x200
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x52
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x17
	.long	.LASF25
	.byte	0x1
	.byte	0x62
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x244
	.uleb128 0xf
	.long	.LASF24
	.byte	0x1
	.byte	0x62
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x62
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x62
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x17
	.long	.LASF26
	.byte	0x1
	.byte	0x67
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x283
	.uleb128 0xf
	.long	.LASF27
	.byte	0x1
	.byte	0x67
	.long	0x134
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.long	.LASF29
	.long	0x293
	.uleb128 0x9
	.byte	0x3
	.quad	__FUNCTION__.3243
	.byte	0
	.uleb128 0xc
	.long	0x92
	.long	0x293
	.uleb128 0xd
	.long	0x7e
	.byte	0xb
	.byte	0
	.uleb128 0x6
	.long	0x283
	.uleb128 0x17
	.long	.LASF28
	.byte	0x1
	.byte	0x6c
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x2d7
	.uleb128 0xf
	.long	.LASF27
	.byte	0x1
	.byte	0x6c
	.long	0x134
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.long	.LASF29
	.long	0x2e7
	.uleb128 0x9
	.byte	0x3
	.quad	__FUNCTION__.3247
	.byte	0
	.uleb128 0xc
	.long	0x92
	.long	0x2e7
	.uleb128 0xd
	.long	0x7e
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.long	0x2d7
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
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x5
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
.LASF22:
	.string	"arTgc"
.LASF27:
	.string	"pChair"
.LASF17:
	.string	"size"
.LASF26:
	.string	"input_chair"
.LASF18:
	.string	"inchair"
.LASF6:
	.string	"long unsigned int"
.LASF4:
	.string	"short unsigned int"
.LASF3:
	.string	"unsigned char"
.LASF14:
	.string	"CHAIR_T"
.LASF24:
	.string	"func"
.LASF34:
	.string	"main"
.LASF29:
	.string	"__FUNCTION__"
.LASF32:
	.string	"/home/iamjy1005/work/lab/practice/c/src/pointer/src"
.LASF33:
	.string	"_CHAIR"
.LASF30:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF5:
	.string	"unsigned int"
.LASF21:
	.string	"output_chair_t"
.LASF11:
	.string	"long long unsigned int"
.LASF13:
	.string	"func_t"
.LASF9:
	.string	"sizetype"
.LASF19:
	.string	"outchair"
.LASF7:
	.string	"long long int"
.LASF31:
	.string	"main.c"
.LASF10:
	.string	"char"
.LASF20:
	.string	"input_chair_t"
.LASF1:
	.string	"short int"
.LASF23:
	.string	"argv"
.LASF16:
	.string	"price"
.LASF15:
	.string	"model"
.LASF35:
	.string	"get_func_ptr"
.LASF12:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF28:
	.string	"output_chair"
.LASF8:
	.string	"long double"
.LASF0:
	.string	"signed char"
.LASF25:
	.string	"proxy_function"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
