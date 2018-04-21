#include <stdio.h>
#include "foo.h"

void func(void)
{
	printf("[%s:%s:%d] called!\n", FOO_FILE_NAME, __func__, __LINE__);
	return;
}
