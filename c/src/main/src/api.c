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
 * Macro definitions
 *****************************************************************************/

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

/*****************************************************************************
 * Global variables
 *****************************************************************************/

/*****************************************************************************
 * Static variables
 *****************************************************************************/
static int token9 = 9;

/*****************************************************************************
 * Extern variables
 *****************************************************************************/

/*****************************************************************************
 * Function prototypes
 *****************************************************************************/

/*****************************************************************************
 * Function definitions
 *****************************************************************************/
void
init_books(BOOK *books, int size)
{
	BOOK shelf[13] = {
		"TCP/IP 프로토콜", 32000, 890,
		"온라인 게임서버 프로그래밍", 16000, 425,
		"Programming APplications", 34000, 1079,
		"C++ Standard Library", 30000, 859,
		"실용주의 디자인 패턴", 26000, 497,
		"C로 배우는 알고리즘", 20000, 699,
		"C++ 완벽 해설서", 40000, 1127,
		"Introduction To Algorithms", 42000, 1275,
		"C++ 자료구조", 33000, 779,
		"파괴의 광학", 17000, 423,
		"OS 커널의 구조와 원리", 22000, 454,
		"누워서 읽는 알고리즘", 12000, 248,
		"유닉스 리눅스 필수 유틸리티", 23000, 560
	};
	int i = 0;

	for (i = 0; i < size; i++) {
		books[i] = shelf[i % 13];
	}
}

int
select_menu(void)
{
	char menu[32] = {'\0'};
	int32_t idx = -1;

	do
	{
		printf("[메뉴] quit title price page - ");
		scanf("%s", menu);
		fflush(stdin);

		if (strcmp(menu, "quit") == 0) idx = QUIT;
		else if (strcmp(menu, "title") == 0) idx = TITLE;
		else if (strcmp(menu, "price") == 0) idx = PRICE;
		else if (strcmp(menu, "page") == 0) idx = PAGE;
	}
	while (idx < 0 || idx >= MENU_COUNT);

	return idx;	
}

void
print_books(BOOK *books, int size)
{
	int32_t i = 0;

	for (i = 0; i < size; i++) {
		printf("%-30s %5d %4d\n", books[i].title,
								  books[i].price,
								  books[i].page);
	}
}

int
compare_title(const void *p1, const void *p2)
{
	BOOK *pb1 = (BOOK *)p1, *pb2 = (BOOK *)p2;

	return strcmp(pb1->title, pb2->title);
}

int
compare_price(const void *p1, const void *p2)
{
	return ((BOOK *)p1)->price - ((BOOK *)p2)->price;
}

int
compare_page(const void *p1, const void *p2)
{
	return ((BOOK *)p1)->page - ((BOOK *)p2)->page;
}

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

void
operationError(char *fmt, ...)
{
  char buff[BUFF_SIZE] = {'\0'};
  va_list ap;

  strcpy(buff, "ERROR: ");
  va_start(ap, fmt);
  vsprintf(buff + strlen(buff), fmt, ap);
  va_end(ap);

  if (puts(buff) == EOF) {
    printf("Failed to write data to stdout!");
  }

  exit(1);
}

void
dispInventory(INVENTORY *ip) {
  printf("상품명 : %s\n", ip->name);
  printf("상품번호 : %s\n", ip->number);
  printf("재고 수량 : %d\n", ip->volume);
  printf("매입 일수 : %d\n", ip->leadtime);
}

void my_sleep(int cnt) {
  clock_t t = clock() * (1000 / CLOCKS_PER_SEC);
  clock_t tterm = t + cnt;

  while (t < tterm) {
    t = clock() * (1000 / CLOCKS_PER_SEC);
  }
}

void
test_function_0()
{
	stringer(In quotes in the printf function call);
 	stringer("In quotes when printed to the screen");
 	stringer("This: \"  prints an escaped double quote");
}

void
test_function_1()
{
	FB(F B);
	FB1(F B);
}

void
test_function_2()
{
	paster(9);
}

void
test_function_3()
{
/*
	SLEEP_SAVE slpsv[] = {
		SAVE_ITEM(EXYNOS4_CLKSRC_CAM),
	};

	printf("EXYNOS4_CLKSRC_CAM (0x%x)\n", slpsv[0].reg);
*/
}
