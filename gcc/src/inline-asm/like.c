#include <stdio.h>

int main(void)
{
	//__asm__ __volatile__("nop");
	__asm__ __volatile__(
		"mov r0, #0xff00\n");
	return 0;
}
