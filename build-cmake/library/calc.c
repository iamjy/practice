#include <stdio.h>
#include "add.h"
#include "sub.h"
#include "mult.h"

int main()
{
	#ifdef TEST
	printf("TEST is defined\n");
	#endif

	add();
	sub();
	mult();

	return 0;
}
