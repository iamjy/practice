#include <stdio.h>

int i = 123;

void set_i(int n);

int main(int argc, char *argv[])
{
	set_i(7);
	printf("i = %d\n", i);

	return 0;
}
