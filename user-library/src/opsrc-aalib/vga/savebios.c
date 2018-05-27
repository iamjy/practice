#include <sys/farptr.h>
#include <go32.h>
#include "vga.h"

void *vgaSaveBiosData(vgaBiosData *data)
{
	unsigned long offset;
	_farsetsel(_dos_ds);
	for (offset=0x449; offset<=0x466; offset++) {
		*((char*)data)++=_farnspeekb(offset);
	}
	for (offset=0x484; offset<=0x48a; offset++) {
		*((char*)data)++=_farnspeekb(offset);
	}
	return data;
}

void *vgaRestoreBiosData(vgaBiosData *data)
{
	unsigned long offset;
	_farsetsel(_dos_ds);
	for (offset=0x449; offset<=0x466; offset++) {
		_farnspokeb(offset,*((char*)data)++);
	}
	for (offset=0x484; offset<=0x48a; offset++) {
		_farnspokeb(offset,*((char*)data)++);
	}
	return data;
}
