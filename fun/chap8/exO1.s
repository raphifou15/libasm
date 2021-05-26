	global	main
	extern	printf
	
	section	.data

	mes		db	"%d", 10, 0
	tab		dd	2, 10, 10, 10, 10

	section	.text

main:
	mov		rcx, 5
	xor		rax, rax
	mov		rsi, 0
	mov		rbx, tab
add:
	add		eax, dword [rbx + rsi * 4]
	add		rsi, 1
	loop	add
display:
	mov		rdi, mes
	xor		rsi, rsi
	mov		esi, eax
	xor		rax, rax
	sub		rsp, 8
	call	printf
	add		rsp, 8
end:
	ret

