#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Header {
	volatile uint32_t SOF : 8;
	volatile uint32_t LEN : 10;
	volatile uint32_t VER : 6;
	volatile uint32_t SESSION : 5;
	volatile uint32_t ACK : 3;

} HEADER;

int main(int argc, char *argv[])
{
	HEADER *header;

	header = (HEADER *)malloc(sizeof(HEADER));
	memset(header, 0, sizeof(header));

	header->SOF = 0xAA;
	header->LEN = 19;
	header->VER = 7;
	header->SESSION = 3;
	header->ACK = 7;

	return 0;
}
