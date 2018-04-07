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
#include <unistd.h>

#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <sys/shm.h>
#include <memory.h>


/*****************************************************************************
 * Macro definitions
 *****************************************************************************/
#define BUFF_SIZE   256 ///< Buffer size for character data
#define NCHILD	3

/*****************************************************************************
 * Structures
 *****************************************************************************/
/**
 *
 */
typedef struct _struct {
  int i;

} STRUCT;

typedef struct _CLASS {
	char classNumber[6];
	char date[6];
	char title[50];
	int seats_left;

} CLASS;


/*****************************************************************************
 * Global variables
 *****************************************************************************/


/*****************************************************************************
 * Static variables
 *****************************************************************************/
static CLASS
class = {
	"1001",
	"120186",
	"C Language for Programmers",
	15
};

int child[NCHILD];
char *shm_ptr = NULL;
int semid, shmid;
char ascsemid[10], ascshmid[10];
char pname[14];


/*****************************************************************************
 * Extern variables
 *****************************************************************************/


/*****************************************************************************
 * Function prototypes
 *****************************************************************************/
char *smat();
void rpterror();
void shm_init();
void sem_init();
void wait_and_wrap_up(void);


/*****************************************************************************
 * Function definitions
 *****************************************************************************/
int main(int argc, char const *argv[])
{
	int i;

	strcpy(pname, argv[0]);

	shm_init();
	sem_init();

	for (i = 0; i < NCHILD; i++) {
		child[i] = fork();
		switch(child[i]) {
		case -1:
			rpterror("fork-failure");
			exit(1);
		case 0:
			sprintf(pname, "ex11-1b", i + 1);
			execl("ex11-1b", pname, ascshmid, ascsemid, (char *)0);
			perror("execl failed");
			exit(2);
		}
	}
	
	return 0;
}

/** @brief
 *  @param
 *  @param
 *  @return
 */
void shm_init()
{
	shmid = shmget(IPC_PRIVATE, sizeof(class), 0600 | IPC_CREAT);
	if (shmid == -1) {
		perror("shmget failed");
		exit(3);
	}

	shm_ptr = shmat(shmid, (char *)0, 0);
	if (shm_ptr == (char *)-1) {
		perror("shmat failed");
		exit(4);
	}

	memcpy(shm_ptr, (char *)&class, sizeof(class));
	sprintf(ascshmid, "%d", shmid);
}

/** @brief
 *  @param
 *  @param
 *  @return
 */
void sem_init()
{
	semid = semget(IPC_PRIVATE, 1, 0600 | IPC_CREAT);
	if (semid == -1) {
		perror("semget failed");
		exit(5);
	}

	if ((semctl(semid, 0, SETVAL, 1)) == -1) {
		fprintf(stderr, "parent: semctl, SETVAL failed\n");
		exit(6);
	}

	sprintf(ascsemid, "%d", semid);
}

void wait_and_wrap_up(void)
{
	struct shmid_ds shm_info;
	int wait_rtn, w, ch_acrive = NCHILD;

	while (ch_acrive > 0) {
		wait_rtn = wait((int *)0);

		for (w = 0; w < NCHILD; w++) {
			if (child[w] == wait_rtn) {
				ch_acrive--;
				break;
			}
		}
	}

	printf("Parent removing shm and sem\n");

	shmdt(shm_ptr);
	shmctl(shmid, IPC_RMID, &shm_info);
	semctl(shmid, 0, IPC_RMID, 0);

	exit(0);
}

void rpterror(char *string)
{
	char errline[50];
	sprintf(errline, "%s %s", string, pname);
	perror(errline);
}
