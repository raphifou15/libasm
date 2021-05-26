	global	main
	extern	printf

	section	.bss
		turn	equ  1			; nombre de tours que fera la suite de fib
	section	.data
		first_message	db	"%d", 10, "%d", 10, 0 ; Premier message
		message			db  "%d", 10, 0
	section	.text

main:
	push rbx;
	xor	rax, rax
	push rax
	cmp	rax, turn
	je end
	inc	rax
	cmp	rax, turn
	je fib_sp
	push 1
	mov	rdi, first_message				; mon premier élément sera 0
	mov	rsi, 0							; mon second élément sera 1
	mov	rdx, 1
	xor	rax, rax
	call printf
	pop	rsi
	pop	rdx
	push 2
	mov r10, 2
	cmp	r10, turn
	je	end
	jmp fib

fib_sp:
	mov	rdi, message				; mon premier élément sera 0
	xor	rax, rax
	mov	rsi, 0						; mon second élément sera 1
	call printf
	jmp end

fib:
	pop	r10
	push rsi
	add	rsi, rdx
	push rsi
	add	r10, 1					 ;j'incrémente r10
	push r10
	xor	rax, rax
	mov	rdi, message
	call printf
	pop	r10
	pop	rsi
	pop	rdx
	push r10
	cmp r10, turn
	jne	fib
end:
	pop	rax
	pop rbx
	ret
