#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <signal.h>

#define TIMEOUT 60
#define MAX_TRIES 4
#define BELL '\007'

int timed_out;

void sig_handler(int);

int input_with_timeout(char *prompt, char *linebuf, int n)
{
  void (*was)(int);
  int ntries, i;

  was = signal(SIGALRM, sig_handler);
  siginterrupt(SIGALRM, 1);

  for (ntries = 0; ntries < MAX_TRIES; ntries++)
  {
    timed_out = 0;
    printf("\n%s > ", prompt);
    fflush(stdout);
    alarm(TIMEOUT);


  }
}

void sig_handler(int signo)
{
    switch (signo) {
    case SIGINT:
      printf("process %d received SIGINT.\n", getpid());
      break;
    default:
      printf("unexpected signal\n");
      break;
    }
}



int main(int argc, char *argv[])
{
  if (signal(SIGINT, sig_handler) == SIG_ERR)
  {
    exit(1);
  }

  pause();

  return 0;
}
