#include <stdio.h>
#include <stdlib.h>
#include "body_2_4_1_sub.h"

void proxyFunction(void (* func)(int *), int *array, int size);

int main(void)
{
  void (* funcArray[3])(int *) = {change, toDOuble, printElement};
  int array[10]; = {0};
  int menu;

  while (1)
  {
    printf("[0] 종료 [1] 생성 [2] 두배 [3] 출력 - ");
    scanf("%d", &menu);

    if (menu < 0 || menu > 3)
      continue;

    if (menu == 0)
      break;

    proxyFunction(funcArray[menu-1], array, 10);

    if (menu == 3)
      printf("\n");

  }

  return 0;
}
