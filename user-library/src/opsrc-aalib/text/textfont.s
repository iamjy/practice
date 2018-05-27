		.file	"textfont.s"
		.text

		.align	4
		.globl	_AccessFont
_AccessFont:
		pushl	%esi
		pushl	%ecx
		cld
		movw	$0x3c4,%dx
		leal	SeqSet,%esi
		movl	$4,%ecx
		rep
		outsw
		movw	$0x3ce,%dx
		leal	GCSet,%esi
		movl	$3,%ecx
		rep
		outsw
		popl	%ecx
		popl	%esi
		ret

		.align	4
		.globl	_AccessText
_AccessText:
		pushl	%esi
		pushl	%ecx
		cld
		movw	$0x3c4,%dx
		leal	SeqReset,%esi
		movl	$4,%ecx
		rep
		outsw
		movw	$0x3ce,%dx
		leal	GCReset,%esi
		movl	$3,%ecx
		rep
		outsw
		popl	%ecx
		popl	%esi
		ret

		.align	4
		.globl	_SetFontHeight
_SetFontHeight:
		pushl	%ebp
		movl	%esp,%ebp
		pushl	%ebx
		movb	8(%ebp),%bl
		decb	%bl
		andb	$0x1f,%bl
		movw	CRTCAddr,%dx
		movb	$9,%al
		outb	%al,%dx
		incw	%dx
		inb		%dx,%al
		andb	$0xe0,%al
		orb		%bl,%al
		outb	%al,%dx
		popl	%ebx
		leave
		ret

		.align	4
		.globl	_GetFontHeight
_GetFontHeight:
		pushl	%ebp
		movl	%esp,%ebp
		movw	CRTCAddr,%dx
		movb	$9,%al
		outb	%al,%dx
		incw	%dx
		inb		%dx,%al
		andb	$0x1f,%al
		incb	%al
		movzbl	%al,%eax
		leave
		ret

		.data
SeqSet:	.word	0x0100
		.word	0x0402
		.word	0x0704
		.word	0x0300
SeqReset:.word	0x0100
		.word	0x0302
		.word	0x0304
		.word	0x0300
GCSet:	.word	0x0204
		.word	0x0005
		.word	0x0c06
GCReset:.word	0x0004
		.word	0x1005
		.word	0x0e06
CRTCAddr:.word	0x3d4
