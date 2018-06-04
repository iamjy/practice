/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <errno.h>
#include <assert.h>
#include <time.h>
#include <sys/time.h>
#include <signal.h>

/*****************************************************************************
 * Macro definitions
 *****************************************************************************/
#define BUFF_SIZE   256 ///< Buffer size for character data

/*****************************************************************************
 * Structures
 *****************************************************************************/
/**
 *
 */
typedef struct _struct {
  int i;

} STRUCT;

/*****************************************************************************
 * Global variables
 *****************************************************************************/

/*****************************************************************************
 * Static variables
 *****************************************************************************/

/*****************************************************************************
 * Extern variables
 *****************************************************************************/

/*****************************************************************************
 * Function prototypes
 *****************************************************************************/
void timer_callback (int signum);


/*****************************************************************************
 * Function definitions
 *****************************************************************************/
int main(int argc, char *argv[])
{
	struct sigaction sa;
	struct itimerval timer;
	time_t tm;
	clockid_t clkId;
	struct timespec tsp;

	time(&tm);
	clock_gettime(CLOCK_REALTIME, &tsp);
	clock_getres(CLOCK_REALTIME, &tsp);

	memset(&sa, 0, sizeof(sa));
	sa.sa_handler = &timer_callback;
	sigaction(SIGPROF, &sa, NULL);

	timer.it_value.tv_sec = 0;
	timer.it_value.tv_usec = 200000;
 	
 	timer.it_interval.tv_sec = 0;
 	timer.it_interval.tv_usec = 200000;

 	setitimer(ITIMER_PROF, &timer, NULL);

 	while(1);
}

/** @brief
 *  @param
 *  @param
 *  @return
 */
void timer_callback (int signum)
{
	static int count = 0;
	printf("Timer expired %d times\n", ++count);
}
