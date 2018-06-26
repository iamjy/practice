/**
 * @file	main.c
 * @author	iamjy1005@gmail.com <Jinyoung Park>
 * @date	2018.06.18
 * @brief 	Practice macro syntax in C
 * @see # : https://msdn.microsoft.com/ko-kr/library/7e3a913x.aspx
 * @see ## : https://msdn.microsoft.com/ko-kr/library/09dwwt6y.aspx
 */

/*****************************************************************************
 * Inclusion
 *****************************************************************************/
#include "main.h"

/*****************************************************************************
 * Macro definitions
 *****************************************************************************/
#define stringer( x ) printf( #x "\n" )

#define F abc
#define B def
#define FB(arg) #arg
#define FB1(arg) FB(arg)

#define paster( n ) printf( "token" #n " = %d\n", token##n )

#define SAVE_ITEM(x) { .reg = (x) }

/*****************************************************************************
 * Type definition
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
int main (int arTgc, char const *argv[])
{
	test_function_0();
	test_function_1();
	test_function_2();
	test_function_3();

	return 0;
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
	SLEEP_SAVE slpsv[] = {
		SAVE_ITEM(EXYNOS4_CLKSRC_CAM),
	};

	printf("EXYNOS4_CLKSRC_CAM (0x%x)\n", slpsv[0].reg);
}
