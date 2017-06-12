#include <stdint.h>
#include <stdio.h>
#include "body_2_3_2_sub.h"

int main(void)
{
  int array[10];
  int menu;

  while (1)
  {
    printf("[0] 종료 [1] 생성 [2] 두배 [3] 출력 - ");
    scanf("%d", &menu);

    if (menu == 0)
      break;

    switch (menu) {
    case 1: proxyFunction(fillRandom, array, 10); break;
    case 2: proxyFunction(doubleUp, array, 10); break;
    case 3: proxyFunction(print, array, 10); break;
    }
  }

  return 0;
}
