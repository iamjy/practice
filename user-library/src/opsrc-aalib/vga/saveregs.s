		.file	"saveregs.s"
		.include "vga.inc"

		.align	2
		.globl	_vgaSaveGeneralRegs
_vgaSaveGeneralRegs:
		push	%edi
		movl	8(%esp),%edi
		cld
		movw	$MiscOut_R,%dx
		inb		%dx,%al
		stosb
		movw	$FeatCont_R,%dx
		inb		%dx,%al
		stosb
		movl	%edi,%eax
		popl	%edi
		ret

		.align	2
		.globl	_vgaSaveSequencerRegs
_vgaSaveSequencerRegs:
		pushl	%edi
		movl	8(%esp),%edi
		cld
		movw	$Sequencer,%dx
		inb		%dx,%al
		pushl	%eax
		movl	$4,%ecx
		movb	$1,%al		# skip the reset register (saved later)
1:		outb	%al,%dx
		inw		%dx,%ax
		movb	%ah,(%edi)
		incl	%edi
		incb	%al
		loop	1b
		movb	$0,%al		# now save the reset register
		outb	%al,%dx
		inw		%dx,%ax
		movb	%ah,(%edi)
		incl	%edi
		popl	%eax
		stosb
		movl	%edi,%eax
		popl	%edi
		ret

		.align	2
		.globl	_vgaSaveCRTControllerRegs
_vgaSaveCRTControllerRegs:
		pushl	%edi
		movl	8(%esp),%edi
		cld
		movw	$CRTC,%dx
		inb		%dx,%al
		pushl	%eax
		movl	$0x19,%ecx
		movb	$0,%al
1:		outb	%al,%dx
		inw		%dx,%ax
		movb	%ah,(%edi)
		incl	%edi
		incb	%al
		loop	1b
		popl	%eax
		stosb
		movl	%edi,%eax
		popl	%edi
		ret

		.align	2
		.globl	_vgaSaveGraphicsRegs
_vgaSaveGraphicsRegs:
		pushl	%edi
		movl	8(%esp),%edi
		cld
		movw	$Graphics,%dx
		inb		%dx,%al
		pushl	%eax
		movl	$9,%ecx
		movb	$0,%al
1:		outb	%al,%dx
		inw		%dx,%ax
		movb	%ah,(%edi)
		incl	%edi
		incb	%al
		loop	1b
		popl	%eax
		stosb
		movl	%edi,%eax
		popl	%edi
		ret

		.align	2
		.globl	_vgaSaveAttributeRegs
_vgaSaveAttributeRegs:
		pushl	%edi
		pushl	%ebx
		movl	12(%esp),%edi
		cld
		movw	$InputStat1,%dx
		inb		%dx,%al
		movw	$InputStat1_M,%dx
		inb		%dx,%al
		movw	$AttributeID,%dx
		inb		%dx,%al
		pushl	%eax
		movl	$0x10,%ecx
		movb	$0,%bl
1:		movb	%bl,%al
		outb	%al,%dx
		inw		%dx,%ax
		movb	%ah,(%edi)
		incl	%edi
		movb	%ah,%al
		outb	%al,%dx
		incb	%bl
		loop	1b
		movl	$0x05,%ecx
		orb		$0x20,%bl
2:		movb	%bl,%al
		outb	%al,%dx
		inw		%dx,%ax
		movb	%ah,(%edi)
		incl	%edi
		movb	%ah,%al
		outb	%al,%dx
		incb	%bl
		loop	2b
		popl	%eax
		stosb
		movl	%edi,%eax
		popl	%ebx
		popl	%edi
		ret

		.align	2
		.globl	_vgaSavePaletteRegs
_vgaSavePaletteRegs:
		pushl	%edi
		movl	8(%esp),%edi
		movw	$ColorWrite,%dx
		inb		%dx,%al
		pushl	%eax
		movw	$ColorRead,%dx
		movl	$0x300,%ecx
		movb	$0,%al
		outb	%al,%dx
		movw	$ColorData,%dx
		rep
		insb
		popl	%eax
		stosb
		movl	%edi,%eax
		popl	%edi
		ret

		.align	2
		.globl	_vgaSaveRegs
_vgaSaveRegs:
		pushl	4(%esp)
		call	_vgaSaveGeneralRegs
		movl	%eax,(%esp)
		call	_vgaSaveSequencerRegs
		movl	%eax,(%esp)
		call	_vgaSaveCRTControllerRegs
		movl	%eax,(%esp)
		call	_vgaSaveGraphicsRegs
		movl	%eax,(%esp)
		call	_vgaSaveAttributeRegs
		movl	%eax,(%esp)
		call	_vgaSavePaletteRegs
		addl	$4,%esp
		ret
