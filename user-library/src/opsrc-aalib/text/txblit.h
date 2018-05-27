#ifndef _txblit_h
#define _txblit_h

void TxBlitNC(TxContext *dc, int dx, int dy,
	   TxContext *sc, int sxs, int sys, int sxe, int sye);
void TxBlit(TxContext *dc, int dx, int dy,
	   TxContext *sc, int sxs, int sys, int sxe, int sye);

#endif	_txblit_h
