#include <stdio.h>

int test1(int x)
{
	int i, j = 1;

	for (i = 1; i <= x; i++) {
		j *= i;
	}

	return 0;
}

int test2(int x)
{
	int i, j = 1;

	for (i = 1; i != 0; i--) {
		j *= i;
	}

	return 0;
}

int main(int argv, char *argc[])
{
	return 0;
}
