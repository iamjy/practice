#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <mqueue.h>
#include <limits.h>

#define MSGQ_DESC "/messages"

void thread(void *arg)
{
    mqd_t          mqdesc_r    = *((mqd_t *)arg);
    struct mq_attr mqstat_r;
    void           *mqrecv_buf = NULL;
    uint32_t       mq_prio     = 0;
    int32_t        i           = -1;

    if (mq_getattr(mqdesc_r, &mqstat_r))
    {
        perror("Failed to get messages queue attributes\n");
        pthread_exit(-1);
    }

    mqrecv_buf = malloc(mqstat_r.mq_msgsize);
    if (mqrecv_buf == NULL)
    {
        fprintf(stderr, "Failed to allocate memory\n");
    }

    do
    {
        if (mq_receive(mqdesc_r, mqrecv_buf, mqstat_r.mq_msgsize, &mq_prio)
            == -1)
        {
            perror("Failed to receive a message\n");
        }
        else
        {
            if (mq_getattr(mqdesc_r, &mqstat_r))
            {
                perror("Failed to get messages queue attributes\n");
                pthread_exit(-1);
            }

            printf("Receive message %d\n", *(int32_t *)mqrecv_buf);
        }

        for (i = 0; i < *(int32_t *)mqrecv_buf; i++)
        {
            printf("thread %d\n", i);
            sleep(1);
        }
    } while (mqstat_r.mq_curmsgs != 0);

    pthread_exit(i);
}

int
main(void)
{
    pthread_t      tid;
    mqd_t          mqdesc_w;
    mqd_t          mqdesc_r;
    struct mq_attr mqstat_r;
    int32_t        mq_msg;
    int32_t        status;

    if (strlen(MSGQ_DESC) < NAME_MAX)
    {
        mqdesc_w = mq_open(MSGQ_DESC, O_WRONLY | O_CREAT, 0777, 0);
        if (mqdesc_w == (mqd_t) -1)
        {
            perror("Failed to create a message queue descriptor\n");
            exit(EXIT_FAILURE);
        }

        mqdesc_r = mq_open(MSGQ_DESC, O_RDONLY, 0777, 0);
        if (mqdesc_r == (mqd_t) -1)
        {
            perror("Failed to create a message queue descriptor\n");
            exit(EXIT_FAILURE);
        }
    }

    if (pthread_create(&tid , NULL, thread, &mqdesc_r) < 0)
    {
        perror("Failed to create a thread\n");
        exit(EXIT_FAILURE);
    }

    mqstat_r.mq_maxmsg  = 10;
    mqstat_r.mq_msgsize = 4;

    mq_msg = 2;

    if (mq_send(mqdesc_w, (const char *)&mq_msg, mqstat_r.mq_msgsize, 0) == -1)
    {
        perror("Failed to send a message\n");
    }

    pthread_join(tid, (void **)&status);

    mq_close(mqdesc_w);
    mq_close(mqdesc_r);
    mq_unlink(MSGQ_DESC);

    exit(EXIT_SUCCESS);
}

