		.file	"saveregs.s"
		.include "vga.inc"

		.align	2
		.globl	_vgaRestoreGeneralRegs
_vgaRestoreGeneralRegs:
		push	%esi
		movl	8(%esp),%esi
		cld
		movw	$MiscOut,%dx
		lodsb
		outb	%al,%dx
		movw	$FeatCont,%dx
		lodsb
		outb	%al,%dx
		movl	%esi,%eax
		popl	%esi
		ret

		.align	2
		.globl	_vgaRestoreSequencerRegs
_vgaRestoreSequencerRegs:
		pushl	%esi
		movl	8(%esp),%esi
		cld
		movw	$Sequencer,%dx
		movw	$0x0300,%ax	# synchronous reset
		outw	%ax,%dx
		movl	$4,%ecx
		movb	$1,%al		# skip the reset register (restored later)
1:		movb	(%esi),%ah
		outw	%ax,%dx
		incl	%esi
		incb	%al
		loop	1b
		movb	$0,%al		# now restore the reset register
1:		movb	(%esi),%ah
		incl	%esi
		outw	%ax,%dx
		lodsb				# restore index register
		outb	%al,%dx
		movl	%esi,%eax
		popl	%esi
		ret

		.align	2
		.globl	_vgaRestoreCRTControllerRegs
_vgaRestoreCRTControllerRegs:
		pushl	%esi
		movl	8(%esp),%esi
		cld
		movw	$CRTC,%dx
		movw	$cVrtRetrEnd,%ax# upper bits set to zero, un write protect timing regs
		outw	%ax,%dx
		movl	$0x19,%ecx
		movb	$0,%al
1:		movb	(%esi),%ah
		outw	%ax,%dx
		incl	%esi
		incb	%al
		loop	1b
		lodsb				# restore index register
		outb	%al,%dx
		movl	%esi,%eax
		popl	%esi
		ret

		.align	2
		.globl	_vgaRestoreGraphicsRegs
_vgaRestoreGraphicsRegs:
		pushl	%esi
		movl	8(%esp),%esi
		cld
		movw	$Graphics,%dx
		movl	$9,%ecx
		movb	$0,%al
1:		movb	(%esi),%ah
		outw	%ax,%dx
		incl	%esi
		incb	%al
		loop	1b
		lodsb				# restore index register
		outb	%al,%dx
		movl	%esi,%eax
		popl	%esi
		ret

		.align	2
		.globl	_vgaRestoreAttributeRegs
_vgaRestoreAttributeRegs:
		pushl	%esi
		pushl	%ebx
		movl	12(%esp),%esi
		cld
		movw	$InputStat1,%dx
		inb		%dx,%al
		movw	$InputStat1_M,%dx
		inb		%dx,%al
		movw	$AttributeID,%dx
		movl	$0x15,%ecx
		movb	$0,%bl
1:		movb	%bl,%al
		outb	%al,%dx
		lodsb
		outb	%al,%dx
		incb	%bl
		loop	1b
		lodsb				# restore index register
		outb	%al,%dx
		movl	%esi,%eax
		popl	%ebx
		popl	%esi
		ret

		.align	2
		.globl	_vgaRestorePaletteRegs
_vgaRestorePaletteRegs:
		pushl	%esi
		movl	8(%esp),%esi
		movw	$ColorWrite,%dx
		movl	$0x300,%ecx
		movb	$0,%al
		outb	%al,%dx
		movw	$ColorData,%dx
		rep
		outsb
		lodsb
		movw	$ColorWrite,%dx
		outb	%al,%dx
		movw	$ColorRead,%dx
		outb	%al,%dx
		movl	%esi,%eax
		popl	%esi
		ret

		.align	2
		.globl	_vgaRestoreRegs
_vgaRestoreRegs:
		pushl	4(%esp)
		call	_vgaRestoreGeneralRegs
		movl	%eax,(%esp)
		call	_vgaRestoreSequencerRegs
		movl	%eax,(%esp)
		call	_vgaRestoreCRTControllerRegs
		movl	%eax,(%esp)
		call	_vgaRestoreGraphicsRegs
		movl	%eax,(%esp)
		call	_vgaRestoreAttributeRegs
		movl	%eax,(%esp)
		call	_vgaRestorePaletteRegs
		addl	$4,%esp
		ret
