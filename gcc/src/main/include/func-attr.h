/**
 * @file
 * @author
 * @date
 * @brief  Declaring Attributes of Functions
 * @see
 */

#ifndef _FUNC_ATTR_H_
#define _FUNC_ATTR_H_

/*****************************************************************************
 * Header files
 *****************************************************************************/
#include <stddef.h>
#include <linux/types.h>

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
/** @brief
 *  @param
 *  @return
 */

/** @brief  alias functions
 */
void f_noreturn (void) __attribute__ ((noreturn));
void f_nonnull (void *dest, const void *src, size_t len) __attribute__ ((nonnull));
void f_visibility (void) __attribute__((visibility ("hidden" /* or internal  */)));
int  f_warn_unused_result (void) __attribute__ ((warn_unused_result));
void f_weakref (void);

/** @brief  noreturn -> -Wall
 */
void __func_noreturn (void) __attribute__ ((noreturn));

/** @brief  nonnull -> -Wnonnull
 */
void __func_nonnull (void *dest, const void *src, size_t len) __attribute__ ((nonnull));

/** @brief  visibility
 */
void __func_visibility (void) __attribute__((visibility ("hidden" /* or internal  */)));

 /** @brief  warn_unused_result
  */
int __func_warn_unused_result (void) __attribute__ ((warn_unused_result));

/** @brief  weakref
 */
void __func_weakref (void);

/** @brief  format (archetype, string-index, first-to-check)
 *  @param
 *  @return
 */
void error (const char *format, ...) __attribute__ ((format (printf, 1, 2)));
void debug (int dlevel, const char *format, ...) __attribute__ ((format (printf, 2, 3)));

#endif /* _FUNC_ATTR_H */
