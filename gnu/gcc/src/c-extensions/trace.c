#include <stdio.h>
#include <string.h>
#include <time.h>
 
static FILE *fp_trace;
struct timespec timer_start, timer_finish;
double delay;

void
__attribute__ ((constructor))
trace_begin (void)
{
    delay = 0.0;
    memset(&timer_start, 0, sizeof(struct timespec));
    memset(&timer_finish, 0, sizeof(struct timespec));
    
    fp_trace = fopen("trace.out", "w");
}
 
void
__attribute__ ((destructor))
trace_end (void)
{
    if (fp_trace != NULL) {
	fclose(fp_trace);
    }
}
 
__attribute__ ((no_instrument_function))
void
__cyg_profile_func_enter (void *func,  void *caller)
{
    if (fp_trace != NULL) {
	clock_gettime(CLOCK_MONOTONIC, &timer_start);
	fprintf(fp_trace, "e %p %p\n", func, caller);
	// fprintf(fp_trace, "e %p %p %lu\n", func, caller, time(NULL));
    }
}

__attribute__ ((no_instrument_function))
void
__cyg_profile_func_exit (void *func, void *caller)
{
    if (fp_trace != NULL) {
	clock_gettime(CLOCK_MONOTONIC, &timer_finish);
	delay = (timer_finish.tv_sec - timer_start.tv_sec) * 1000.0 + \
	 	(timer_finish.tv_nsec - timer_start.tv_nsec) / 1000000.0;
	fprintf(fp_trace, "x %p %p %fus\n", func, caller, delay);
	// fprintf(fp_trace, "x %p %p %lu\n", func, caller, time(NULL));
    }
}
