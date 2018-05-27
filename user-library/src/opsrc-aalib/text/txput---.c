#include <sys/farptr.h>
#include "libtext.h"

void TxPutCtxC(TxContext *ctx, int x, int y, int c)
{
	int offs=x+y*(1+ctx->maxx);
	if (x<ctx->clipxmin || x>ctx->clipxmax || 
		y<ctx->clipymin || y>ctx->clipymax) return;
	if (ctx->isScreen) {
		_farpokeb(ctx->buffer.selector,offs*2,c);
	} else {
		ctx->buffer.buffer[offs].ch=c;
	}
}

void TxPutCtxA(TxContext *ctx, int x, int y, int a)
{
	int offs=x+y*(1+ctx->maxx);
	if (x<ctx->clipxmin || x>ctx->clipxmax || 
		y<ctx->clipymin || y>ctx->clipymax) return;
	if (ctx->isScreen) {
		_farpokeb(ctx->buffer.selector,offs*2+1,a);
	} else {
		ctx->buffer.buffer[offs].attr=a;
	}
}

void TxPutCtxCA(TxContext *ctx, int x, int y, int ca)
{
	int offs=x+y*(1+ctx->maxx);
	if (x<ctx->clipxmin || x>ctx->clipxmax || 
		y<ctx->clipymin || y>ctx->clipymax) return;
	if (ctx->isScreen) {
		_farpokew(ctx->buffer.selector,offs*2,ca);
	} else {
		*(short*)&ctx->buffer.buffer[offs]=ca;
	}
}

void TxHLineCtxC(TxContext *ctx, int x, int y, int ex, int c)
{
	TxCell *offs;
	if (y<ctx->clipymin || y>ctx->clipymax || 
		ex<ctx->clipxmin || x>ctx->clipxmax ||
		x>ex) return;
	if (x<ctx->clipxmin) x=ctx->clipxmin;
	if (ex>ctx->clipxmax) ex=ctx->clipxmax;
	offs=(TxCell*)((x+y*(1+ctx->maxx))*2);
	if (ctx->isScreen) {
		_farsetsel(ctx->buffer.selector);
		while (x++<=ex) {
			_farnspokeb((long)(offs++),c);
		}
	} else {
		((char*)offs)+=(long)ctx->buffer.buffer;
		while (x++<=ex) {
			offs++->ch=c;
		}
	}
}

void TxHLineCtxA(TxContext *ctx, int x, int y, int ex, int a)
{
	TxCell *offs;
	if (y<ctx->clipymin || y>ctx->clipymax || 
		ex<ctx->clipxmin || x>ctx->clipxmax ||
		x>ex) return;
	if (x<ctx->clipxmin) x=ctx->clipxmin;
	if (ex>ctx->clipxmax) ex=ctx->clipxmax;
	offs=(TxCell*)((x+y*(1+ctx->maxx))*2);
	if (ctx->isScreen) {
		_farsetsel(ctx->buffer.selector);
		while (x++<=ex) {
			_farnspokeb((long)(offs++)+1,a);
		}
	} else {
		((char*)offs)+=(long)ctx->buffer.buffer;
		while (x++<=ex) {
			offs++->attr=a;
		}
	}
}

void TxHLineCtxCA(TxContext *ctx, int x, int y, int ex, int ca)
{
	TxCell *offs;
	if (y<ctx->clipymin || y>ctx->clipymax || 
		ex<ctx->clipxmin || x>ctx->clipxmax ||
		x>ex) return;
	if (x<ctx->clipxmin) x=ctx->clipxmin;
	if (ex>ctx->clipxmax) ex=ctx->clipxmax;
	offs=(TxCell*)((x+y*(1+ctx->maxx))*2);
	if (ctx->isScreen) {
		_farsetsel(ctx->buffer.selector);
		while (x++<=ex) {
			_farnspokew((long)(offs++),ca);
		}
	} else {
		((char*)offs)+=(long)ctx->buffer.buffer;
		while (x++<=ex) {
			*(short*)(offs++)=ca;
		}
	}
}

