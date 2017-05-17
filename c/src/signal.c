#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <limits.h>
#include <signal.h>

void
hsignal_func(int signal)
{
    write(STDOUT_FILENO, "Got signal\n", 11);
}

int
main(void)
{
    signal(SIGRTMIN + 4, hsignal_func);
    kill(getpid(), SIGRTMIN + 4);
    exit(EXIT_SUCCESS);
}
