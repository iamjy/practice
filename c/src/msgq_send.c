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
    fprintf(stderr, "Usage: %s [-n] name msg [prio]\n", progName);
    fprintf(stderr, " -n Use O_NONBLOCK flag\n");

    exit(EXIT_FAILURE);
}

int
main(int argc, char *argv[])
{
    mqd_t    mqd;
    uint32_t prio;
    int32_t  flags;
    int32_t  opt;

    flags = O_WRONLY;

    while ((opt = getopt(argc, argv, "n")) != -1) {
        switch (opt) {
        case 'n': flags |= O_NONBLOCK;
            break;
        default:
            usageError(argv[0]);
        }
    }

    if (optind + 1 >= argc)
    {
        usageError(argv[0]);
    }

    mqd = mq_open(argv[optind], flags);
    if (mqd == (mqd_t) -1)
    {
        perror("Failed to create message queue");
        exit(EXIT_FAILURE);
    }

    prio = (argc > optind + 2) ? atoi(argv[optind + 2]) : 0;

    if (mq_send(mqd, argv[optind + 1], strlen(argv[optind + 1]), prio) == -1)
    {
        perror("Failed ot send message queue");
        exit(EXIT_FAILURE);
    }

    exit(EXIT_SUCCESS);
}

