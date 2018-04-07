#include <glib.h>
#include <stdio.h>

int
main (int argc, char *argv[], char *envp[])
{
	int i;
	GQueue *gq = g_queue_new();

	for (i = 0; i < argc; i++)
	{
		g_queue_push_head(gq, argv[i]);
	}

	while (!g_queue_is_empty(gq))
	{
		printf("%s\n", (char *)g_queue_pop_tail(gq));
	}

	return 0;
}
