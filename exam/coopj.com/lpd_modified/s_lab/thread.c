#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <unistd.h>
#include <errno.h>

void *thread_func(void *param)
{
    void *p = NULL;
    uint32_t cnt = 5;
    uint8_t tmp[102400];

    fprintf(stdout, "%s(): ENTER\n", __func__);


    /* if (pthread_detach(pthread_self()) != 0)
    {
        fprintf(stderr, "%s(): Failed to detach thread\n", __func__);
        goto out;
    } */

    while(1)
    {
        static int i = 0;
        p = malloc(4*1024*1024*1024);
        cnt--;
        sleep(1);
    }

    fprintf(stdout, "%s(): LEAVE\n", __func__);

out:
    pthread_exit((void *)cnt);
}

void create_thread(pthread_t *thread)
{
    fprintf(stdout, "%s(): ENTER\n", __func__);

    if (pthread_create(thread, (void *)0, &thread_func, (void *)0) != 0)
    {
        perror("Failed to create a thread\n");
    }

    fprintf(stdout, "%s(): LEAVE\n", __func__);
}

void destroy_thread(pthread_t thread)
{
    int32_t ret;

    fprintf(stdout, "%s(): ENTER\n", __func__);

    if (pthread_join(thread, (void **)&ret) != 0)
    {
        perror("Failed to destroy the thread\n");
    }

    fprintf(stdout, "%s(): LEAVE: ret: %d\n", __func__, ret);
}

int32_t main(int32_t argc, char *argv[])
{
    pthread_t thread;
    int32_t ret;

    fprintf(stdout, "%s(): ENTER\n", __func__);

    create_thread(&thread);
    // destroy_thread(thread);

    /* if (pthread_join(thread, (void **)&ret) != 0)
    {
        perror("Failed to destroy the thread\n");
    } */

    sleep(100);

    fprintf(stdout, "%s(): LEAVE: ret %d\n", __func__, ret);

    return 0;
}

