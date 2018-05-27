#ifndef _txcursor_h
#define _txcursor_h

short TxGetCursor(void);
void TxSetCursor(int top, int bot);
void _TxSetCursor(int curs);
void TxGotoxy(int x, int y);
void TxGetxy(int *x, int *y);

#endif	_txcursor_h
