#include <fill.h> // same as .include "fill.h"

	.text
.global main
main:
#if MY_SYMBOL <= 10 // same as .if in *.S file not *.s file
	.macro	writeb ch, rb
		mov	$\ch, %rdi
		call	puts
	.endm
#else // same as .else
#endif // same as .endif
	writeb str, %rax
	ret

str: .string "hi\n"
