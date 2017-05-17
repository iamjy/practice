#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <mqueue.h>

int main(void)
{

    pid_t f;

    f = fork();
    if (f == 0)
    {
        mqd_t          mq;
        struct mq_attr mq_attr;
        char           mq_msg[6] = {'\0', };

        mq_attr.mq_maxmsg  = 100;
        mq_attr.mq_msgsize = 256;

        mq = mq_open("/messages", O_WRONLY | O_CREAT, 0777, 0);
        if (mq == -1)
        {
            perror("Failed to create a message queue\n");
            _exit(EXIT_FAILURE);
        }

        strncpy(mq_msg, "Hello", 6);

        if (mq_send(mq, mq_msg, mq_attr.mq_msgsize, 0) == -1)
        {
            perror("Faild to receive message\n");
            _exit(EXIT_FAILURE);
        }
        printf("Send message %s\n", mq_msg);

        mq_close(mq);

        printf("Child process completion\n");
    }
    else
    {
        mqd_t          mq;
        struct mq_attr mq_attr;
        char           mq_msg[256] = {'\0', };

        mq_attr.mq_maxmsg  = 100;
        mq_attr.mq_msgsize = 256;

        mq = mq_open("/messages", O_RDONLY, 0777, 0);
        if (mq == -1)
        {
            perror("Failed to create a message queue\n");
            _exit(EXIT_FAILURE);
        }

        if (mq_receive(mq, mq_msg, mq_attr.mq_msgsize, 0) == -1)
        {
            perror("Faild to receive message\n");
            _exit(EXIT_FAILURE);
        }
        printf("Receive message %s\n", mq_msg);

        mq_close(mq);
        mq_unlink("/messages");

        printf("Parent process completed\n");
    }

    exit(EXIT_SUCCESS);
}
