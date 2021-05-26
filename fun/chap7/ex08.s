	global	main
	extern	printf
	extern	atoi
	
	section	.text
		message	db	"%ld", 10, 0
main:
	add		rsi, 8
	mov		rdi, [rsi]
	call	atoi
	movsxd	rcx, eax
	mov		rax, 0
	cmp		rcx, 0
	jle		end

next:
	add		rax, rcx
	loop	next
	imul	rax
	mov		rsi, rax
	mov		rdi, message
	sub		rsp, 8
	call	printf
	add		rsp, 8
end:
	ret

