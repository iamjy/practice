#include <stdio.h>
#include <stdint.h>
#include <errno.h>
#include <stdlib.h>

int32_t main(int32_t argc, int8_t *argv[])
{
	if (argc - 1 == 0)
	{
		printf("There is no option\n");
		exit(-1);
	}
	else
	{
		int32_t i = 0;

		for (i = 0; i < argc; i++)
		{
			printf("%s\n", argv[i]);
		}
	}

	return 0;
}
