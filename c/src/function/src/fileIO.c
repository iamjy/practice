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
FILE *fopen_read(const char *f_name);
FILE *fopen_write(const char *f_name, bool mode_a);
FILE *fopen_read_binary(const char *f_name);
FILE *fopen_write_binary(const char *f_name, bool mode_a);
FILE *fopen_read_write(const char *fname, bool mode_a);

/*****************************************************************************
 * Function definitions
 *****************************************************************************/
/** @brief
 *  @param
 *  @param
 *  @return
 */
FILE *fopen_read(const char *f_name) {
  FILE *pf = NULL;
  int errnum;

  if ((pf = fopen(f_name, "r")) == NULL)
  {
    errnum = errno;

    fprintf(stderr, "Failed to open %s file (%d)\n", f_name, errnum);
    fprintf(stderr, "%s: %s\n", __FUNCTION__, strerror(errnum));

    return NULL;
  }

  return pf;
}
