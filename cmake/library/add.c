#include <stdio.h>

void add ()
{
  #ifdef QUICKADD
  printf("QUICKADD is defined\n");
  #endif
}
