/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

#ifndef _COMMON_H_
#define _COMMON_H_

 /*****************************************************************************
  * Inclusion
  *****************************************************************************/
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>

/*****************************************************************************
 * Header files
 *****************************************************************************/
#ifdef __cplusplus
#include <iostream>
#include <stdio.h>
#include <string.h>
#else
#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <errno.h>
#include <assert.h>
#include <time.h>
#include <pthread.h>
#endif

/*****************************************************************************
 * Macro definitions
 *****************************************************************************/
#ifndef DEBUG
#define libprintf(...) \
            printf("%s:%s():%d: ", \
                    __FILE__, __FUNCTION__, __LINE__, \
                    __VA_ARGS__)
#define gpinrtf(fmt, x...) printf("%s: "fmt, __FUNCTION__, ##x)
#else
#define libprintf(x) do {} while (0)
#define gprintf(x...) do {} while (0)
#endif

/*****************************************************************************
 * Type definitions
 *****************************************************************************/
 #define ANSI_COLOR_RED     "\x1b[31m"
 #define ANSI_COLOR_GREEN   "\x1b[32m"
 #define ANSI_COLOR_YELLOW  "\x1b[33m"
 #define ANSI_COLOR_BLUE    "\x1b[34m"
 #define ANSI_COLOR_MAGENTA "\x1b[35m"
 #define ANSI_COLOR_CYAN    "\x1b[36m"
 #define ANSI_COLOR_RESET   "\x1b[0m"

/*****************************************************************************
 * Enumerations
 *****************************************************************************/

/*****************************************************************************
 * Structures
 *****************************************************************************/
/**
 *
 */

/*****************************************************************************
 * Structures
 *****************************************************************************/

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
/** @brief
 *  @param
 *  @param
 *  @return
 */
void error_exit (char *message);

/** @brief
 *  @param
 *  @param
 *  @return
 */
int error_printf (char *fmt, ...);

/** @brief
 *  @param
 *  @param
 *  @return
 */
int debug_printf (char *fmt, ...);

/** @brief
 *  @param
 *  @param
 *  @return
 */
int info_printf (char *fmt, ...);

#endif /* _COMMON_H_ */
