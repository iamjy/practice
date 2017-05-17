void discard1()
{
	int i;
	int d1 = 1;
	int sum = 0;

	for (i = 0; i < 10; i++)
		sum += d1;
}

void discard2()
{
	int i;
	volatile int d2 = 1;
	int sum = 0;

	for (i = 0; i < 10; i++)
		sum += d2;
}

int main()
{
	discard1();
	discard2();
}
