/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

#ifndef _API_H_
#define _API_H_

/*****************************************************************************
 * Header files
 *****************************************************************************/
#include "common.h"

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
 * Type definitions
 *****************************************************************************/
typedef uint32_t phys_addr_t;
typedef struct membank;
typedef struct meminfo;

/*****************************************************************************
 * Enumerations
 *****************************************************************************/
enum {ARRAY_SIZE = 20};
enum {QUIT, TITLE, PRICE, PAGE, MENU_COUNT};

/*****************************************************************************
 * Structures
 *****************************************************************************/
/**
 *
 */
typedef struct _BOOK {
  char title[256];
  int price;
  int page;
} BOOK;

/**
 * 상품 재고 관리용 inventory 구조체 정의
 */
 typedef struct inventory {
	char *number; ///< 상품 번호
	char *name;   ///< 상품명
	int volume;   ///< 재고 수량
	int leadtime; ///< 매입 일수
} INVENTORY;

/**
 *
 */
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

/**
 *
 */
struct smp_operations {
	void (*smp_init_cpus)(void);
	void (*smp_prepare_cpus)(unsigned int max_cpus);
	void (*smp_secondary_init)(unsigned int cpu);
	int  (*smp_boot_secondary)(unsigned int cpu, struct task_struct *idle);
	int  (*cpu_kill)(unsigned int cpu);
	void (*cpu_die)(unsigned int cpu);
	int  (*cpu_disable)(unsigned int cpu);
};

/**
 *
 */
struct pt_regs {
	uint32_t var;
};

/**
 *
 */
struct task_struct {
	uint32_t var;
};

/**
 *
 */
struct membank {
	phys_addr_t start;
	phys_addr_t size;
};

/**
 *
 */
struct meminfo {
	struct membank bank[10];
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
 *  @return
 */
void test_func(void);
int my_envp (char **envp);
int my_getopt (int argc, char **argv);
void my_getopt_usage (char *cmd);
FILE *fopen_read(const char *f_name);
FILE *fopen_write(const char *f_name, bool mode_a);
FILE *fopen_read_binary(const char *f_name);
FILE *fopen_write_binary(const char *f_name, bool mode_a);
FILE *fopen_read_write(const char *fname, bool mode_a);
void discard1(void);
void discard2(void);
void discard3 (int *input);
void discard4 (int *input);
int32_t loop1(int32_t *addr);
int32_t loop2(volatile int32_t *addr);
void operationError(char *fmt, ...);
void dispInventory(INVENTORY *ip);
void init_books(BOOK *books, int size);
int select_menu(void);
void print_books(BOOK *books, int size);
int compare_title(const void *p1, const void *p2);
int compare_price(const void *p1, const void *p2);
int compare_page(const void *p1, const void *p2);

#endif /* _POINTER_H_ */
