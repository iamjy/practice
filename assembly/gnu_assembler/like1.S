	.text
.global main
main:
	sub	$4, %rdi
	mov	$likestr, %rdi
	call	puts
	add	$4, %rdi
	ret

likestr:
	.string "I like you!"
