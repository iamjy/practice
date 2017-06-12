#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

int main(int argc, char const *argv[]) {
  int array[10] = {0,};
  int *ptrArray[10];

	for (int i = 0; i < 0; i++)
  {
    array[i] = i;
    ptrArray[i] = &array[i];

    printf("array[%d] ptrArray[%d]\n", array[i], ptrArray[i]);
  }

 	return 0;
}
