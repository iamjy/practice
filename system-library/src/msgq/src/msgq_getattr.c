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
     mqd_t          mqd;
     struct mq_attr attr;

     if (argc != 2 || strcmp(argv[1], "--help") == 0)
     {
        fprintf(stderr, "%s mq-name\n", argv[0]);
        exit(EXIT_FAILURE);
     }

     mqd = mq_open(argv[1], O_RDONLY);
     if (mqd == (mqd_t) -1)
     {
        perror("Failed to create message queue");
        exit(EXIT_FAILURE);
     }

     if (mq_getattr(mqd, &attr) == -1)
     {
        perror("Failed ot get message queue attribution");
        exit(EXIT_FAILURE);
     }

     printf("Maximum # of messages on queue: %ld\n", attr.mq_maxmsg);
     printf("Maximum message size: %ld\n", attr.mq_msgsize);
     printf("# of messages currently on queue: %ld\n", attr.mq_curmsgs);

     exit(EXIT_SUCCESS);
}
