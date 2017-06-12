#include <stdio.h>
#include "body_1_3_1_sub.h"

int main(int argc, char *argv[])
{
  void (* func[])(void) = {func1, func2, func3};
  uint32_t menu = 0;

  while (1)
  {
    printf("[0] quit [1] func1 [2] func2 [3] func3 - ");
    scanf("%d", &menu);

    if (menu < 0 || menu > 3)
      continue;

    if (menu == 0)
      break;

    func[menu - 1]();
  }

  return 0;
}
