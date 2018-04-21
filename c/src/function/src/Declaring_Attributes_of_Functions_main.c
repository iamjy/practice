#include <stdio.h>
#include <linux/types.h>
#include "Declaring_Attributes_of_Functions.h"

extern void (*p_func) (void);

static void stf_weakref (void) __attribute__ ((weakref ("f_weakref")));

__s32 main(__s32 argc, char *argv[])
{
    /* f_noreturn(); */
    f_nonnull(NULL, NULL, 0);
    p_func();
    f_warn_unused_result();
    stf_weakref();

    return 0;
}
