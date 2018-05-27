		.file	"textmode.s"

		.set	SC_INDEX,	0x03c4		#/*Sequence Controller Index*/
		.set	CRTC_INDEX,	0x03d4		#/*CRT Controller Index*/
		.set	MISC_OUTPUT,0x03c2		#/*Miscellaneous Output register*/
		.set	RMISC_OUTPUT,0x03cc		#/*Miscellaneous Output register*/
		.set	CRT_PARM_LENGTH,((CRTParmsEnd-CRTParms)/2)
		.set	CRT_PARM_LENGTH3,((CRTParmsEnd3-CRTParms3)/2)
		.set	CRT_SAVE_LENGTH,CRT_PARM_LENGTH+CRT_PARM_LENGTH3

		.text
		.align	4
		.globl	_set480lines
_set480lines:
		pushl	%ebp			#/*preserve caller's stack frame*/
		pushl	%esi			#/*preserve C register vars*/
		pushl	%edi			#/* (don't count on BIOS preserving anything)*/
		pushl	%ebx
		pushl	%ecx
		pushl	%edx

		movw	$SC_INDEX,%dx
		movw	$0x0100,%ax
		outw	%ax,%dx			#/*synchronous resset while switching clocks*/

		movw	$MISC_OUTPUT,%dx
		movb	$0xe7,%al		#e7
		outb	%al,%dx			#/*select 28 MHz dot clock & 60 Hz scanning
								#	rate*/
		movw	$SC_INDEX,%dx
		movw	$0x0300,%ax
		outw	%ax,%dx			#/*undo reset (restart sequencer)*/

		movw	$CRTC_INDEX,%dx	#/*reprogram the CRT Controller*/
		movb	$0x11,%al		#/*VSync End reg contains register write*/
		outb	%al,%dx			#/* protect bit*/
		incw	%dx				#/*CRT Controller Data register*/
		inb		%dx,%al			#/*get current VSync End register setting*/
		andb	$0x7f,%al		#/*remove write protect on various*/
		outb	%al,%dx			#/* CRTC registers*/
		decw	%dx				#/*CRT Controller Index*/
		cld
		leal	CRTParms,%esi	#/*point to CRT parameter table*/
		movl	$CRT_PARM_LENGTH,%ecx #/*# of table entries*/
		rep
		outsw

		movb	$0x11,%al		#/*VSync End reg contains register write*/
		outb	%al,%dx			#/* protect bit*/
		incw	%dx				#/*CRT Controller Data register*/
		inb		%dx,%al			#/*get current VSync End register setting*/
		orb		$0x80,%al		#/*set write protect on various*/
		outb	%al,%dx			#/* CRTC registers*/

		popl	%edx
		popl	%ecx
		popl	%ebx
		popl	%edi			#/*restore C register vars*/
		popl	%esi
		popl	%ebp			#/*restore callers stack frame*/
		ret

		.align	4
		.globl	_set350lines
_set350lines:
		pushl	%ebp			#/*preserve caller's stack frame*/
		pushl	%esi			#/*preserve C register vars*/
		pushl	%edi			#/* (don't count on BIOS preserving anything)*/
		pushl	%ebx
		pushl	%ecx
		pushl	%edx

		movw	$SC_INDEX,%dx
		movw	$0x0100,%ax
		outw	%ax,%dx			#/*synchronous resset while switching clocks*/

		movw	$MISC_OUTPUT,%dx
		movb	$0xa7,%al
		outb	%al,%dx			#/*select 28 MHz dot clock & 60 Hz scanning
								#	rate*/
		movw	$SC_INDEX,%dx
		movw	$0x0300,%ax
		outw	%ax,%dx			#/*undo reset (restart sequencer)*/

		movw	$CRTC_INDEX,%dx	#/*reprogram the CRT Controller*/
		movb	$0x11,%al		#/*VSync End reg contains register write*/
		outb	%al,%dx			#/* protect bit*/
		incw	%dx				#/*CRT Controller Data register*/
		inb		%dx,%al			#/*get current VSync End register setting*/
		andb	$0x7f,%al		#/*remove write protect on various*/
		outb	%al,%dx			#/* CRTC registers*/
		decw	%dx				#/*CRT Controller Index*/
		cld
		leal	CRTParms2,%esi	#/*point to CRT parameter table*/
		movl	$CRT_PARM_LENGTH,%ecx #/*# of table entries*/
		rep
		outsw

		movb	$0x11,%al		#/*VSync End reg contains register write*/
		outb	%al,%dx			#/* protect bit*/
		incw	%dx				#/*CRT Controller Data register*/
		inb		%dx,%al			#/*get current VSync End register setting*/
		orb		$0x80,%al		#/*set write protect on various*/
		outb	%al,%dx			#/* CRTC registers*/

		popl	%edx
		popl	%ecx
		popl	%ebx
		popl	%edi			#/*restore C register vars*/
		popl	%esi
		popl	%ebp			#/*restore callers stack frame*/
		ret

		.align	4
		.globl	_setVerticalDisplayEnd
