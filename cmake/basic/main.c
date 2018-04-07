#include <stdio.h>
#include "bar.h"

extern void func(void);

int main(void)
{
	func();
	return 0;
}