void TxVLineCtxC(TxContext *ctx, int x, int y, int ey, int c)
{
	TxCell *offs;
	if (ey<ctx->clipymin || y>ctx->clipymax || 
		x<ctx->clipxmin || x>ctx->clipxmax ||
		y>ey) return;
	if (y<ctx->clipymin) y=ctx->clipymin;
	if (ey>ctx->clipymax) ey=ctx->clipymax;
	offs=(TxCell*)((x+y*(1+ctx->maxx))*2);
	if (ctx->isScreen) {
		_farsetsel(ctx->buffer.selector);
		while (y++<=ey) {
			_farnspokeb((long)offs,c);
			offs+=(ctx->maxx+1);
		}
	} else {
		((char*)offs)+=(long)ctx->buffer.buffer;
		while (y++<=ey) {
			offs->ch=c;
			offs+=(ctx->maxx+1);
		}
	}
}

void TxVLineCtxA(TxContext *ctx, int x, int y, int ey, int a)
{
	TxCell *offs;
	if (ey<ctx->clipymin || y>ctx->clipymax || 
		x<ctx->clipxmin || x>ctx->clipxmax ||
		y>ey) return;
	if (y<ctx->clipymin) y=ctx->clipymin;
	if (ey>ctx->clipymax) ey=ctx->clipymax;
	offs=(TxCell*)((x+y*(1+ctx->maxx))*2);
	if (ctx->isScreen) {
		_farsetsel(ctx->buffer.selector);
		while (y++<=ey) {
			_farnspokeb(((long)offs)+1,a);
			offs+=(ctx->maxx+1);
		}
	} else {
		((char*)offs)+=(long)ctx->buffer.buffer;
		while (y++<=ey) {
			offs->attr=a;
			offs+=(ctx->maxx+1);
		}
	}
}

void TxVLineCtxCA(TxContext *ctx, int x, int y, int ey, int ca)
{
	TxCell *offs;
	if (ey<ctx->clipymin || y>ctx->clipymax || 
		x<ctx->clipxmin || x>ctx->clipxmax ||
		y>ey) return;
	if (y<ctx->clipymin) y=ctx->clipymin;
	if (ey>ctx->clipymax) ey=ctx->clipymax;
	offs=(TxCell*)((x+y*(1+ctx->maxx))*2);
	if (ctx->isScreen) {
		_farsetsel(ctx->buffer.selector);
		while (y++<=ey) {
			_farnspokew((long)offs,ca);
			offs+=(ctx->maxx+1);
		}
	} else {
		((char*)offs)+=(long)ctx->buffer.buffer;
		while (y++<=ey) {
			*(short*)offs=ca;
			offs+=(ctx->maxx+1);
		}
	}
}

void TxClearCtx(TxContext *ctx, int ch, int at)
{
	int i;
	for (i=0; i<=TxCtxMaxy(ctx); i++) {
		TxHLineCtxCA(ctx,0,i,TxCtxMaxx(ctx),ch|(at<<8));
	}
}

void TxClearCtxLine(TxContext *ctx, short y, int ch, int at)
{
	TxHLineCtxCA(ctx,0,y,TxCtxMaxx(ctx),ch|(at<<8));
}

void TxClearCtxEOL(TxContext *ctx, short x, short y, int ch, int at)
{
	TxHLineCtxCA(ctx,x,y,TxCtxMaxx(ctx),ch|(at<<8));
}

void TxClearCtxEOB(TxContext *ctx, short x, short y, int ch, int at)
{
	int i;
	TxHLineCtxCA(ctx,x,y,TxCtxMaxx(ctx),ch|(at<<8));
	for (i=y+1; i<=TxCtxMaxy(ctx); i++) {
		TxHLineCtxCA(ctx,0,i,TxCtxMaxx(ctx),ch|(at<<8));
	}
}


void TxPutCtxCString(TxContext *ctx, short x, short y, const char *str, 
					 unsigned short at)
{
	while (*str) {
		if (*str=='~') {
			asm ("
				rolw	$8,%0
				"
				:"=mr"(at)
				:"mr"(at)
			);
			str++;
		} else {
			TxPutCtxCA(ctx,x++,y,((unsigned char)*str++)|(at<<8));
		}
	}
}

void TxPutCtxAString(TxContext *ctx, short x, short y, const char *str, 
					 const char *at)
{
	while (*str) {
		TxPutCtxCA(ctx,x++,y,((unsigned char)*str++)|(*at++<<8));
	}
}

void TxPutCtxCAString(TxContext *ctx, short x, short y, void *buf, int len)
{
	short *b=(short*)buf;
	while (len--) {
		TxPutCtxCA(ctx,x++,y,*b++);
	}
}

void TxPutCtxString(TxContext *ctx, short x, short y, const char *str, 
					int at)
{
	while (*str) {
		TxPutCtxCA(ctx,x++,y,((unsigned char)*str++)|(at<<8));
	}
}

