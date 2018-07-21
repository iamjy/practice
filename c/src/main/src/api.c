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
#include "common.h"
#include "api.h"

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

/*****************************************************************************
 * Function definitions
 *****************************************************************************/
int
my_envp (char **envp)
{
	int i = 0;

	while (envp[i] != NULL)	{
		printf("%d : %s\n", i, envp[i]);
		i++;
	}

	return 0;
}

int
my_getopt (int argc, char **argv)
{
	int opt;
	char *greeting = "Hello, ";
	char *target = "world";
	int option_index = 0;
	struct option long_options[] = {
		{"bye", 0, NULL, 'b'},
		{"help", 0, NULL, 'h'},
		{"name", 0, NULL, 'n'},
		{0, 0, 0, 0}
	};

	while ((opt = getopt_long(argc, argv, "bhn:",
                           long_options, &option_index)) != -1) {
		switch (opt) {
		case 'b':
			greeting = "Good-bye, ";
			break;
		case 'n':
			target = optarg;
			break;
		case 'h':
		default:
			my_getopt_usage(argv[0]);
			return EXIT_FAILURE;
		}
	}

	printf("%s%s!\n", greeting, target);
	return EXIT_SUCCESS;
}

void
my_getopt_usage (char *cmd)
{
	fprintf(stderr, "usage: \n");
	fprintf(stderr, "   %s -h        : show help\n", cmd);
	fprintf(stderr, "   %s -b        : say good-bye\n", cmd);
	fprintf(stderr, "   %s -n <name> : greeting to <name>\n", cmd);
}

FILE *
fopen_read(const char *f_name) {
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

void
discard1()
{
	int i;
	int d1 = 1;
	int sum = 0;

	for (i = 0; i < 10; i++)
		sum += d1;
}

void
discard2()
{
	int i;
	volatile int d2 = 1;
	int sum = 0;

	for (i = 0; i < 10; i++)
		sum += d2;
}

void
discard3 (int *input)
{
	int output;
/*
	asm ("ldr %0, [%1]"
			: "=r" (output)
			: "r" (input)
			: "cc");
*/
}

void
discard4 (int *input)
{
	int output;
/*
	asm volatile ("ldr %0, [%1]"
					: "=r" (output)
					: "r" (input));
*/
}

int
loop3(int *addr)
{
	int i;
	int tmp = 0;
/*
	for (i = 0; i < 10; i++)
	{
		asm ("add %0, #1\n   str %0, [%1]"
				: "=r" (tmp)
				: "r" (addr)
				: "memory");
	}
*/
	return tmp;
}

int
loop4(int *addr)
{
	int i;
	int tmp = 0;
/*
	for (i = 0; i < 10; i++)
	{
		asm volatile ("add %0, #1\n   str %0, [%1]"
						: "=r" (tmp)
						: "r" (addr)
						: "memory");
	}
*/
	return tmp;
}

int32_t
loop1(int32_t *addr)
{
	int32_t i;

	for (i = 0; i < 10; i++)
		*addr += 1;

	return i;
}

int32_t
loop2(volatile int32_t *addr)
{
	int32_t i;

	for (i = 0; i < 10; i++)
		*addr += 1;

	return i;
}
