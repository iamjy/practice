#include <stdio.h>

void hello(void);
void proxyHello(void (* func)(void));

void main(void)
{
  int i;

  for (i = 0; i < 5; i++)
    proxyHello(hello);
}
