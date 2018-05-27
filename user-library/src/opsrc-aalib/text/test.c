#include <stdlib.h>
#include "libtext.h"
void __crt0_load_environment_file(char *app_name){}

int TxSetMode(int);
void TxBlit(TxContext *dc, int dx, int dy,
	   TxContext *sc, int sxs, int sys, int sxe, int sye);
void TxPutCA(int x, int y, int ca);

int main(int argc, char **argv)
{
	int i,j;
	TxContext *c,*s;
	TxInit();
	if (argc>1)
		TxSetMode(atoi(argv[1]));
	else
		TxSetMode(0x8c);
	c=TxCreateContext(CurrentContext.maxx+1,CurrentContext.maxy+1,0,0);
	s=TxCreateContext(CurrentContext.maxx+1,CurrentContext.maxy+1,0,0);
	TxBlit(s,0,0,&ScreenContext,0,0,s->maxx,s->maxy);
	TxSetContext(c);        
	for (j=0; j<c->maxy+1; j++) {
		for (i=0; i<c->maxx+1; i++) {
			int k=i+j*(c->maxx+1);
			TxPutCA(i,j,(k%256)+(k%128)*256);
		}
	}
	TxSetContext(0);
	TxPutCA(0,0,0xcf00|'*');
	TxBlit(&ScreenContext,0,0,c,0,0,c->maxx,c->maxy);
	if (!getch()) getch();
	for (i=0; i<4; i++)
		TxBlit(0,3,3,0,3,4,c->maxx-3,c->maxy-3);
	if (!getch()) getch();
	TxBlit(&ScreenContext,0,0,c,0,0,c->maxx,c->maxy);
	for (i=0; i<4; i++)
		TxBlit(0,3,3,0,4,3,c->maxx-3,c->maxy-3);
	if (!getch()) getch();
	TxBlit(&ScreenContext,0,0,c,0,0,c->maxx,c->maxy);
	for (i=0; i<4; i++)
		TxBlit(0,3,3,0,3,2,c->maxx-3,c->maxy-3);
	if (!getch()) getch();
	TxBlit(&ScreenContext,0,0,c,0,0,c->maxx,c->maxy);
	for (i=0; i<4; i++)
		TxBlit(0,3,3,0,2,3,c->maxx-3,c->maxy-3);
	if (!getch()) getch();
	TxBlit(&ScreenContext,0,0,s,0,0,s->maxx,s->maxy);
	TxUninit();
	return 0;
}
