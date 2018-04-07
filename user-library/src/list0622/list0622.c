#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>

void
usage (char *cmd)
{
	fprintf(stderr, "usage: \n");
	fprintf(stderr, "   %s -h        : show help\n", cmd);
	fprintf(stderr, "   %s -b        : say good-bye\n", cmd);
	fprintf(stderr, "   %s -n <name> : greeting to <name>\n", cmd);
}

int
main (int argc, char *argv[])
{
	int opt;
	char *greeting = "Hello, ";
	char *target = "world";
	int option_index = 0;
	struct option long_options[] = {
		{"bye", 0, NULL, 'b'},
		{"help", 0, NULL, 'h'},
		{"name", 0, NULL, 'n'},
		{0, 0, 0, 0}
	};

	while (1)
	{
		static int nCnt = 0;
		sleep(1);
		printf("%d\n", nCnt++);
	}

	while ((opt = getopt_long(argc, argv, "bhn:",
					long_options, &option_index)) != -1)
	{
		switch (opt) {
		case 'b':
			greeting = "Good-bye, ";
			break;
		case 'n':
			target = optarg;
			break;
		case 'h':
		default:
			usage(argv[0]);
			return EXIT_FAILURE;
		}
	}

	printf("%s%s!\n", greeting, target);
	return EXIT_SUCCESS;
}
