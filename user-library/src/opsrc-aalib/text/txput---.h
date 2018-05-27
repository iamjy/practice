#ifndef _txput____h
#define _txput____h

void TxPutCtxC(TxContext *ctx, int x, int y, int c);
void TxPutCtxA(TxContext *ctx, int x, int y, int a);
void TxPutCtxCA(TxContext *ctx, int x, int y, int ca);
void TxHLineCtxC(TxContext *ctx, int x, int y, int ex, int c);
void TxHLineCtxA(TxContext *ctx, int x, int y, int ex, int a);
void TxHLineCtxCA(TxContext *ctx, int x, int y, int ex, int ca);
void TxVLineCtxC(TxContext *ctx, int x, int y, int ey, int c);
void TxVLineCtxA(TxContext *ctx, int x, int y, int ey, int a);
void TxVLineCtxCA(TxContext *ctx, int x, int y, int ey, int ca);
void TxClearCtx(TxContext *ctx, int ch, int at);
void TxClearCtxLine(TxContext *ctx, short y, int ch, int at);
void TxClearCtxEOL(TxContext *ctx, short x, short y, int ch, int at);
void TxClearCtxEOB(TxContext *ctx, short x, short y, int ch, int at);
void TxPutCtxCString(TxContext *ctx, short x, short y, const char *str, 
					 unsigned short at);
void TxPutCtxAString(TxContext *ctx, short x, short y, const char *str, 
					 const char *at);
void TxPutCtxCAString(TxContext *ctx, short x, short y, void *buf, int len);
void TxPutCtxString(TxContext *ctx, short x, short y, const char *str, 
					int at);
void TxPutC(int x, int y, int c);
void TxPutA(int x, int y, int a);
void TxPutCA(int x, int y, int ca);
void TxHLineC(int x, int y, int ex, int c);
void TxHLineA(int x, int y, int ex, int a);
void TxHLineCA(int x, int y, int ex, int ca);
void TxVLineC(int x, int y, int ey, int c);
void TxVLineA(int x, int y, int ey, int a);
void TxVLineCA(int x, int y, int ey, int ca);
void TxClear(int ch, int at);
void TxClearLine(short y, int ch, int at);
void TxClearEOL(short x, short y, int ch, int at);
void TxClearEOB(short x, short y, int ch, int at);
void TxPutCString(short x, short y, const char *str, unsigned short at);
void TxPutAString(short x, short y, const char *str, const char *at);
void TxPutCAString(short x, short y, void *buf, int len);
void TxPutString(short x, short y, const char *str, int at);

#endif	_txput____h