void TxPutC(int x, int y, int c)
{
	int offs=x+y*(1+CurrentContext.maxx);
	if (x<CurrentContext.clipxmin || x>CurrentContext.clipxmax || 
		y<CurrentContext.clipymin || y>CurrentContext.clipymax) return;
	if (CurrentContext.isScreen) {
		_farpokeb(CurrentContext.buffer.selector,offs*2,c);
	} else {
		CurrentContext.buffer.buffer[offs].ch=c;
	}
}

void TxPutA(int x, int y, int a)
{
	int offs=x+y*(1+CurrentContext.maxx);
	if (x<CurrentContext.clipxmin || x>CurrentContext.clipxmax || 
		y<CurrentContext.clipymin || y>CurrentContext.clipymax) return;
	if (CurrentContext.isScreen) {
		_farpokeb(CurrentContext.buffer.selector,offs*2+1,a);
	} else {
		CurrentContext.buffer.buffer[offs].attr=a;
	}
}

void TxPutCA(int x, int y, int ca)
{
	int offs=x+y*(1+CurrentContext.maxx);
	if (x<CurrentContext.clipxmin || x>CurrentContext.clipxmax || 
		y<CurrentContext.clipymin || y>CurrentContext.clipymax) return;
	if (CurrentContext.isScreen) {
		_farpokew(CurrentContext.buffer.selector,offs*2,ca);
	} else {
		*(short*)&CurrentContext.buffer.buffer[offs]=ca;
	}
}

void TxHLineC(int x, int y, int ex, int c)
{
	TxCell *offs;
	if (y<CurrentContext.clipymin || y>CurrentContext.clipymax || 
		ex<CurrentContext.clipxmin || x>CurrentContext.clipxmax ||
		x>ex) return;
	if (x<CurrentContext.clipxmin) x=CurrentContext.clipxmin;
	if (ex>CurrentContext.clipxmax) ex=CurrentContext.clipxmax;
	offs=(TxCell*)((x+y*(1+CurrentContext.maxx))*2);
	if (CurrentContext.isScreen) {
		_farsetsel(CurrentContext.buffer.selector);
		while (x++<=ex) {
			_farnspokeb((long)(offs++),c);
		}
	} else {
		((char*)offs)+=(long)CurrentContext.buffer.buffer;
		while (x++<=ex) {
			offs++->ch=c;
		}
	}
}

void TxHLineA(int x, int y, int ex, int a)
{
	TxCell *offs;
	if (y<CurrentContext.clipymin || y>CurrentContext.clipymax || 
		ex<CurrentContext.clipxmin || x>CurrentContext.clipxmax ||
		x>ex) return;
	if (x<CurrentContext.clipxmin) x=CurrentContext.clipxmin;
	if (ex>CurrentContext.clipxmax) ex=CurrentContext.clipxmax;
	offs=(TxCell*)((x+y*(1+CurrentContext.maxx))*2);
	if (CurrentContext.isScreen) {
		_farsetsel(CurrentContext.buffer.selector);
		while (x++<=ex) {
			_farnspokeb((long)(offs++)+1,a);
		}
	} else {
		((char*)offs)+=(long)CurrentContext.buffer.buffer;
		while (x++<=ex) {
			offs++->attr=a;
		}
	}
}

void TxHLineCA(int x, int y, int ex, int ca)
{
	TxCell *offs;
	if (y<CurrentContext.clipymin || y>CurrentContext.clipymax || 
		ex<CurrentContext.clipxmin || x>CurrentContext.clipxmax ||
		x>ex) return;
	if (x<CurrentContext.clipxmin) x=CurrentContext.clipxmin;
	if (ex>CurrentContext.clipxmax) ex=CurrentContext.clipxmax;
	offs=(TxCell*)((x+y*(1+CurrentContext.maxx))*2);
	if (CurrentContext.isScreen) {
		_farsetsel(CurrentContext.buffer.selector);
		while (x++<=ex) {
			_farnspokew((long)(offs++),ca);
		}
	} else {
		((char*)offs)+=(long)CurrentContext.buffer.buffer;
		while (x++<=ex) {
			*(short*)(offs++)=ca;
		}
	}
}

