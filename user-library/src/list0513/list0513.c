#include <stdio.h>
#include <dlfcn.h>

int
main (int argc, char *argv[])
{
	void *handle = dlopen ("./liblist0513.so", RTLD_NOW);
	void (*func)(void) = dlsym (handle, "function");
	(*func) ();

	while (1)
	{
		static int nCnt = 0;
		sleep(1);
		printf("%d\n", nCnt++);
	}

	dlclose (handle);
	return 0;
}
