#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <fcntl.h>
#include <sys/types.h>
#include <unistd.h>

int fileStatus(int fd, char *pFile)
{
	int flag;

	if ((flag = fcntl(fd, F_GETFL)) == -1)
	{
		perror("Failed to get pFile status flags");
		return -1;
	}

	switch (flag & O_ACCMODE)
	{
	case O_RDONLY :
		printf("%s is read only file\n", pFile);
		break;
	case O_WRONLY :
		printf("%s is write only file\n", pFile);
		break;
	case O_RDWR :
		printf("%s si read-write file\n", pFile);
		break;
	default :
		printf("no such mode\n");
		break;
	}

	return 0;
}
