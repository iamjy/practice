#include "interact.h"
#include "sched.h"

int main(int arc, char *argv[])
{
	parse();
	waitloop();

	return 0;
}
