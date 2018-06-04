	.file	"main.c"
	.text
.Ltext0:
	.section	.rodata
	.align 8
.LC0:
	.string	"Failed to write data to stdout!"
	.text
	.globl	operationError
	.type	operationError, @function
operationError:
.LFB2:
	.file 1 "main.c"
	.loc 1 65 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$496, %rsp
	movq	%rdi, -488(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L2
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L2:
	.loc 1 65 0
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	.loc 1 66 0
	leaq	-448(%rbp), %rdx
	movl	$0, %eax
	movl	$32, %ecx
	movq	%rdx, %rdi
	rep stosq
	.loc 1 69 0
	leaq	-448(%rbp), %rax
	movabsq	$9071324447265349, %rsi
	movq	%rsi, (%rax)
	.loc 1 70 0
	movl	$8, -472(%rbp)
	movl	$48, -468(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -464(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -456(%rbp)
	.loc 1 71 0
	leaq	-448(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	-448(%rbp), %rax
	leaq	(%rax,%rdx), %rcx
	leaq	-472(%rbp), %rdx
	movq	-488(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	vsprintf
	.loc 1 74 0
	leaq	-448(%rbp), %rax
	movq	%rax, %rdi
	call	puts
	cmpl	$-1, %eax
	jne	.L3
	.loc 1 75 0
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
.L3:
	.loc 1 78 0
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE2:
	.size	operationError, .-operationError
	.section	.rodata
.LC1:
	.string	"\354\203\201\355\222\210\353\252\205 : %s\n"
.LC2:
	.string	"\354\203\201\355\222\210\353\262\210\355\230\270 : %s\n"
.LC3:
	.string	"\354\236\254\352\263\240 \354\210\230\353\237\211 : %d\n"
.LC4:
	.string	"\353\247\244\354\236\205 \354\235\274\354\210\230 : %d\n"
	.text
	.globl	dispInventory
	.type	dispInventory, @function
dispInventory:
.LFB3:
	.loc 1 85 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 86 0
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	.loc 1 87 0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	.loc 1 88 0
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	.loc 1 89 0
	movq	-8(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	.loc 1 90 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	dispInventory, .-dispInventory
	.globl	sleep
	.type	sleep, @function
sleep:
.LFB4:
	.loc 1 96 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 97 0
	call	clock
	movq	$0, -16(%rbp)
	.loc 1 98 0
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	.loc 1 100 0
	jmp	.L7
.L8:
	.loc 1 101 0
	call	clock
	movq	$0, -16(%rbp)
.L7:
	.loc 1 100 0
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jl	.L8
	.loc 1 103 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	sleep, .-sleep
	.section	.rodata
.LC5:
	.string	"abcdef"
.LC6:
	.string	"bc"
.LC7:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.loc 1 107 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 108 0
	movq	$.LC5, -16(%rbp)
	.loc 1 109 0
	movq	$.LC6, -8(%rbp)
	.loc 1 110 0
	movl	$0, -20(%rbp)
	.loc 1 112 0
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcspn
	movl	%eax, -20(%rbp)
	.loc 1 113 0
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	.loc 1 115 0
	movl	$0, %eax
	.loc 1 116 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/include/stdio.h"
	.file 4 "/usr/include/time.h"
	.file 5 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x23b
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF29
	.byte	0xc
	.long	.LASF30
	.long	.LASF31
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
	.byte	0x7
	.long	.LASF7
	.uleb128 0x4
	.long	.LASF9
	.byte	0x2
	.byte	0x87
	.long	0x42
	.uleb128 0x5
	.byte	0x8
	.long	0x7d
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x6
	.long	.LASF32
	.byte	0x5
	.byte	0x28
	.uleb128 0x4
	.long	.LASF10
	.byte	0x3
	.byte	0x4f
	.long	0x84
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF11
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF12
	.uleb128 0x4
	.long	.LASF13
	.byte	0x4
	.byte	0x3b
	.long	0x6c
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF14
	.uleb128 0x7
	.long	.LASF33
	.byte	0x18
	.byte	0x1
	.byte	0x1f
	.long	0xf3
	.uleb128 0x8
	.long	.LASF15
	.byte	0x1
	.byte	0x20
	.long	0x77
	.byte	0
	.uleb128 0x8
	.long	.LASF16
	.byte	0x1
	.byte	0x21
	.long	0x77
	.byte	0x8
	.uleb128 0x8
	.long	.LASF17
	.byte	0x1
	.byte	0x22
	.long	0x3b
	.byte	0x10
	.uleb128 0x8
	.long	.LASF18
	.byte	0x1
	.byte	0x23
	.long	0x3b
	.byte	0x14
	.byte	0
	.uleb128 0x4
	.long	.LASF19
	.byte	0x1
	.byte	0x24
	.long	0xb6
	.uleb128 0x9
	.long	.LASF21
	.byte	0x1
	.byte	0x40
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x149
	.uleb128 0xa
	.string	"fmt"
	.byte	0x1
	.byte	0x40
	.long	0x77
	.uleb128 0x3
	.byte	0x91
	.sleb128 -504
	.uleb128 0xb
	.uleb128 0xc
	.long	.LASF20
	.byte	0x1
	.byte	0x42
	.long	0x149
	.uleb128 0x3
	.byte	0x91
	.sleb128 -464
	.uleb128 0xd
	.string	"ap"
	.byte	0x1
	.byte	0x43
	.long	0x8b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -488
	.byte	0
	.uleb128 0xe
	.long	0x7d
	.long	0x159
	.uleb128 0xf
	.long	0x65
	.byte	0xff
	.byte	0
	.uleb128 0x9
	.long	.LASF22
	.byte	0x1
	.byte	0x55
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x184
	.uleb128 0xa
	.string	"ip"
	.byte	0x1
	.byte	0x55
	.long	0x184
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0xf3
	.uleb128 0x9
	.long	.LASF23
	.byte	0x1
	.byte	0x60
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d0
	.uleb128 0xa
	.string	"cnt"
	.byte	0x1
	.byte	0x60
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xd
	.string	"t"
	.byte	0x1
	.byte	0x61
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.long	.LASF24
	.byte	0x1
	.byte	0x62
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF34
	.byte	0x1
	.byte	0x6a
	.long	0x3b
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x238
	.uleb128 0x11
	.long	.LASF25
	.byte	0x1
	.byte	0x6a
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x11
	.long	.LASF26
	.byte	0x1
	.byte	0x6a
	.long	0x238
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xc
	.long	.LASF27
	.byte	0x1
	.byte	0x6c
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.long	.LASF28
	.byte	0x1
	.byte	0x6d
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.string	"ret"
	.byte	0x1
	.byte	0x6e
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x77
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x7
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
.LASF24:
	.string	"tterm"
.LASF13:
	.string	"clock_t"
.LASF17:
	.string	"volume"
.LASF10:
	.string	"va_list"
.LASF21:
	.string	"operationError"
.LASF18:
	.string	"leadtime"
.LASF6:
	.string	"long unsigned int"
.LASF4:
	.string	"short unsigned int"
.LASF20:
	.string	"buff"
.LASF27:
	.string	"str0"
.LASF28:
	.string	"str1"
.LASF32:
	.string	"__gnuc_va_list"
.LASF34:
	.string	"main"
.LASF29:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF3:
	.string	"unsigned char"
.LASF5:
	.string	"unsigned int"
.LASF14:
	.string	"long long unsigned int"
.LASF15:
	.string	"number"
.LASF25:
	.string	"argc"
.LASF9:
	.string	"__clock_t"
.LASF7:
	.string	"sizetype"
.LASF11:
	.string	"long long int"
.LASF30:
	.string	"main.c"
.LASF16:
	.string	"name"
.LASF1:
	.string	"short int"
.LASF26:
	.string	"argv"
.LASF22:
	.string	"dispInventory"
.LASF2:
	.string	"long int"
.LASF8:
	.string	"char"
.LASF12:
	.string	"long double"
.LASF31:
	.string	"/media/iamjy1005/97b53b95-bba5-4bcc-ab12-5539c6a738ef/work/lab/practice/c/src/function/src"
.LASF0:
	.string	"signed char"
.LASF23:
	.string	"sleep"
.LASF33:
	.string	"inventory"
.LASF19:
	.string	"INVENTORY"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
