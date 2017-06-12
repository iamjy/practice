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
    fprintf(stderr, "Usage: %s [-cx] [-m maxmsg] [-s msgsize] mq-name "
        "[octal-perms]\n", progName);
    fprintf(stderr, " -c Create queue (O_CREAT)\n");
    fprintf(stderr, " -m maxmsg Set maximum # of messages\n");
    fprintf(stderr, " -s msgsize Set maximum message size\n");
    fprintf(stderr, " -x Create exclusively (O_EXCL)\n");

    exit(EXIT_FAILURE);
}

int
main(int argc, char *argv[])
{

    mode_t         perms;
    mqd_t          mqd;
    struct mq_attr attr;
    struct mq_attr *pAttr;
    int            flags;
    int            opt;

    pAttr = NULL;

    attr.mq_maxmsg  = 50;
    attr.mq_msgsize = 2048;

    flags = O_RDWR;

    /* Parse command-line options */
    while ((opt = getopt(argc, argv, "cm:s:x")) != -1) {
        switch (opt) {
        case 'c':
            flags |= O_CREAT;
            break;
        case 'm':
            attr.mq_maxmsg = atoi(optarg);
            pAttr = &attr;
            break;
        case 's':
            attr.mq_msgsize = atoi(optarg);
            pAttr = &attr;
        break;
            case 'x':
            flags |= O_EXCL;
            break;
        default:
            usageError(argv[0]);
        }
    }

    if (optind >= argc)
    {
        usageError(argv[0]);
    }

#ifdef NEVER
    perms = (argc <= optind + 1) ? (S_IRUSR | S_IWUSR) :
        getInt(argv[optind + 1], GN_BASE_8, "octal-perms");
#endif /* NEVER */

    mqd = mq_open(argv[optind], flags, 0777 /* perms */, pAttr);
    if (mqd == (mqd_t) -1)
    {
        perror("mq_open");
    }

    exit(EXIT_SUCCESS);
}
