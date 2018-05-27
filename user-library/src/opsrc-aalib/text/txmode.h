#ifndef _txmode_h
#define _txmode_h

int TxSetMode(int m);
void TxSetFont(void *font, int fntHeight, int mode);
int TxGetFont(void *font);
void TxGetModeInfo(int m,int *x,int *y);

#endif  _txmode_h
