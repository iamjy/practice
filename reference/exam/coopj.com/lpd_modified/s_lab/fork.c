#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <linux/types.h>

int main(int argc, char **argv)
{
    pid_t pid;
    __u32 i;

    i = 1000;

    pid = fork();
    if (pid == -1) {
        perror("fork error");
        exit(0);
    } else if (pid == 0) {
        printf("Child pid = %d\n", getpid());
        while (1) {
            printf("c(%d)\n", i);
            i++;
            sleep(1);
        }
    } else {
        printf("Parent pid = %d\n", getpid());
        printf("Child pid = %d\n", pid);
        while (1) {
            printf("p(%d)\n", i);
            i += 4;
            sleep(1);
        }
    }                
    
    return 0;
}
