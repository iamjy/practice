#include <malloc.h>
#include <go32.h>
#include <dpmi.h>
#include <pc.h>
#include <dos.h>
#include "libtext.h"
#include "vga.h"
extern int __vesamode;

static vgaRegsBiosState modeBuff;
static char fontBuff[0x10001];

void TxSetupSelector(void);

static void saveTextMode()
{
	vgaSaveRegsBiosState(&modeBuff);
}
extern int __vesamode;
static void restoreTextMode()
{	union REGS regs;
	if(__vesamode) {
		regs.h.ah = 0x00;
		regs.h.al = 0x03;
		int86(0x10, &regs, &regs);
	}
	vgaRestoreRegsBiosState(&modeBuff);
}

void TxInit(void)
{
	TxSetupSelector();
	saveTextMode();
	if (modeBuff.biosData.screenData[0]<=0x03) {
		fontBuff[0x10000]=TxGetFont(fontBuff);
	}
}

void TxUninit(void)
{
	restoreTextMode();
	if (modeBuff.biosData.screenData[0]<=0x03) {
		TxSetFont(fontBuff,fontBuff[0x10000],1);
	}
}
