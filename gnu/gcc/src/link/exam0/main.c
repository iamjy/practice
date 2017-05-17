#include <stdio.h>

void func1();
void func2();

int var1 = 0x11111111;
int var2;
int var3 = 0;

int main()
{
	static int var4 = 0x22222222;
	static int var5;
	int var6;

	printf("This is main() function!\n");
	func1();
	func2();

	return 0;
}
