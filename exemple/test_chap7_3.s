	global	main
	extern	printf
	
	section	.data
		var1	db	48
		var2	dd	456
		message db "%d", 10, 0
	
	section	.text
main:
	xor	rax, rax
	mov	rdi, message
	xor rsi, rsi
	mov	sil, byte [var1]
	sub	rsp, 8
	call printf
	add rsp, 8
	ret

