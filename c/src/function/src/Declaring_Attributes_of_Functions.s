	.file	"Declaring_Attributes_of_Functions.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"%s is called..\n"
	.text
	.globl	__func_noreturn
	.type	__func_noreturn, @function
__func_noreturn:
.LFB2:
	.file 1 "Declaring_Attributes_of_Functions.c"
	.loc 1 8 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 9 0
	movl	$__func__.2887, %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	debug
	.loc 1 10 0
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE2:
	.size	__func_noreturn, .-__func_noreturn
	.weak	f_noreturn
	.set	f_noreturn,__func_noreturn
	.globl	__func_nonnull
	.type	__func_nonnull, @function
__func_nonnull:
.LFB3:
	.loc 1 16 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	.loc 1 17 0
	movl	$__func__.2895, %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	debug
	.loc 1 18 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	__func_nonnull, .-__func_nonnull
	.weak	f_nonnull
	.set	f_nonnull,__func_nonnull
	.globl	__func_visibility
	.hidden	__func_visibility
	.type	__func_visibility, @function
__func_visibility:
.LFB4:
	.loc 1 23 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 24 0
	movl	$__func__.2903, %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	debug
	.loc 1 25 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	__func_visibility, .-__func_visibility
	.weak	f_visibility
	.hidden	f_visibility
	.set	f_visibility,__func_visibility
	.globl	p_func
	.data
	.align 8
	.type	p_func, @object
	.size	p_func, 8
p_func:
	.quad	f_visibility
	.text
	.globl	__func_warn_unused_result
	.type	__func_warn_unused_result, @function
__func_warn_unused_result:
.LFB5:
	.loc 1 31 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 32 0
	movl	$__func__.2911, %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	debug
	.loc 1 33 0
	movl	$0, %eax
	.loc 1 34 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	__func_warn_unused_result, .-__func_warn_unused_result
	.weak	f_warn_unused_result
	.set	f_warn_unused_result,__func_warn_unused_result
	.globl	__func_weakref
	.type	__func_weakref, @function
__func_weakref:
.LFB6:
	.loc 1 39 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 40 0
	movl	$__func__.2917, %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	debug
	.loc 1 41 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	__func_weakref, .-__func_weakref
	.weak	f_weakref
	.set	f_weakref,__func_weakref
	.globl	error
	.type	error, @function
