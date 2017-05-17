#include <stdio.h>

extern int var1, var2;
int var8 = 0x33333333;
const int var9 = 0x12345678;
int var10;

void __attribute__ ((__section__ (".test"))) func1()
{
	printf("This is func1() function!\n");
	printf("var1 = 0x%X, var2 = 0x%X\n", var1, var2);
}

void __attribute__ ((__section__ (".test"))) func2()
{
	printf("This is func2() function!\n");
}

