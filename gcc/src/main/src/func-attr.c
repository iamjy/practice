/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

/*****************************************************************************
 * Header files
 *****************************************************************************/
#include "common.h"
#include "func-attr.h"

/*****************************************************************************
 * Type definitions
 *****************************************************************************/

/*****************************************************************************
 * Enumerations
 *****************************************************************************/

/*****************************************************************************
 * Macro definitions
 *****************************************************************************/

/*****************************************************************************
 * Structures
 *****************************************************************************/
/**
 *
 */

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

/*****************************************************************************
 * Function definitions
 *****************************************************************************/
void
__func_noreturn (void)
{
    debug(1, "%s is called..\n", __func__);
    exit(1); /* or abort(); */
}
/* alias ("target") */
void f_noreturn (void) __attribute__ ((weak, alias ("__func_noreturn")));

void
__func_nonnull (void *dest, const void *src, size_t len)
{
    debug(1, "%s is called..\n", __func__);
}
/* alias ("target") */
void  f_nonnull (void *dest, const void *src, size_t len) __attribute__ ((weak, alias ("__func_nonnull")));

void
__func_visibility (void)
{
    debug(1, "%s is called..\n", __func__);
}
/* alias ("target") */
void f_visibility (void) __attribute__ ((weak, alias ("__func_visibility")));
void __attribute__ ((visibility ("default"/* or protected  */))) (*p_func) (void) = f_visibility;

int
__func_warn_unused_result (void)
{
    debug(1, "%s is called..\n", __func__);
    return 0;
}
/* alias ("target") */
int f_warn_unused_result (void) __attribute__ ((weak, alias ("__func_warn_unused_result")));

void
__func_weakref (void)
{
    debug(1, "%s is called..\n", __func__);
}
void f_weakref (void) __attribute__ ((weak, alias("__func_weakref")));

void
error (const char *fmt, ...)
{
    va_list ap;
    va_start (ap, fmt);

    vfprintf(stderr, fmt, ap);
    va_end(ap);
}

void
debug (__s32 dlevel, const char *fmt, ...)
{
    va_list ap;
    va_start (ap, fmt);

    switch (dlevel) {
    case 0:
        break;
    case 1:
        vfprintf(stdout, fmt, ap);
        va_end(ap);
        break;
    default:
        vfprintf(stdout, fmt, ap);
        va_end(ap);
        break;
    };
}