void TxVLineC(int x, int y, int ey, int c)
{
	TxCell *offs;
	if (ey<CurrentContext.clipymin || y>CurrentContext.clipymax || 
		x<CurrentContext.clipxmin || x>CurrentContext.clipxmax ||
		y>ey) return;
	if (y<CurrentContext.clipymin) y=CurrentContext.clipymin;
	if (ey>CurrentContext.clipymax) ey=CurrentContext.clipymax;
	offs=(TxCell*)((x+y*(1+CurrentContext.maxx))*2);
	if (CurrentContext.isScreen) {
		_farsetsel(CurrentContext.buffer.selector);
		while (y++<=ey) {
			_farnspokeb((long)offs,c);
			offs+=(CurrentContext.maxx+1);
		}
	} else {
		((char*)offs)+=(long)CurrentContext.buffer.buffer;
		while (y++<=ey) {
			offs->ch=c;
			offs+=(CurrentContext.maxx+1);
		}
	}
}

void TxVLineA(int x, int y, int ey, int a)
{
	TxCell *offs;
	if (ey<CurrentContext.clipymin || y>CurrentContext.clipymax || 
		x<CurrentContext.clipxmin || x>CurrentContext.clipxmax ||
		y>ey) return;
	if (y<CurrentContext.clipymin) y=CurrentContext.clipymin;
	if (ey>CurrentContext.clipymax) ey=CurrentContext.clipymax;
	offs=(TxCell*)((x+y*(1+CurrentContext.maxx))*2);
	if (CurrentContext.isScreen) {
		_farsetsel(CurrentContext.buffer.selector);
		while (y++<=ey) {
			_farnspokeb(((long)offs)+1,a);
			offs+=(CurrentContext.maxx+1);
		}
	} else {
		((char*)offs)+=(long)CurrentContext.buffer.buffer;
		while (y++<=ey) {
			offs->attr=a;
			offs+=(CurrentContext.maxx+1);
		}
	}
}

void TxVLineCA(int x, int y, int ey, int ca)
{
	TxCell *offs;
	if (ey<CurrentContext.clipymin || y>CurrentContext.clipymax || 
		x<CurrentContext.clipxmin || x>CurrentContext.clipxmax ||
		y>ey) return;
	if (y<CurrentContext.clipymin) y=CurrentContext.clipymin;
	if (ey>CurrentContext.clipymax) ey=CurrentContext.clipymax;
	offs=(TxCell*)((x+y*(1+CurrentContext.maxx))*2);
	if (CurrentContext.isScreen) {
		_farsetsel(CurrentContext.buffer.selector);
		while (y++<=ey) {
			_farnspokew((long)offs,ca);
			offs+=(CurrentContext.maxx+1);
		}
	} else {
		((char*)offs)+=(long)CurrentContext.buffer.buffer;
		while (y++<=ey) {
			*(short*)offs=ca;
			offs+=(CurrentContext.maxx+1);
		}
	}
}

void TxClear(int ch, int at)
{
	int i;
	for (i=0; i<=TxMaxy(); i++) {
		TxHLineCA(0,i,TxMaxx(),ch|(at<<8));
	}
}

void TxClearLine(short y, int ch, int at)
{
	TxHLineCA(0,y,TxMaxx(),ch|(at<<8));
}

void TxClearEOL(short x, short y, int ch, int at)
{
	TxHLineCA(x,y,TxMaxx(),ch|(at<<8));
}

void TxClearEOB(short x, short y, int ch, int at)
{
	int i;
	TxHLineCA(x,y,TxMaxx(),ch|(at<<8));
	for (i=y+1; i<=TxMaxy(); i++) {
		TxHLineCA(0,i,TxMaxx(),ch|(at<<8));
	}
}


void TxPutCString(short x, short y, const char *str, 
					 unsigned short at)
{
	while (*str) {
		if (*str=='~') {
			asm ("
				rolw	$8,%0
				"
				:"=mr"(at)
				:"mr"(at)
			);
			str++;
		} else {
			TxPutCA(x++,y,((unsigned char)*str++)|(at<<8));
		}
	}
}

void TxPutAString(short x, short y, const char *str, const char *at)
{
	while (*str) {
		TxPutCA(x++,y,((unsigned char)*str++)|(*at++<<8));
	}
}

void TxPutCAString(short x, short y, void *buf, int len)
{
	short *b=(short*)buf;
	while (len--) {
		TxPutCA(x++,y,*b++);
	}
}

void TxPutString(short x, short y, const char *str, int at)
{
	while (*str) {
		TxPutCA(x++,y,((unsigned char)*str++)|(at<<8));
	}
}
