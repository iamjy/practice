/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

/*****************************************************************************
 * Headers
 *****************************************************************************/
#include "i2c.h"

/*****************************************************************************
 * Macro definitions
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

/*****************************************************************************
 * Global variables
 *****************************************************************************/

/*****************************************************************************
 * Static variables
 *****************************************************************************/
static int fd = -1;

/*****************************************************************************
 * Extern variables
 *****************************************************************************/

/*****************************************************************************
 * Function prototypes
 *****************************************************************************/

/*****************************************************************************
 * Function definitions
 *****************************************************************************/
int32_t i2c_scan()
{
	int rc, adr, found = 0;
	I2C_MSG msg;
	I2C_RDWR_IOCTL_DATA msgset;

	/* scan the whole I²C bus range */
	for (adr = 1; adr < 128; adr++) {
		msg.addr  = adr;
		msg.flags = 0;
		msg.buf   = 0;
		msg.len   = 0;

		msgset.msgs  = &msg;
		msgset.nmsgs = 1;

		rc = ioctl(fd , I2C_RDWR , &msgset );
		if ( rc == 1 ) {
			found++;
			printf("Find Device I2C Addr = %x \n", adr);
		}
	}
}
