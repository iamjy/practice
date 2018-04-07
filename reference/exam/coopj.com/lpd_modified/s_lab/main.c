#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <fcntl.h>
#include <sys/types.h>
#include <unistd.h>
#include "mylib.h"

static struct inputData
{
	char oper[2];
	char func[10];
	char lib[30];
} inputData;

int main(int argc, char *argv[])
{
#if 0
	int fd	 = -1;
	int mode =  0;

	mode = atoi(argv[2]);
	if ((fd = open(argv[1], mode)) < 0)
	{
		perror("Failed to open file");
		exit(1);
	}

	if (fileStatus(fd, argv[1]) < 0)
	{
		printf("Failed to get %s file status", argv[1]);
		exit(2);
	}

	close(fd);
	exit(0);
#endif
#if 1
	char oper[2];
	char leftOper[11];
	char rightOper[11];
	char buf[50];
	char null[1];
	int dataNum;
	struct inputData plugNum[10];
	void *handle;
	int (*result)(int, int);
	int i;
	char *error;


#endif
}
