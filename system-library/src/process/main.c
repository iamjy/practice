#include <stdint.h>
#include <stdbool.h>

int main(int argc, char *argv[])
{
	printf("My pid=%jd\n", (intmax_t)getpid());
	return 0;
}
