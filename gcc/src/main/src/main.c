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
#include "main.h"
#include "c-extensions.h"
#include "func-attr.h"
#include "inline-asm.h"
#include "builtin-prefetch.h"
#include "trace.h"

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
static void stf_weakref (void) __attribute__ ((weakref ("f_weakref")));

/*****************************************************************************
 * Extern variables
 *****************************************************************************/
extern void (*p_func) (void);

/*****************************************************************************
 * Function prototypes
 *****************************************************************************/

/*****************************************************************************
 * Function definitions
 *****************************************************************************/
int main(void)
{
    int (*f)();
    f = &foo;
    f;
    var();

#if 0
    f_noreturn();
    f_nonnull(NULL, NULL, 0);
    p_func();
    f_warn_unused_result();
    stf_weakref();
#endif

    return 0;
}

int
foo()
{
    usleep(1000);
    return 0;
}

int
var()
{
    usleep(1100);
    return 0;
}