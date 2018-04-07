#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>

void usage(void)
{

}

int main(int argc, char *argv[])
{
	struct option long_options[] = {
		{"bye", 0, NULL, 'b'},
		{"help", 0, NULL, 'h'},
		{"name", 1, NULL, 'n'},
		{0, 0, 0, 0}
	};
	int option_index;
	int opt;
	char *str0 = "Hello, ";
	char *str1 = "workd!";
	
	while ((opt = getopt_long(argc, argv, "bhn:",
							   long_options, &option_index)) != -1)
	{
		switch (opt) {
		case 'b':
			str0 = "-b-";
			break;
		case 'h':
			usage();
			return EXIT_FAILURE;
		case 'n':
			str1 = optarg;
			break;
		}
	}

	printf("%s%s\n", str0, str1);
	return EXIT_SUCCESS;
}
