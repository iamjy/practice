#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define BUFF_SIZE	256

int
main (int argc, char *argv[])
{
	int n;
	char buf[BUFF_SIZE] = {'\0'};

	while ((n = read(STDIN_FILENO, buf, BUFF_SIZE) > 0))
	{
		printf("n %d\n", n);
		if (write(STDOUT_FILENO, buf, n) != n)
			fprintf(stderr, "write error");
	}

	if (n < 0)
		fprintf(stderr, "read error");

	exit(0);
}
