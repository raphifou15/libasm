	global	main
	extern	printf

	section	.data
		var1		db	-48				; movsx
		var2		db	48				; movzx
		var3		dd	455				; movswd
		var4		dd	2				; mul  div  unsigned
		var5		dd	-2				; imul idiv signed
		message		db	"%d", 10, 0
		res_modulo	db	"result: %d   modulo: %d", 10, 0
	section	.text
main:
	
	xor		rax, rax
	mov		rdi, message
	movsx	rsi, byte [var1]
	sub		rsp, 8
	call	printf
	add		rsp, 8
	xor		rax, rax
	mov		eax, dword [var3]
	mul		dword [var4]
	mov		dword [var4], eax
	xor		rax, rax
	mov		rdi, message
	mov		esi, dword [var4]
	sub		rsp, 8
	call	printf
	add		rsp, 8
	mov		eax, dword [var3]
	imul	eax, dword [var5]
	mov		dword [var5], eax
	mov		rdi, message
	mov		esi, dword [var5]
	xor		rax, rax
	sub		rsp, 8
	call	printf
	add		rsp, 8
	mov		eax, 2
	mov		dword [var4], eax
	xor		rdx, rdx
	mov		eax, dword [var3]
	div		dword [var4]
	mov		dword [var3], eax
	xor		rax, rax
	mov		rdi, res_modulo
	mov		esi, dword [var3]
	sub		rsp, 8
	call	printf
	add		rsp, 8

	ret
