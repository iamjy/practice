#include <sys/farptr.h>
#include <sys/segments.h>
#include "libtext.h"

void TxBlitNC(TxContext *dc, int dx, int dy,
	   TxContext *sc, int sxs, int sys, int sxe, int sye)
{
	int xc,yc,xss,xsd;
	int doff,soff;
	char dir=0;
	short ds,ss;

	if (sxe<sxs) return;
	if (sye<sys) return;

	if (!dc) dc=&CurrentContext;
	if (!sc) sc=&CurrentContext;

	xc=sxe-sxs+1;
	yc=sye-sys+1;
	xss=(sc->maxx+1-xc)*2;
	xsd=(dc->maxx+1-xc)*2;
	doff=2*(dx+dy*(1+dc->maxx));
	soff=2*(sxs+sys*(1+sc->maxx));
	if (doff>soff) {
		doff=2*(dx+xc-1+(dy+yc-1)*(1+dc->maxx));
		soff=2*(sxe+sye*(1+sc->maxx));
        xss*=-1;
		xsd*=-1;
		dir=1;
	}
	switch ((dc->isScreen)|(sc->isScreen<<1)) {
	case 0:
		doff+=(int)dc->buffer.buffer;
		soff+=(int)sc->buffer.buffer;
		asm ("
			cld
			testb	$0xff,%0
			jz		1f
			std
		1:	pushl	%%ebp
			movl	%%ecx,%%ebp

		2:	movl	%%ebp,%%ecx
			rep
			movsw
			addl	%%edx,%%edi
			addl	%%ebx,%%esi
			decl	%%eax
			jnz		2b
			popl	%%ebp
			cld
			"
			:
			:"g"(dir),"D"(doff),"S"(soff),"c"(xc),"a"(yc),"d"(xsd),"b"(xss)
			:"%eax","%ecx","%esi","%edi"
		);
		break;
	case 1:
		ds=dc->buffer.selector;
		soff+=(int)sc->buffer.buffer;
		asm ("
			cld
			testb	$0xff,%0
			jz		1f
			std
		1:	pushl	%%es
			pushl	%%ebp
			movw	%1,%%es
			movl	%%ecx,%%ebp

		2:	movl	%%ebp,%%ecx
			rep
			movsw
			addl	%%edx,%%edi
			addl	%%ebx,%%esi
			decl	%%eax
			jnz		2b
			popl	%%ebp
			popl	%%es
			cld
			"
			:
			:"m"(dir),"m"(ds),"D"(doff),"S"(soff),"c"(xc),"a"(yc),"d"(xsd),"b"(xss)
			:"%eax","%ecx","%esi","%edi"
		);
		break;
	case 2:
		doff+=(int)dc->buffer.buffer;
		ss=sc->buffer.selector;
		asm ("
			cld
			testb	$0xff,%0
			jz		1f
			std
		1:	pushl	%%ds
			pushl	%%ebp
			movw	%1,%%ds
			movl	%%ecx,%%ebp

		2:	movl	%%ebp,%%ecx
			rep
			movsw
			addl	%%edx,%%edi
			addl	%%ebx,%%esi
			decl	%%eax
			jnz		2b
			popl	%%ebp
			popl	%%ds
			cld
			"
			:
			:"m"(dir),"m"(ss),"D"(doff),"S"(soff),"c"(xc),"a"(yc),"d"(xsd),"b"(xss)
			:"%eax","%ecx","%esi","%edi"
		);
		break;
	case 3:
		ds=dc->buffer.selector;
		ss=sc->buffer.selector;
		asm ("
			cld
			testb	$0xff,%0
			jz		1f
			std
		1:	pushl	%%es
			pushl	%%ds
			pushl	%%ebp
			movw	%1,%%es
			movw	%2,%%ds
			movl	%%ecx,%%ebp

		2:	movl	%%ebp,%%ecx
			rep
			movsw
			addl	%%edx,%%edi
			addl	%%ebx,%%esi
			decl	%%eax
			jnz		2b
			popl	%%ebp
			popl	%%ds
			popl	%%es
			cld
			"
			:
			:"m"(dir),"m"(ds),"g"(ss),"D"(doff),"S"(soff),"c"(xc),"a"(yc),"d"(xsd),"b"(xss)
			:"%eax","%ecx","%esi","%edi"
		);
		break;
	}
}

#define min(a,b) (((a)<(b))?(a):(b))
#define max(a,b) (((a)>(b))?(a):(b))

void TxBlit(TxContext *dc, int dx, int dy,
	   TxContext *sc, int sxs, int sys, int sxe, int sye)
{
	int t,dxe,dye;

	if (!dc) dc=&CurrentContext;
	if (!sc) sc=&CurrentContext;

	sxe=min(sxe,sc->clipxmax);
	sye=min(sye,sc->clipymax);

	t=max(sxs,sc->clipxmin);
	dx+=t-sxs;
	sxs=t;
	t=max(sys,sc->clipymin);
	dy+=t-sys;
	sys=t;

	t=max(dx,dc->clipxmin);
	sxs+=t-dx;
	dx=t;
	t=max(dy,dc->clipymin);
	sys+=t-dy;
	dy=t;

	dxe=dx+sxe-sxs;
	dye=dy+sye-sys;
	t=min(dxe,dc->clipxmax);
	sxe+=t-dxe;
	t=min(dye,dc->clipymax);
	sye+=t-dye;

	if (sxs>sc->clipxmax) return;
	if (sxe<sc->clipxmin) return;
	if (sys>sc->clipymax) return;
	if (sys<sc->clipymin) return;
	if (dx>dc->clipxmax) return;
	if (dy>dc->clipymax) return;

	TxBlitNC(dc,dx,dy,sc,sxs,sys,sxe,sye);
}
