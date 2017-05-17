#include <stdio.h>
#include "body_2_4_1_sub.h"

void change(int *pn)
{
  *pn = rand() % 100;
}

void toDOuble(int *pn)
{
  *pn *= 2;
}

void printElement(int *pn)
{
  printf("%3d", *pn);
}
