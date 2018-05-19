/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

#ifndef _COMMON_H_
#define _COMMON_H_

<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
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
=======
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
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
#endif
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

/*****************************************************************************
 * Macro definitions
 *****************************************************************************/
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream

/*****************************************************************************
 * Type definitions
 *****************************************************************************/

/*****************************************************************************
 * Enumerations
 *****************************************************************************/

/*****************************************************************************
 * Structures
 *****************************************************************************/
/**
 *
 */
typedef struct STRUCT_COMMON_H {
  int i;

} STRUCT_COMMON_H;
=======
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
#ifndef DEBUG
#define LIB_DEBUG_PRINT(...) \
            printf("%s:%s():%d: ", \
                    __FILE__, __FUNCTION__, __LINE__, \
                     __VA_ARGS__)
#else
#define LIB_DEBUG_PRINT(x) do {} while (0)
#endif

/*****************************************************************************
 * Structures
 *****************************************************************************/

/*****************************************************************************
 * Global variables
 *****************************************************************************/

/*****************************************************************************
 * Static variables
 *****************************************************************************/
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

/*****************************************************************************
 * Extern variables
 *****************************************************************************/

/*****************************************************************************
 * Function prototypes
 *****************************************************************************/
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

/*****************************************************************************
 * Function definitions
 *****************************************************************************/
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
/** @brief
 *  @param
 *  @param
 *  @return
 */
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
#endif /* _COMMON_H_ */
