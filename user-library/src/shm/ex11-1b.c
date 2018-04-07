/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

/*****************************************************************************
 * Inclusion
 *****************************************************************************/
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

#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <sys/shm.h>


/*****************************************************************************
 * Macro definitions
 *****************************************************************************/
#define BUFF_SIZE   256 ///< Buffer size for character data


/*****************************************************************************
 * Structures
 *****************************************************************************/
/**
 *
 */
typedef struct _struct {
  int i;

} STRUCT;


/*****************************************************************************
 * Global variables
 *****************************************************************************/
struct CLASS *classPtr = NULL;
struct sembuf lock = {0, -1, 0};
struct sembuf unlock = {0, 1, 0};
char *memptr = NULL, *pname = NULL;
int semid, shmid;
int ret;


/*****************************************************************************
 * Static variables
 *****************************************************************************/



/*****************************************************************************
 * Extern variables
 *****************************************************************************/



/*****************************************************************************
 * Function prototypes
 *****************************************************************************/
static void sell_seats(void);
static void rpterror(char *string);


/*****************************************************************************
 * Function definitions
 *****************************************************************************/
int main(int argc, char const *argv[])
{
	if (argc < 3) {
		fprintf(stderr, "Usage: %s shmid semid\n", argv[0]);
		exit(1);
	}

	pname = argv[0];

	sscanf(argv[1], "%d", &shmid);
	memptr = shmat(shmid, (char *)0, 0);
	if (memptr == (char *) -1) {
		rpterror("shmat failed");
		exit(2);
	}

	classPtr = (struct CLASS *)memptr;
	sscanf(argv[2], "%d", &semid);

	sell_seats();

	ret = shmdt(memptr);
	exit(0);

	return 0;
}

/** @brief
 *  @param
 *  @param
 *  @return
 */
static void
sell_seats(void)
{
	int allOut;
	srand(getpid());
}

/** @brief
 *  @param
 *  @param
 *  @return
 */
static void
rpterror(char *string)
{
	
}

