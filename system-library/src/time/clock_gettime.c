#include <stdint.h>
#include <time.h>

#define TIME_FORMAT	"%y-%m-%d/%H:%M:%S"

int32_t get_cur_time(char *p_buf, ...)
{
    struct timespec tspec;
    struct tm tnow;
    char   *buf   = NULL;
    size_t sz_buf = 0;

    buf    = p_buf;
    sz_buf = sizeof(buf);

    if (-1 == clock_gettime(CLOCK_REALTIME, &tspec)) {
        /* TODO: */
        goto err;
    }

    localtime_r((time_t *)&tspec.tv_sec, &tnow);

    if (0 == strftime(buf, sz_buf, TIME_FORMAT, &tnow)) {
        /* TODO: */
       goto err;
    }
    
    return 0;

err:
    return -1;
}
