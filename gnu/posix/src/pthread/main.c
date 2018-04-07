
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <pthread.h>

pthread_cond_t s_cond = PTHREAD_COND_INITIALIZER;
pthread_cond_t d_cond;

pthread_mutex_t s_lock = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t d_lock;

int g_cnt = 0;
volatile int vg_cnt = 0;

void *detached_thread(void *data)
{
	int i = 0;
	pthread_t pid = pthread_self();

	for (i = 0; i < 100000; i++)
	{
		pthread_mutex_lock(&d_lock);
		printf("[%d]vg_cnt %d\n", pid, vg_cnt++);
		sleep(1);
		pthread_mutex_unlock(&d_lock);
	}

	pthread_exit((void *)0);
}

void *sig_send_thread(void *data)
{
	bool once = *(bool *)data;

	do {
		pthread_cond_signal(&s_cond);
	} while (once != true && g_cnt < 10);

	//printf("s!\n");

	pthread_exit((void *)g_cnt);
}

void *sig_receive_thread(void *data)
{
	g_cnt = *(int *)data;


	do {
		pthread_cond_wait(&s_cond, &s_lock);
		//printf("%d\n", g_cnt++);
	} while (g_cnt < 10);

	//printf("r!\n");

	pthread_exit((void *)g_cnt);
}

int main(void)
{
	int ret = -1;
	bool snd_val = false;
	int  rcv_val = -1;
	int ret_val = 0;
	size_t stack_sz = 0;
	pthread_t snd_th;
	pthread_t rcv_th;
	pthread_t dt_th0;
	pthread_t dt_th1;
	pthread_attr_t snd_attr;
	pthread_attr_t rcv_attr;
	pthread_attr_t dt_attr;
	pthread_condattr_t  cond_attr;
	pthread_mutexattr_t mtx_attr;

	memset(&snd_th, 0, sizeof(pthread_t));
	memset(&rcv_th, 0, sizeof(pthread_t));

	ret = pthread_mutex_init(&d_lock, &mtx_attr);
	if (ret != 0)
	{
		perror("Failed to init mutex!\n");
		return errno;
	}

	ret = pthread_cond_init(&d_cond, &cond_attr);
	if (ret != 0)
	{
		perror("Failed to init condition value!\n");
		return errno;
	}

	if (pthread_attr_init(&snd_attr) != 0 ||
		pthread_attr_init(&rcv_attr) != 0 ||
		pthread_attr_init(&dt_attr))
	{
		perror("Failed to init attr!\n");
		return errno;
	}

	pthread_attr_getstacksize(&snd_attr, &stack_sz);
	printf("snd_th stack size %ld\n", stack_sz);
	pthread_attr_getstacksize(&rcv_attr, &stack_sz);
	printf("rcv_th stack size %ld\n", stack_sz);
	pthread_attr_getstacksize(&dt_attr, &stack_sz);
	printf("dt_th stack size %ld\n", stack_sz);

	ret = pthread_attr_setdetachstate(&dt_attr, PTHREAD_CREATE_DETACHED);
	if (ret != 0)
	{
		perror("Failed to setdetachestate for dt_attr!\n");
		return errno;
	}

	rcv_val = 0;
	ret = pthread_create(&rcv_th, &rcv_attr, sig_receive_thread, (void *)&rcv_val);
	if (ret != 0)
	{
		perror("Failed to create a sig_receive_thread!\n");
		return errno;
	}

	snd_val = false;
	ret = pthread_create(&snd_th, &snd_attr, sig_send_thread, (void *)&snd_val);
	if (ret != 0)
	{
		perror("Failed to create a sig_send_thread!\n");
		return errno;
	}

	ret = pthread_create(&dt_th0, &dt_attr, detached_thread, (void *)0);
	if (ret != 0)
	{
		perror("Failed to create a detached_thread0!\n");
		return errno;
	}
	ret = pthread_create(&dt_th1, &dt_attr, detached_thread, (void *)0);
	if (ret != 0)
	{
		perror("Failed to create a detached_thread1!\n");
		return errno;
	}

	ret = pthread_join(rcv_th, (void **)&ret_val);

	ret = pthread_join(rcv_th, (void **)&ret_val);
	if (ret != 0)
	{
		perror("Failed to join the sig_receive_thread!\n");
		return errno;
	}
	printf("ret_val %d\n", ret_val);

	ret = pthread_join(snd_th, (void **)&ret_val);
	if (ret != 0)
	{
		perror("Failed to join the sig_send_thread!\n");
		return errno;
	}
	printf("ret_val %d\n", ret_val);

	if (pthread_attr_destroy(&snd_attr) != 0 ||
		pthread_attr_destroy(&rcv_attr) != 0 ||
		pthread_attr_destroy(&dt_attr)  != 0)
	{
		perror("Failed to destroy attr!\n");
	}

	ret = pthread_cond_destroy(&d_cond);
	if (ret != 0)
		perror("Failed to destroy condition variable!\n");

	ret = pthread_mutex_destroy(&d_lock);
	if (ret != 0)
		perror("Failed to destroy mutex variable!\n");

	return 0;
}
