#include "apue.h"
#include <stdint.h>

#define BUFFSIZE 4096

int32_t main(void)
{
	int32_t n;
	char    buf[BUFFSIZE];

	while ((n = read(STDIN_FILENO, buf, BUFFSIZE)) > 0)
	{
		if (write(STDOUT_FILENO, buf, n) != n)
		{
			perror("write error\n");
			exit(-1);
		}
	}

	if (n < 0)
	{
		perror("read error\n");
		exit(-1);
	}

	return 0;
}
