#include <sys/farptr.h>
#include "libtext.h"

int TxGetCtxC(TxContext *ctx, int x, int y)
{
	int offs=x+y*(1+ctx->maxx);
	if (x<ctx->clipxmin || x>ctx->clipxmax || 
		y<ctx->clipymin || y>ctx->clipymax) return -1;
	if (ctx->isScreen) {
		return _farpeekb(ctx->buffer.selector,offs*2);
	} else {
		return ctx->buffer.buffer[offs].ch;
	}
}

int TxGetCtxA(TxContext *ctx, int x, int y)
{
	int offs=x+y*(1+ctx->maxx);
	if (x<ctx->clipxmin || x>ctx->clipxmax || 
		y<ctx->clipymin || y>ctx->clipymax) return -1;
	if (ctx->isScreen) {
		return _farpeekb(ctx->buffer.selector,offs*2+1);
	} else {
		return ctx->buffer.buffer[offs].attr;
	}
}

int TxGetCtxCA(TxContext *ctx, int x, int y)
{
	int offs=x+y*(1+ctx->maxx);
	if (x<ctx->clipxmin || x>ctx->clipxmax || 
		y<ctx->clipymin || y>ctx->clipymax) return -1;
	if (ctx->isScreen) {
		return _farpeekw(ctx->buffer.selector,offs*2);
	} else {
		return *(short*)&ctx->buffer.buffer[offs];
	}
}

int TxGetC(int x, int y)
{
	int offs=x+y*(1+CurrentContext.maxx);
	if (x<CurrentContext.clipxmin || x>CurrentContext.clipxmax || 
		y<CurrentContext.clipymin || y>CurrentContext.clipymax) return -1;
	if (CurrentContext.isScreen) {
		return _farpeekb(CurrentContext.buffer.selector,offs*2);
	} else {
		return CurrentContext.buffer.buffer[offs].ch;
	}
}

int TxGetA(int x, int y)
{
	int offs=x+y*(1+CurrentContext.maxx);
	if (x<CurrentContext.clipxmin || x>CurrentContext.clipxmax || 
		y<CurrentContext.clipymin || y>CurrentContext.clipymax) return -1;
	if (CurrentContext.isScreen) {
		return _farpeekb(CurrentContext.buffer.selector,offs*2+1);
	} else {
		return CurrentContext.buffer.buffer[offs].attr;
	}
}

int TxGetCA(int x, int y)
{
	int offs=x+y*(1+CurrentContext.maxx);
	if (x<CurrentContext.clipxmin || x>CurrentContext.clipxmax || 
		y<CurrentContext.clipymin || y>CurrentContext.clipymax) return -1;
	if (CurrentContext.isScreen) {
		return _farpeekw(CurrentContext.buffer.selector,offs*2);
	} else {
		return *(short*)&CurrentContext.buffer.buffer[offs];
	}
}
