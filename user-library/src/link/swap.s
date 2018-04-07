	.arch armv5te
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"swap.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.global	bufp0
	.data
	.align	2
	.type	bufp0, %object
	.size	bufp0, 4
bufp0:
	.word	buf
	.comm	bufp1,4,4
	.text
	.align	2
	.global	swap
	.type	swap, %function
swap:
	.fnstart
.LFB0:
	.file 1 "swap.c"
	.loc 1 7 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
.LCFI0:
	.setfp fp, sp, #0
	add	fp, sp, #0
.LCFI1:
	.pad #12
	sub	sp, sp, #12
.LCFI2:
	.loc 1 10 0
	ldr	r3, .L3
	ldr	r2, .L3+4
	str	r2, [r3, #0]
	.loc 1 11 0
	ldr	r3, .L3+8
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-8]
	.loc 1 12 0
	ldr	r3, .L3+8
	ldr	r3, [r3, #0]
	ldr	r2, .L3
	ldr	r2, [r2, #0]
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	.loc 1 13 0
	ldr	r3, .L3
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #0]
	.loc 1 14 0
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L4:
	.align	2
.L3:
	.word	bufp1
	.word	buf+4
	.word	bufp0
.LFE0:
	.fnend
	.size	swap, .-swap
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.byte	0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0x0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x4
	.byte	0x11
	.uleb128 0xb
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0xb
	.align	2
.LEFDE0:
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB0-.Ltext0
	.4byte	.LCFI0-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI0-.Ltext0
	.4byte	.LCFI1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 4
	.4byte	.LCFI1-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x2
	.byte	0x7b
	.sleb128 4
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x93
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF2
	.byte	0x1
	.4byte	.LASF3
	.4byte	.LASF4
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.4byte	.LASF5
	.byte	0x1
	.byte	0x6
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LLST0
	.4byte	0x4d
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x1
	.byte	0x8
	.4byte	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.4byte	0x4d
	.4byte	0x5f
	.uleb128 0x6
	.byte	0x0
	.uleb128 0x7
	.ascii	"buf\000"
	.byte	0x1
	.byte	0x1
	.4byte	0x54
	.byte	0x1
	.byte	0x1
	.uleb128 0x8
	.4byte	.LASF0
	.byte	0x1
	.byte	0x3
	.4byte	0x7e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	bufp0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4d
	.uleb128 0x8
	.4byte	.LASF1
	.byte	0x1
	.byte	0x4
	.4byte	0x7e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	bufp1
	.byte	0x0
	.section	.debug_abbrev
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
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x2b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x97
	.4byte	0x25
	.ascii	"swap\000"
	.4byte	0x6c
	.ascii	"bufp0\000"
	.4byte	0x84
	.ascii	"bufp1\000"
	.4byte	0x0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF6:
	.ascii	"temp\000"
.LASF1:
	.ascii	"bufp1\000"
.LASF2:
	.ascii	"GNU C 4.4.1\000"
.LASF4:
	.ascii	"/home/iamjy1005/work/lab/practice/user-library/src/"
	.ascii	"link\000"
.LASF5:
	.ascii	"swap\000"
.LASF3:
	.ascii	"swap.c\000"
.LASF0:
	.ascii	"bufp0\000"
	.ident	"GCC: (Sourcery G++ Lite 2009q3-67) 4.4.1"
	.section	.note.GNU-stack,"",%progbits
