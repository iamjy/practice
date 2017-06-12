#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "body_2_3_2_sub.h"

void fillRandom(int *array, int size)
{
  uint32_t i;

  for (i = 0; i < size; i++)
    array[i] = rand() % 100;
}

void doubleUp(int *array, int size)
{
  uint32_t i;

  for (i = 0; i < size; i++)
    array[i] *= 2;
}

void print(int *array, int size)
{
  uint32_t i;

  for (i = 0; i < size; i++)
    printf("%3d", array[i]);

  printf("\n");
}

void proxyFunction(func_t func, int *array, int size)
{
  func(array, size);
}
