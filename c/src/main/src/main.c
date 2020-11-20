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
#include "main.h"

/*****************************************************************************
 * Type definitions
 *****************************************************************************/
typedef uint32_t phys_addr_t;
typedef struct membank;
typedef struct meminfo;

/*****************************************************************************
 * Enumerations
 *****************************************************************************/

/*****************************************************************************
 * Macro definitions
 *****************************************************************************/
#define BUFF_SIZE    256
#define stringer( x )    printf( #x "\n" )

#define F    abc
#define B    def
#define FB(arg)    #arg
#define FB1(arg)   FB(arg)

#define paster( n )    printf( "token" #n " = %d\n", token##n )

#define SAVE_ITEM(x)    { .reg = (x) }

#define GCC_VERSION (__GNUC__ * 10000 \
		   + __GNUC_MINOR__ * 100 \
		   + __GNUC_PATCHLEVEL__)

#define DT_MACHINE_START(_name, _namestr)		\
static const struct machine_desc __mach_desc_##_name	\
 __attribute__((__section__(".arch.info.init"))) = {	\
	.nr		= ~0,				\
	.name		= _namestr,		\
 };

#if __GNUC__ > 3 || \
    (__GNUC__ == 3 && (__GNUC_MINOR__ > 2 || \
                       (__GNUC_MINOR__ == 2 && \
                        __GNUC_PATCHLEVEL__ > 0)))
#else
#endif

/*****************************************************************************
 * Structures
 *****************************************************************************/
/**
 * 상품 재고 관리용 inventory 구조체 정의
 */
 typedef struct inventory {
	char *number; ///< 상품 번호
	char *name;   ///< 상품명
	int volume;   ///< 재고 수량
	int leadtime; ///< 매입 일수
} INVENTORY;

struct machine_desc {
	unsigned int		nr;				/* architecture number	*/
	const char			*name;			/* architecture name	*/
	unsigned long		atag_offset;	/* tagged list (relative) */
	const char *const 	*dt_compat;		/* array of device tree
									 	* 'compatible' strings	*/

	unsigned int		nr_irqs;		/* number of IRQs */

	unsigned long		dma_zone_size;	/* size of DMA-able area */

	unsigned int		video_start;	/* start of video RAM	*/
	unsigned int		video_end;		/* end of video RAM	*/

	unsigned char		reserve_lp0 :1;	/* never has lp0	*/
	unsigned char		reserve_lp1 :1;	/* never has lp1	*/
	unsigned char		reserve_lp2 :1;	/* never has lp2	*/
	char				restart_mode;	/* default restart mode	*/
	struct smp_operations	*smp;		/* SMP operations	*/
	void	(*fixup)(struct tag *, char **, struct meminfo *);
	void	(*reserve)(void);	/* reserve mem blocks	*/
	void	(*map_io)(void);	/* IO mapping function	*/
	void	(*init_early)(void);
	void	(*init_irq)(void);
	void	(*init_time)(void);
	void	(*init_machine)(void);
	void	(*init_late)(void);
	void	(*handle_irq)(struct pt_regs *);
	void	(*restart)(char, const char *);
};

struct smp_operations {
	void (*smp_init_cpus)(void);
	void (*smp_prepare_cpus)(unsigned int max_cpus);
	void (*smp_secondary_init)(unsigned int cpu);
	int  (*smp_boot_secondary)(unsigned int cpu, struct task_struct *idle);
	int  (*cpu_kill)(unsigned int cpu);
	void (*cpu_die)(unsigned int cpu);
	int  (*cpu_disable)(unsigned int cpu);
};

struct pt_regs {
	uint32_t var;
};

struct task_struct {
	uint32_t var;
};

struct membank {
	phys_addr_t start;
	phys_addr_t size;
};

struct meminfo {
	struct membank bank[10];
};

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
 void operationError(char *fmt, ...);
 void dispInventory(INVENTORY *ip);

/*****************************************************************************
 * Function definitions
 *****************************************************************************/
int main (int arTgc, char const *argv[])
{
	DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 Flattened Device Tree)");
#if 0 // Sample 5.6
	FILE *pf = NULL;
	char *f_name = "README";

	if ((pf = fopen_read(f_name)) == NULL)
	{
	  exit(1);
	}

	if (!pf)
	  fclose(pf);
#endif
#if 0 // Sample 5.5
	int i, n;
	FILE *pTmp;
	fpos_t save;
	char buff[L_tmpnam];
	INVENTORY ia[ARRAY_SIZE];
	INVENTORY work;
	INVENTORY *ip = ia;
	char *array1[] = {"123456", "223456", "323456", "423456",
					 "523456", "623456", "723456", "823456"
	};
	char *array2[] = {
	  "묵은 때도 말끔이 클린",
	  "묵은 때도 말끔이 클린(항균 타입)",
	  "찌든 때에, 완전히 클린",
	  "찌든 때에, 완전히 클린(항균 타입)",
	  "지지 않는 때에, 이거라면 OK! 클린",
	  "지지 않는 때에, 이거라면 OK! 클린(항균 타입)",
	  "자꾸 붙는 때에, 어디든 OK! 클린",
	  "자꾸 붙는 때에, 어디든 OK! 클린(항균 타입)",
	};
	int array3[] = {12300, 11500, 2800, 2200, 6400, 5300, 7600, 7000};
	int array4[] = {6, 6, 20, 20, 6, 6, 8, 8};

	for (i = 0; i < ARRAY_SIZE; i++) {
	  ip->number = array1[i];
	  ip->name = array2[i];
	  ip->volume = array3[i];
	  ip->leadtime = array4[i];
	  ip++;
	}

	for (ip = ia; ip < ia + ARRAY_SIZE; ip++)
	  dispInventory(ip);

	mkstemp(buff);
	printf("%s\n", buff);

	if ((pTmp = fopen(buff, "wb+")) == NULL)
	  operationError("입출력 파일을 열지 못했습니다.\n");

	n = fwrite(ia, sizeof(INVENTORY), ARRAY_SIZE, pTmp);
	printf("n = %d\n", n);

	rewind(pTmp);

	for (i = 0; i < ARRAY_SIZE - 5; i++) {
	  fread(&work, sizeof(INVENTORY), 1, pTmp);
	  dispInventory(&work);
	}

	fgetpos(pTmp, &save);

	if (fseek(pTmp, 4 * sizeof(INVENTORY), SEEK_SET))
	  operationError("파일의 시크에 실패했습니다.\n");
	fread(&work, sizeof(INVENTORY), 1, pTmp);
	dispInventory(&work);

	fsetpos(pTmp, &save);

	fread(&work, sizeof(INVENTORY), 1, pTmp);
	dispInventory(&work);

	fclose(pTmp);
	remove(buff);
