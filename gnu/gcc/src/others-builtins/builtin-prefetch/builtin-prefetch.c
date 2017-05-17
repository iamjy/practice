#define N 2

int main(void)
{
	int i;
	int n = N;
	int a[N] = {0,}, b[N] = {0,};

	for (i = 0; i < n; i++)
	{
		a[i] = a[i] + b[i];

		__builtin_prefetch (&a[i+1], 1, 1);
		__builtin_prefetch (&b[i+1], 0, 1);
	}

	return 0;
}
