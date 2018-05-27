#include "vga.h"

void *vgaSaveRegsBiosState(vgaRegsBiosState *buf)
{
	return vgaSaveBiosData((vgaBiosData*)vgaSaveRegs((vgaRegs*)buf));
}

void *vgaRestoreRegsBiosState(vgaRegsBiosState *buf)
{
	return vgaRestoreBiosData((vgaBiosData*)vgaRestoreRegs((vgaRegs*)buf));
}
