#include <stdio.h>
#include <pthread.h>
#include <time.h>

void *thread_code(void *param)
{
	while(1)
	{
		printf("In thread code\n");
		sleep(1);
	}
}

int main(int argc, char *argv[])
{
	pthread_t thread;
	pthread_create(&thread, 0, &thread_code, 0);
	while (1)
	{
		printf("In main thread\n");
		sleep(2);
	}

	return 0;
}
