#include <malloc.h>
#include <string.h>
#include "libtext.h"

#define SCREEN_CONTEXT	\
{						\
	79,24,				\
	0,0,79,24,			\
	{0},				\
	0,0,1				\
}

TxContext
	CurrentContext=SCREEN_CONTEXT,
	ScreenContext=SCREEN_CONTEXT;

TxContext *TxCreateContext(int w, int h, TxContext *c, TxCell *b)
{
	if (!c) {
		c=(TxContext*)calloc(1,sizeof(TxContext));
		c->myContext=1;
	} else {
		memset(c,0,sizeof(TxContext));
	}
	if (!b) {
		b=(TxCell*)malloc(w*h*sizeof(TxCell));
		c->myBuffer=1;
	}
	c->buffer.buffer=b;
	c->clipxmax=c->maxx=w-1;
	c->clipymax=c->maxy=h-1;
	c->clipxmin=c->clipymin=0;
	return c;
}

void TxDestroyContext(TxContext *c)
{
	if (c->myBuffer) free(c->buffer.buffer);
	if (c->myContext) free(c);
}

TxContext *TxSaveContext(TxContext *c)
{
	if (!c) {
		c=(TxContext*)malloc(sizeof(TxContext));
        *c=CurrentContext;
		c->myContext=1;
	} else {
		*c=CurrentContext;
		c->myContext=0;
	}
	c->myBuffer=0;
	return c;
}

void TxSetContext(TxContext *c)
{
	if (!c) {
		c=&ScreenContext;
	}
	CurrentContext=*c;
}

void TxSetClipBoxCtx(TxContext *ctx, int xmin, int ymin, int xmax, int ymax)
{
	if (xmin<0) xmin=0;
	if (ymin<0) ymin=0;
	if (xmax>ctx->maxx) xmax=ctx->maxx;
	if (ymax>ctx->maxy) ymax=ctx->maxy;

	ctx->clipxmin=xmin;
	ctx->clipxmax=xmax;
	ctx->clipymin=ymin;
	ctx->clipymax=ymax;
}

void TxResetClipBoxCtx(TxContext *ctx)
{
	ctx->clipxmin=0;
	ctx->clipymin=0;
	ctx->clipxmax=ctx->maxx;
	ctx->clipymax=ctx->maxy;
}

void TxSetClipBox(int xmin, int ymin, int xmax, int ymax)
{
	if (xmin<0) xmin=0;
	if (ymin<0) ymin=0;
	if (xmax>CurrentContext.maxx) xmax=CurrentContext.maxx;
	if (ymax>CurrentContext.maxy) ymax=CurrentContext.maxy;

	CurrentContext.clipxmin=xmin;
	CurrentContext.clipxmax=xmax;
	CurrentContext.clipymin=ymin;
	CurrentContext.clipymax=ymax;
}

void TxResetClipBox(void)
{
	CurrentContext.clipxmin=0;
	CurrentContext.clipymin=0;
	CurrentContext.clipxmax=CurrentContext.maxx;
	CurrentContext.clipymax=CurrentContext.maxy;
}
