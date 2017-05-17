#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <mqueue.h>

int
main(int argc, char *argv[])
{
    if (argc != 2 || strcmp(argv[1], "--help") == 0)
    {
        fprintf(stderr, "%s mq-name\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    if (mq_unlink(argv[1]) == -1)
    {
        perror("Failed to unlink message queue\n");
        exit(EXIT_FAILURE);
    }

    exit(EXIT_SUCCESS);
}

