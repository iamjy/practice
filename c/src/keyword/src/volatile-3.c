void discard3(int *input)
{
	int output;
/*
	asm ("ldr %0, [%1]"
			: "=r" (output)
			: "r" (input)
			: "cc");
*/
}

void discard4(int *input)
{
	int output;
/*
	asm volatile ("ldr %0, [%1]"
					: "=r" (output)
					: "r" (input));
*/
}
