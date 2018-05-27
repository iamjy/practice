#ifndef _txcontext_h
#define _txcontext_h

typedef struct {
	unsigned char
    	ch,attr;
} TxCell;

typedef struct {
	int
		maxx,
		maxy;
	int
		clipxmin,
		clipymin,
		clipxmax,
		clipymax;
	union {
		TxCell *buffer;
		short selector;
	} buffer;
	unsigned
		myContext:1,
		myBuffer:1,
		isScreen:1;
} TxContext;

extern TxContext
	CurrentContext,
	ScreenContext;

#define TxMaxx()  (CurrentContext.maxx)
#define TxMaxy()  (CurrentContext.maxy)
#define TxSizex() (CurrentContext.maxx+1)
#define TxSizey() (CurrentContext.maxy+1)

#define TxScreenMaxx()  (ScreenContext.maxx)
#define TxScreenMaxy()  (ScreenContext.maxy)
#define TxScreenSizex() (ScreenContext.maxx+1)
#define TxScreenSizey() (ScreenContext.maxy+1)

#define TxCtxMaxx(ctx)  ((ctx)->maxx)
#define TxCtxMaxy(ctx)  ((ctx)->maxy)
#define TxCtxSizex(ctx) ((ctx)->maxx+1)
#define TxCtxSizey(ctx) ((ctx)->maxy+1)

TxContext *TxCreateContext(int w, int h, TxContext *c, TxCell *b);
void TxDestroyContext(TxContext *c);
TxContext *TxSaveContext(TxContext *c);
void TxSetContext(TxContext *c);
void TxSetClipBoxCtx(TxContext *ctx, int xmin, int ymin, int xmax, int ymax);
void TxResetClipBoxCtx(TxContext *ctx);
void TxSetClipBox(int xmin, int ymin, int xmax, int ymax);
void TxResetClipBox(void);

#endif _txcontext_h
