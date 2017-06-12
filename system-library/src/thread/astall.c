#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <pthread.h>

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
int32_t i = 0;

void func(void)
{
    pthread_mutex_lock(&mutex);
    i = 0;
    pthread_mutex_unlock(&mutex);
}

void *thread(void *arg)
{
    while(1) {
        pthread_mutex_lock(&mutex);

        if (i > 2)
            func();
        else
            i++;

        pthread_mutex_unlock(&mutex);

        printf("%d\n", i);
        sleep(1);
    }
}

int32_t main(int argc, char **argv)
{
    pthread_t tid;

    pthread_create(&tid, NULL, thread, NULL);
    pthread_join(tid, NULL);

    return EXIT_SUCCESS;
}
