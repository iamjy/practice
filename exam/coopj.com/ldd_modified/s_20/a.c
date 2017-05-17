#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>

int main(void)
{
	int fd = -1;
	int i = 99;
	char buf[100];
	size_t size = 0;

	fd = open("/dev/mycdrv", O_WRONLY);
	if (fd < 0)
	{
		perror("Failed to open device file");
		exit(errno);
	}

	while(i)
	{
		printf("%d %d %ld\n", fd, i, size);
		buf[i] = i;
		size = sizeof(int);
		size = write(fd, &buf[i], size);

		i--;
	}

	close(fd);

	return 0;
}
