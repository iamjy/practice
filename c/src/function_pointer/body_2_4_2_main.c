#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "body_2_4_2_sub.h"

int main(void)
{
  int64_t array[ARRAY_SIZE];

  do {
    fillRandom(array, ARRAY_SIZE);
    selectionSort(array, ARRAY_SIZE);
    print(array, ARRAY_SIZE);

  } while(1);

  return 0;
}
