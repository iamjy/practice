#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

void fillRandom(int64_t *array, size_t size)
{
  for (size_t i = 0; i < size; i++)
    array[i] = rand() % 100;
}

void print(int64_t *array, size_t size)
{
  for (size_t i = 0; i < size; i++) {
    printf("%3ld", array[i]);

    if (i % 10 == 9)
      printf("\n");
  }
}

void selection(int64_t *array, size_t size)
{
  int64_t maxPos = 0;
  size_t i;

  for (i = 0; i < size; i++) {
    if (array[i] > array[maxPos])
      maxPos = i;
  }

  i = array[maxPos];
  array[maxPos] = array[size-1];
  array[size-1] = i;
}

void selectionSort(int64_t *array, size_t size)
{
  for (size_t i = size; i > 1; i--)
    selection(array, i);
}
