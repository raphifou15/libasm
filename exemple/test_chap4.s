	global	main
	extern	printf

	section	.data
		
		bresult	dd	0
		bvar1	db	38
		bvar2	db	11
		message	db	"%c", 10, 0

	section	.text

main:
	mov	al, byte [bvar1]
	add	al, byte [bvar2]
	mov	byte [bresult], al
	sub	rsp, 8
	xor	rax, rax
	mov	rdi, message
	mov	rsi, [bresult]
	call printf
	add	rsp, 8
	ret
