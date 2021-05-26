	global	main
	extern	printf

	section	.bss
		turn	equ 190 ;
	section	.data
		message	db	"%ld", 10, 0
	section	.text

main:
	mov		r8, 0
	mov		r9, 0
	mov		rcx, 0
	cmp		r8, turn
	je		end
next:
	inc		rcx
	push	rcx
	mov		rdi, message
	mov		rsi, r8
	xor		rax, rax
	call 	printf
	pop		rcx
	cmp		rcx, turn
	je		end
	inc		rcx
	push	rcx
	mov		rdi, message
	mov		rsi, 1
	xor		rax, rax
	call	printf
	pop		rcx
	cmp		rcx, turn
	mov		r8, 1
	mov		r9, 1
	je		end
fib:
	inc		rcx
	push	rcx
	push	r8
	push	r9
	mov		rdi, message
	mov		rsi, r9
	xor		rax, rax
	call	printf
	pop		r9
	pop		r8
	pop		rcx
	mov		rax, r9
	add		r9, r8
	cmp		r9, r8
	cmovl	r9, r8
	mov		r8, rax
	cmp		rcx, turn
	jne		fib
end:
	ret
