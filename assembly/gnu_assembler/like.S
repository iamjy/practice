	.text
.global main
main:
	mov	$likestr, %rdi
	call	puts
	ret

likestr:	.string "I like you\n"
aaa:		.long 1234
