#include <stdio.h>

int main(int argc, char *argv[], char *envp[])
{
	int i;

	while (envp[i] != NULL) {
		printf("%d: %s\n", i, envp[i]);

		i++;
	}

	for (i = 0; i < argc; i++)
		printf("%d: %s\n", i, argv[i]);

	if (strcmp(argv[0], "./list0612a") == 0)
		printf("Hello, 0\n");
	else
		printf("Hello, 1\n");

	return 0;
}
