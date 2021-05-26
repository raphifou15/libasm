	global	main
	extern	printf

	section .data
		message		db	"%d", 10, 0
	section	.text

main:
	mov		rcx, 10
next:
	xor		rax, rax
	mov		rdi, message
	mov		rsi, rcx
	push	rcx
	call	printf
	pop		rcx
	loop	next
	ret
