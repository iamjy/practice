#include "libtext.h"

short TxGetCursor(void)
{
	short rv;
	asm ("
		movw	$0x3d4,%%dx
		movb	$0x0b0a,%%al
		outb	%%al,%%dx
		incl	%%edx
		inb		%%dx,%%al
		xchgb	%%al,%%ah
		decl	%%edx
		outb	%%al,%%dx
		incl	%%edx
		inb		%%dx,%%al
		"
		:"=a"(rv)
		:
		:"%edx");
	return rv;
}

void TxSetCursor(int top, int bot)
{
	asm ("
		movw	$0x3d4,%%dx
		movb	$0x0a,%%al
		movb	%0,%%ah
		outw	%%ax,%%dx
		incb	%%al
		movb	%1,%%ah
		outw	%%ax,%%dx
		"
		:
		:"g"(top),"g"(bot)
		:"%eax","%edx"
	);
}

void _TxSetCursor(int curs)
{
	asm ("
		movw	%0,%%cx
		movw	$0x3d4,%%dx
		movb	$0x0a,%%al
		movb	%%ch,%%ah
		outw	%%ax,%%dx
		incb	%%al
		movb	%%cl,%%ah
		outw	%%ax,%%dx
		"
		:
		:"g"(curs)
		:"%eax","%edx","%ecx"
	);
}

void TxGotoxy(int x, int y)
{
	unsigned short addr=y*TxScreenSizex()+x;
	asm ("
		movw	%0,%%bx
		movb	%%bh,%%ah
		movb	$0x0e,%%al
		movw	$0x3d4,%%dx
		outw	%%ax,%%dx
		incb	%%al
		movb	%%bl,%%ah
		outw	%%ax,%%dx
		"
		:
		:"r"(addr)
		:"%eax","%ebx","%edx"
	);
}

void TxGetxy(int *x, int *y)
{
	unsigned short addr;
	asm ("
		movw	$0x3d4,%%dx
		movw	$0x0f0e,%%ax
		outb	%%al,%%dx
		incb	%%dl
		inb		%%dx,%%al
		xchgb	%%al,%%ah
		decb	%%dl
		outb	%%al,%%dx
		incb	%%dl
		inb		%%dx,%%al
		movw	%%ax,%0
		"
		:"=r"(addr)
		:
		:"%eax","%edx"
	);
	*y=addr/TxScreenSizex();
	*x=addr%TxScreenSizex();
}
