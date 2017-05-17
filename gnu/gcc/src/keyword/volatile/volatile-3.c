void discard3(int *input)
{
	int output;

	asm ("ldr %0, [%1]"
			: "=r" (output)
			: "r" (input)
			: "cc");
}

void discard4(int *input)
{
	int output;

	asm volatile ("ldr %0, [%1]"
					: "=r" (output)
					: "r" (input));
}

int main()
{
	int d3 = 0;
	int d4 = 0;

	discard3(&d3);
	discard4(&d4);

	return 0;
}
