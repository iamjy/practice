#include <stdio.h>
#include "vga.h"

vgaRegsBiosState buf;

int main()
{
	FILE *f=fopen("test.out","wb");
	vgaSaveRegsBiosState(&buf);
	fwrite(&buf,sizeof(buf),1,f);
	fclose(f);
	asm("int $0x10": :"a"(0));
	vgaRestoreRegs(&buf.regs);
	vgaRestoreBiosData(&buf.biosData);
	return 0;
}