error:
.LFB7:
	.loc 1 45 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movq	%rdi, -216(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L8
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L8:
	.loc 1 45 0
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	.loc 1 47 0
	movl	$8, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	.loc 1 49 0
	movq	stderr(%rip), %rax
	leaq	-208(%rbp), %rdx
	movq	-216(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	vfprintf
	.loc 1 51 0
	nop
	movq	-184(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L9
	call	__stack_chk_fail
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	error, .-error
	.globl	debug
	.type	debug, @function
debug:
.LFB8:
	.loc 1 54 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movl	%edi, -212(%rbp)
	movq	%rsi, -224(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L11
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L11:
	.loc 1 54 0
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	.loc 1 56 0
	movl	$16, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	.loc 1 58 0
	movl	-212(%rbp), %eax
	testl	%eax, %eax
	je	.L18
	cmpl	$1, %eax
	jne	.L17
	.loc 1 62 0
	movq	stdout(%rip), %rax
	leaq	-208(%rbp), %rdx
	movq	-224(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	vfprintf
	.loc 1 64 0
	jmp	.L15
.L17:
	.loc 1 66 0
	movq	stdout(%rip), %rax
	leaq	-208(%rbp), %rdx
	movq	-224(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	vfprintf
	.loc 1 68 0
	jmp	.L15
.L18:
	.loc 1 60 0
	nop
.L15:
	.loc 1 70 0 discriminator 1
	nop
	movq	-184(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L16
	.loc 1 70 0 is_stmt 0
	call	__stack_chk_fail
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	debug, .-debug
	.section	.rodata
	.align 16
	.type	__func__.2887, @object
	.size	__func__.2887, 16
__func__.2887:
	.string	"__func_noreturn"
	.align 8
	.type	__func__.2895, @object
	.size	__func__.2895, 15
__func__.2895:
	.string	"__func_nonnull"
	.align 16
	.type	__func__.2903, @object
	.size	__func__.2903, 18
__func__.2903:
	.string	"__func_visibility"
	.align 16
	.type	__func__.2911, @object
	.size	__func__.2911, 26
__func__.2911:
	.string	"__func_warn_unused_result"
	.align 8
	.type	__func__.2917, @object
	.size	__func__.2917, 15
__func__.2917:
	.string	"__func_weakref"
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/asm-generic/int-ll64.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4f2
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF65
	.byte	0xc
	.long	.LASF66
	.long	.LASF67
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd8
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x83
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x84
	.long	0x69
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x7
	.long	.LASF43
	.byte	0xd8
	.byte	0x4
	.byte	0xf1
	.long	0x219
	.uleb128 0x8
	.long	.LASF12
	.byte	0x4
	.byte	0xf2
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF13
	.byte	0x4
	.byte	0xf7
	.long	0x8f
	.byte	0x8
	.uleb128 0x8
	.long	.LASF14
	.byte	0x4
	.byte	0xf8
	.long	0x8f
	.byte	0x10
	.uleb128 0x8
	.long	.LASF15
	.byte	0x4
	.byte	0xf9
	.long	0x8f
	.byte	0x18
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.byte	0xfa
	.long	0x8f
	.byte	0x20
	.uleb128 0x8
	.long	.LASF17
	.byte	0x4
	.byte	0xfb
	.long	0x8f
	.byte	0x28
	.uleb128 0x8
	.long	.LASF18
	.byte	0x4
	.byte	0xfc
	.long	0x8f
	.byte	0x30
	.uleb128 0x8
	.long	.LASF19
	.byte	0x4
	.byte	0xfd
	.long	0x8f
	.byte	0x38
	.uleb128 0x8
	.long	.LASF20
	.byte	0x4
	.byte	0xfe
	.long	0x8f
	.byte	0x40
	.uleb128 0x9
	.long	.LASF21
	.byte	0x4
	.value	0x100
	.long	0x8f
	.byte	0x48
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.value	0x101
	.long	0x8f
	.byte	0x50
	.uleb128 0x9
	.long	.LASF23
	.byte	0x4
	.value	0x102
	.long	0x8f
	.byte	0x58
	.uleb128 0x9
	.long	.LASF24
	.byte	0x4
	.value	0x104
	.long	0x258
	.byte	0x60
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.value	0x106
	.long	0x25e
	.byte	0x68
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.value	0x108
	.long	0x62
	.byte	0x70
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.value	0x10c
	.long	0x62
	.byte	0x74
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.value	0x10e
	.long	0x70
	.byte	0x78
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.value	0x112
	.long	0x46
	.byte	0x80
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.value	0x113
	.long	0x54
	.byte	0x82
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.value	0x114
	.long	0x264
	.byte	0x83
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.value	0x118
	.long	0x274
	.byte	0x88
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.value	0x121
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.value	0x129
	.long	0x8d
	.byte	0x98
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.value	0x12a
	.long	0x8d
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.value	0x12b
	.long	0x8d
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.value	0x12c
	.long	0x8d
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.value	0x12e
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.value	0x12f
	.long	0x62
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x4
	.value	0x131
	.long	0x27a
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF41
	.byte	0x5
	.byte	0x28
	.uleb128 0xa
	.long	.LASF42
	.byte	0x4
	.byte	0x96
	.uleb128 0x7
	.long	.LASF44
	.byte	0x18
	.byte	0x4
	.byte	0x9c
	.long	0x258
	.uleb128 0x8
	.long	.LASF45
	.byte	0x4
	.byte	0x9d
	.long	0x258
	.byte	0
	.uleb128 0x8
	.long	.LASF46
	.byte	0x4
	.byte	0x9e
	.long	0x25e
	.byte	0x8
	.uleb128 0x8
	.long	.LASF47
	.byte	0x4
	.byte	0xa2
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x227
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0xb
	.long	0x95
	.long	0x274
	.uleb128 0xc
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x220
	.uleb128 0xb
	.long	0x95
	.long	0x28a
	.uleb128 0xc
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x290
	.uleb128 0xd
	.long	0x95
	.uleb128 0x2
	.long	.LASF48
	.byte	0x6
	.byte	0x4f
	.long	0x219
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF49
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF50
	.uleb128 0x6
	.byte	0x8
	.long	0x2b4
	.uleb128 0xe
	.uleb128 0x2
	.long	.LASF51
	.byte	0x7
	.byte	0x19
	.long	0x62
	.uleb128 0xf
	.long	.LASF56
	.byte	0x1
	.byte	0x7
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x2f1
	.uleb128 0x10
	.long	.LASF53
	.long	0x301
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.2887
	.byte	0
	.uleb128 0xb
	.long	0x290
	.long	0x301
	.uleb128 0xc
	.long	0x86
	.byte	0xf
	.byte	0
	.uleb128 0xd
	.long	0x2f1
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0xf
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x361
	.uleb128 0x12
	.long	.LASF52
	.byte	0x1
	.byte	0xf
	.long	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.string	"src"
	.byte	0x1
	.byte	0xf
	.long	0x2ae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.string	"len"
	.byte	0x1
	.byte	0xf
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.long	.LASF53
	.long	0x371
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.2895
	.byte	0
	.uleb128 0xb
	.long	0x290
	.long	0x371
	.uleb128 0xc
	.long	0x86
	.byte	0xe
	.byte	0
	.uleb128 0xd
	.long	0x361
	.uleb128 0x11
	.long	.LASF55
	.byte	0x1
	.byte	0x16
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x3a7
	.uleb128 0x10
	.long	.LASF53
	.long	0x3b7
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.2903
	.byte	0
	.uleb128 0xb
	.long	0x290
	.long	0x3b7
	.uleb128 0xc
	.long	0x86
	.byte	0x11
	.byte	0
	.uleb128 0xd
	.long	0x3a7
	.uleb128 0x14
	.long	.LASF57
	.byte	0x1
	.byte	0x1e
	.long	0x62
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x3f1
	.uleb128 0x10
	.long	.LASF53
	.long	0x401
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.2911
	.byte	0
	.uleb128 0xb
	.long	0x290
	.long	0x401
	.uleb128 0xc
	.long	0x86
	.byte	0x19
	.byte	0
	.uleb128 0xd
	.long	0x3f1
	.uleb128 0x11
	.long	.LASF58
	.byte	0x1
	.byte	0x26
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x437
	.uleb128 0x10
	.long	.LASF53
	.long	0x437
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.2917
	.byte	0
	.uleb128 0xd
	.long	0x361
	.uleb128 0x11
	.long	.LASF59
	.byte	0x1
	.byte	0x2c
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x478
	.uleb128 0x13
	.string	"fmt"
	.byte	0x1
	.byte	0x2c
	.long	0x28a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x15
	.uleb128 0x16
	.string	"ap"
	.byte	0x1
	.byte	0x2e
	.long	0x295
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.byte	0
	.uleb128 0x11
	.long	.LASF60
	.byte	0x1
	.byte	0x35
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x4c3
	.uleb128 0x12
	.long	.LASF61
	.byte	0x1
	.byte	0x35
	.long	0x2b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -228
	.uleb128 0x13
	.string	"fmt"
	.byte	0x1
	.byte	0x35
	.long	0x28a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x15
	.uleb128 0x16
	.string	"ap"
	.byte	0x1
	.byte	0x37
	.long	0x295
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.byte	0
	.uleb128 0x17
	.long	.LASF62
	.byte	0x6
	.byte	0xa9
	.long	0x25e
	.uleb128 0x17
	.long	.LASF63
	.byte	0x6
	.byte	0xaa
	.long	0x25e
	.uleb128 0x18
	.uleb128 0x19
	.long	.LASF64
	.byte	0x1
	.byte	0x1c
	.long	0x4ef
	.uleb128 0x9
	.byte	0x3
	.quad	p_func
	.uleb128 0x6
	.byte	0x8
	.long	0x4d9
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
	.uleb128 0x3
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
	.uleb128 0x26
	.byte	0
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
	.uleb128 0x87
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x19
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
.LASF8:
	.string	"__off_t"
.LASF13:
	.string	"_IO_read_ptr"
.LASF25:
	.string	"_chain"
.LASF7:
	.string	"size_t"
.LASF31:
	.string	"_shortbuf"
.LASF48:
	.string	"va_list"
.LASF60:
	.string	"debug"
.LASF19:
	.string	"_IO_buf_base"
.LASF50:
	.string	"long long unsigned int"
.LASF53:
	.string	"__func__"
.LASF49:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF26:
	.string	"_fileno"
.LASF14:
	.string	"_IO_read_end"
.LASF6:
	.string	"long int"
.LASF12:
	.string	"_flags"
.LASF66:
	.string	"Declaring_Attributes_of_Functions.c"
.LASF20:
	.string	"_IO_buf_end"
.LASF29:
	.string	"_cur_column"
.LASF28:
	.string	"_old_offset"
.LASF33:
	.string	"_offset"
.LASF56:
	.string	"__func_noreturn"
.LASF65:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF44:
	.string	"_IO_marker"
.LASF64:
	.string	"p_func"
.LASF3:
	.string	"unsigned int"
.LASF0:
	.string	"long unsigned int"
.LASF17:
	.string	"_IO_write_ptr"
.LASF46:
	.string	"_sbuf"
.LASF2:
	.string	"short unsigned int"
.LASF21:
	.string	"_IO_save_base"
.LASF32:
	.string	"_lock"
.LASF27:
	.string	"_flags2"
.LASF39:
	.string	"_mode"
.LASF62:
	.string	"stdout"
.LASF54:
	.string	"__func_nonnull"
.LASF10:
	.string	"sizetype"
.LASF41:
	.string	"__gnuc_va_list"
.LASF18:
	.string	"_IO_write_end"
.LASF42:
	.string	"_IO_lock_t"
.LASF43:
	.string	"_IO_FILE"
.LASF52:
	.string	"dest"
.LASF61:
	.string	"dlevel"
.LASF47:
	.string	"_pos"
.LASF59:
	.string	"error"
.LASF24:
	.string	"_markers"
.LASF1:
	.string	"unsigned char"
.LASF58:
	.string	"__func_weakref"
.LASF5:
	.string	"short int"
.LASF30:
	.string	"_vtable_offset"
.LASF51:
	.string	"__s32"
.LASF11:
	.string	"char"
.LASF45:
	.string	"_next"
.LASF9:
	.string	"__off64_t"
.LASF15:
	.string	"_IO_read_base"
.LASF23:
	.string	"_IO_save_end"
.LASF67:
	.string	"/media/iamjy1005/97b53b95-bba5-4bcc-ab12-5539c6a738ef/work/lab/practice/c/src/function/src"
.LASF34:
	.string	"__pad1"
.LASF35:
	.string	"__pad2"
.LASF36:
	.string	"__pad3"
.LASF37:
	.string	"__pad4"
.LASF38:
	.string	"__pad5"
.LASF55:
	.string	"__func_visibility"
.LASF40:
	.string	"_unused2"
.LASF63:
	.string	"stderr"
.LASF57:
	.string	"__func_warn_unused_result"
.LASF22:
	.string	"_IO_backup_base"
.LASF16:
	.string	"_IO_write_base"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
