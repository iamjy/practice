# include <stdio.h>
# include "macro.h"

#define ABC 123
#define NUM ABC##456

int main(int argc, char const *argv[]) {
  printf("%d\n", NUM);
  return 0;
}
