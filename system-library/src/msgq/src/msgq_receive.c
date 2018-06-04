#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <mqueue.h>

static void
usageError(const char *progName)
{
    fprintf(stderr, "Usage: %s [-n] name\n", progName);
    fprintf(stderr, " -n Use O_NONBLOCK flag\n");

    exit(EXIT_FAILURE);
}

int
main(int argc, char *argv[])
{

    mqd_t          mqd;
    struct mq_attr attr;
    uint32_t       prio;
    int32_t        flags;
    int32_t        opt;
    void           *buffer;
    ssize_t        numRead;

    flags = O_RDONLY;

    while ((opt = getopt(argc, argv, "n")) != -1) {
        switch (opt) {
        case 'n': flags |= O_NONBLOCK;
            break;
        default:
            usageError(argv[0]);
        }
    }

    if (optind >= argc)
    {
        usageError(argv[0]);
    }

    mqd = mq_open(argv[optind], flags);
    if (mqd == (mqd_t) -1)
    {
        perror("Failed to create message queue");
        exit(EXIT_FAILURE);
    }

    if (mq_getattr(mqd, &attr) == -1)
    {
        perror("Failed to get message queue attribution");
        exit(EXIT_FAILURE);
    }

    buffer = malloc(attr.mq_msgsize);
    if (buffer == NULL)
    {
        fprintf(stderr, "Failed to allocate memory");
        exit(EXIT_FAILURE);
    }

    numRead = mq_receive(mqd, buffer, attr.mq_msgsize, &prio);
    if (numRead == -1)
    {
        perror("Failed to receive message\n");
        exit(EXIT_FAILURE);
    }

    printf("Read %ld bytes; priority = %u\n", (long) numRead, prio);

    if (write(STDOUT_FILENO, buffer, numRead) == -1)
    {
        printf("write");
    }

    write(STDOUT_FILENO, "\n", 1);

    exit(EXIT_SUCCESS);
}

