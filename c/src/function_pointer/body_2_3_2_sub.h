#include <stdint.h>

typedef void (* func_t)(int *, int);

void fillRandom(int *array, int size);
void doubleUp(int *array, int size);
void print(int *array, int size);
void proxyFunction(func_t func, int *array, int size);
