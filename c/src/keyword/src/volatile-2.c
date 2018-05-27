#include <stdint.h>

int32_t loop1(int32_t *addr)
{
	int32_t i;

	for (i = 0; i < 10; i++)
		*addr += 1;

	return i;
}

int32_t loop2(volatile int32_t *addr)
{
	int32_t i;

	for (i = 0; i < 10; i++)
		*addr += 1;

	return i;
}
