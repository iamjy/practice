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

int main()
{
	int32_t l1 = 0;
	volatile int32_t l2 = 0;

	loop1(&l1);
	loop2(&l2);

	return 0;
}
