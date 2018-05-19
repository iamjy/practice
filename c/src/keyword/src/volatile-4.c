int loop3(int *addr)
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

int loop4(int *addr)
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
