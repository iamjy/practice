#include <stdint.h>
#include <stdio.h>
#include "body_1_2_2_sub.h"

int main(void)
{
  void (* func)(void) = NULL;
  uint32_t menu = 0;

  while (1)
  {
    printf("[0] quit [1] func1 [2] func2 [3] func3 - ");
    scanf("%d", &menu);

    if (menu < 0 || menu > 3)
      continue;

    if (menu == 0)
      break;

    switch (menu) {
    case 1:
      func = func1;
      break;
    case 2:
      func = func2;
      break;
    case 3:
      func = func3;
      break;
    }

    func();
  }

  return 0;
}
