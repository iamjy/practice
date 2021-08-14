/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

#ifndef _MAIN_H_
#define _MAIN_H_

/*****************************************************************************
 * Header files
 *****************************************************************************/
#include "common.hpp"
#include "cpp-syntax.hpp"
#include "function_overloading.hpp"
#include "api.hpp"
extern "C" {
#include "common.h"
#include "c-syntax.h"
}

/*****************************************************************************
 * Type definition
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
 * Classes
 *****************************************************************************/
 /**
  *
  */
class TEST {
public:
  TEST();
  ~TEST();

  void setSize(int size);
  int getSize() {return size;}

private:
  int size;
};

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
 *  @param
 *  @return
 */
void function9(int32_t a, int32_t b);

#endif /* _MAIN_H_ */
