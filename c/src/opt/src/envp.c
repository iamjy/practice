#include <stdio.h>

int
main (int argc, char *argv[], char *envp[])
{
	int i = 0;

	while (1)
	{
		static int nCnt = 0;
		sleep(1);
		printf("%d\n", nCnt++);
	}

	while (envp[i] != NULL)
	{
		printf("%d : %s\n", i, envp[i]);
		i++;
	}

	return 0;
}
