#include <stdio.h>
#include <stdbool.h>

bool func(void)
{
	return 1;
}

int main(int argc, char *argv[])
{
	printf("%d\n", func());
	return 0;
}