#endif
#if 0 // Sample List 5.4
	FILE *fp1;
	FILE *fp2;
	char *pch1 = NULL, *pch2 = NULL;
	char buff[BUFF_SIZE] = {'\0'};
	size_t ret, sz, cnt;


	if (argc < 3 || argc > 3 ||
	   !strcmp(argv[1], "/?") || !strcmp(argv[1], "-?")) {
		 operationError("Copy 프로그램\n\n"
						"시동방법 : Copy 입력 파일명 출력 파일명"
						"[> 옵션의 파일명]\n");
	}

	pch1 = argv[1];
	pch2 = argv[2];

	if ((fp1 = fopen(pch1, "rb")) == NULL)
	  operationError("Failed to open file %s\n", pch1);

	if ((fp2 = fopen(pch2, "wb")) == NULL)
	  operationError("Failed to open file %s\n", pch2);

	sz = sizeof(char);
	cnt = sizeof(buff) / sizeof(char);

	while (!feof(fp1)) {
	  printf("%ld\n", ret = fread(buff, sz, cnt, fp1));

	  if ((fwrite(buff, sz, ret, fp2)) != ret)
		operationError("Failed to write data!");

	  if (ret < (sizeof(buff) / sizeof(char)))
		break;
	}

	fclose(fp1);

	if (freopen(pch2, "r", fp2) == NULL)
	  operationError("Failed to reopen file %s\n", pch2);

	while (!feof(fp2)) {
	  ret = fread(buff, sz, cnt, fp2);

	  if ((fwrite(buff, sz, ret, stdout)) != ret)
		operationError("Failed to write string data to stdout!\n");

	  if ((puts(buff)) == EOF)
		operationError("Failed to write string data to stdout!\n");

	  if (ret < cnt)
		break;
	}

	fclose(fp2);
#endif
#if 0
	char *str0 = "abcdef";
	char *str1 = "bc";
	int ret = 0;

	ret = strcspn(str0, str1);
	printf("%d\n", ret);
#endif
#if 0
	my_getopt(argc, argv);
	my_envp(envp);
#endif
#if 0
	test_function_0();
	test_function_1();
	test_function_2();
	test_function_3();
#endif
#if 0
	int32_t array[3] = {1,2,3};
	int32_t array2[][3] = {
				{1,2,3},
				{4,5,6}
			 };
	int32_t array3[][3][3] = {
				{ {1,2,3}, {4,5,6}, {7,8,9} },
				{ {1,2,3}, {4,5,6}, {7,8,9} }
			};

	printf("%ld\n", sizeof(array));
	printf("%ld\n", sizeof(array + 0));
	printf("%ld\n", sizeof(array + 1));
	printf("%ld\n", sizeof(array + 2));
	printf("%p %p %p\n", (array + 0), (array + 1), (array + 2));
	printf("%p %p %p\n", &array[0], &array[1], &array[2]);
	printf("%d %d %d\n", *(array + 0), *(array + 1), *(array + 2));
	printf("%d %d %d\n\n", array[0], array[1], array[2]);

	printf("%ld\n", sizeof(array2));
	printf("%ld %ld\n", sizeof(*array2), sizeof(array2[0]));
	printf("%ld %ld\n", sizeof(**array2), sizeof(array2[0][0]));
	printf("%p %p %p\n\n", array2, array2[0], &array2[0][0]);

	printf("%ld\n", sizeof(array3));
	printf("%ld %ld\n", sizeof(*array3), sizeof(array3[0]));
	printf("%ld %ld\n", sizeof(**array3), sizeof(array3[0][0]));
	printf("%ld %ld\n", sizeof(***array3), sizeof(array3[0][0][0]));
	printf("%p %p %p %p\n", array3, array3[0], array3[0][0], &array3[0][0][0]);
	printf("%p %p\n", array3[0], array3[1]);
	printf("%p %p\n", (array3 + 0), (array3 + 1));
#endif
	return 0;
}

void operationError(char *fmt, ...)
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

void dispInventory(INVENTORY *ip) {
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

void test_function_0 ()
{
	stringer(In quotes in the printf function call);
 	stringer("In quotes when printed to the screen");
 	stringer("This: \"  prints an escaped double quote");
}

void test_function_1 ()
{
	FB(F B);
	FB1(F B);
}

void test_function_2 ()
{
	paster(9);
}

void test_function_3()
{
#if 0
	SLEEP_SAVE slpsv[] = {
		SAVE_ITEM(EXYNOS4_CLKSRC_CAM),
	};

	printf("EXYNOS4_CLKSRC_CAM (0x%x)\n", slpsv[0].reg);
#endif
}
