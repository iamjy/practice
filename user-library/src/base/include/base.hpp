/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

#ifndef _CPP_BASE_H_
#define _CPP_BASE_H_

/*****************************************************************************
 * Header files
 *****************************************************************************/
#ifdef __cplusplus
#include <iostream>
#include <cstdio>
#include <deque>
#include <vector>
#include <list>
#include <algorithm>
#else
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <unistd.h>
#include <errno.h>
#include <assert.h>
#include <getopt.h>
#include <time.h>
#include <fcntl.h>
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
 * Structures
 *****************************************************************************/
#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_GREEN   "\x1b[32m"
#define ANSI_COLOR_YELLOW  "\x1b[33m"
#define ANSI_COLOR_BLUE    "\x1b[34m"
#define ANSI_COLOR_MAGENTA "\x1b[35m"
#define ANSI_COLOR_CYAN    "\x1b[36m"
#define ANSI_COLOR_RESET   "\x1b[0m"

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
extern "C" {
void c_function_in_cpp (void);
}

#endif /* _CPP_BASE_H_ */