_setVerticalDisplayEnd:
		pushl	%ebp
		movl	%esp,%ebp
		movw	$CRTC_INDEX,%dx
		movb	$0x12,%al
		movb	8(%ebp),%ah
		outw	%ax,%dx
		movzbl	9(%ebp),%ecx
		andb	$3,%cl
		movb	$7,%al
		outb	%al,%dx
		inw		%dx,%ax
		andb	$0b10111101,%ah
		orb		spreadBits(%ecx),%ah
		outw	%ax,%dx
		popl	%ebp
		ret

		.align	4
		.globl	_set90columns
_set90columns:
		pushl	%ebp			#/*preserve caller's stack frame*/
		pushl	%esi			#/*preserve C register vars*/
		pushl	%edi			#/* (don't count on BIOS preserving anything)*/
		pushl	%ebx
		pushl	%ecx
		pushl	%edx

		movw	$SC_INDEX,%dx
		movw	$0x0100,%ax
		outw	%ax,%dx			#/*synchronous resset while switching clocks*/

		movw	$RMISC_OUTPUT,%dx
		inb		%dx,%al
		movw	$MISC_OUTPUT,%dx
		andb	$~0x0c,%al
		orb		$0x04,%al
		outb	%al,%dx			#/*select 16 MHz dot clock & ?? Hz scanning
								#	rate*/
		movw	$SC_INDEX,%dx
		movw	$0x0300,%ax
		outw	%ax,%dx			#/*undo reset (restart sequencer)*/

		movw	$CRTC_INDEX,%dx	#/*reprogram the CRT Controller*/
		movb	$0x11,%al		#/*VSync End reg contains register write*/
		outb	%al,%dx			#/* protect bit*/
		incw	%dx				#/*CRT Controller Data register*/
		inb		%dx,%al			#/*get current VSync End register setting*/
		andb	$0x7f,%al		#/*remove write protect on various*/
		outb	%al,%dx			#/* CRTC registers*/
		decw	%dx				#/*CRT Controller Index*/
		cld
		leal	CRTParms3,%esi	#/*point to CRT parameter table*/
		movl	$CRT_PARM_LENGTH3,%ecx #/*# of table entries*/
		rep
		outsw

		movb	$0x11,%al		#/*VSync End reg contains register write*/
		outb	%al,%dx			#/* protect bit*/
		incw	%dx				#/*CRT Controller Data register*/
		inb		%dx,%al			#/*get current VSync End register setting*/
		orb		$0x80,%al		#/*set write protect on various*/
		outb	%al,%dx			#/* CRTC registers*/

		movb	$0x01,%al
		movw	$0x3c4,%dx
		outb	%al,%dx
		inw		%dx,%ax
		orb		$0x01,%ah
		outw	%ax,%dx

		movw	$0x3da,%dx		#input status register 1
		inb		%dx,%al			#this will reset the flip/flop for ACR
		movb	$0x33,%al
		movw	$0x3c0,%dx		#ACR (attribute controller register)
		outb	%al,%dx
		movb	$0x00,%al
		outb	%al,%dx

		popl	%edx
		popl	%ecx
		popl	%ebx
		popl	%edi			#/*restore C register vars*/
		popl	%esi
		popl	%ebp			#/*restore callers stack frame*/
		ret

		.align	4
		.globl	_setDoubleScan
_setDoubleScan:
		pushl	%eax
		pushl	%edx
		movw	$CRTC_INDEX,%dx
		movb	$9,%al
		outb	%al,%dx
		incw	%dx
		inb		%dx,%al
		orb		$0x80,%al
		outb	%al,%dx
		popl	%edx
		popl	%eax
		ret

		.align	4
		.globl	_setTextMode
_setTextMode:
		pushl	%ebp
		movl	%esp,%ebp
		pushal
		movb	8(%ebp),%al
		xorb	%ah,%ah
		int		$0x10
		popal
		nop
		leave
		ret

		.data
CRTParms:						#for 480 lines
		.word		0x0d06		#0b/*vertical total*/
		.word		0x3e07		#/*overflow (bit 8 of vertical counts)*/
		.word		0x0f09		#4f/*cell height*/
		.word		0xea10		#/*v sync start*/
		.word		0xac11		#/*v sync end and protect cr0-cr7*/
		.word		0xdf12		#/*vertical displayed*/
		.word		0xe715		#/*v blank start*/
		.word		0x0616		#04/*v blank end*/
CRTParmsEnd:
CRTParms2:						#for 350 lines
		.word		0xbf06		#/*vertical total*/
		.word		0x1f07		#/*overflow (bit 8 of vertical counts)*/
		.word		0x4009		#/*cell height*/
		.word		0x8310		#/*v sync start*/
		.word		0x8511		#/*v sync end and protect cr0-cr7*/
		.word		0x5d12		#/*vertical displayed*/
		.word		0x6315		#/*v blank start*/
		.word		0xba16		#/*v blank end*/
CRTParms3:						#for 90 colums/8 bit wide chars
		.word		0x6900
		.word		0x5901
		.word		0x5a02
		.word		0x8c03
		.word		0x5f04
		.word		0x8b05
		.word		0x2d13
CRTParmsEnd3:
spreadBits:
		.byte		0b00000000
		.byte		0b00000010
		.byte		0b01000000
		.byte		0b01000010
