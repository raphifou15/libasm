		global	main
		extern	printf
		extern	puts

		section	.data
			mes_error	db	"la fonction doit prendre 1 seul paramétre", 0
			mes			db	"ce mot ou cette phrase est un palindrome", 0
			mes_error2	db	"ce mot ou cette phrase n'est pas un palindrome", 0
			mess		db	"%ld", 10, 0

main:
	mov		rax, 2
	cmp		rdi, rax
	jne		error_1
	add		rsi, 8				; passer au prochain argument passer en paramétre
	xor		rax, rax
	xor		rcx, rcx
	mov		r8, [rsi]
loop_1:
	mov		al, byte [r8 + rcx * 1]
	cmp		al, 0
	je		next
	movzx	rax, al
	mov		rdi, mess
	mov		rsi, rax
	push	rax
	add		rcx, 1
	jmp		loop_1
next:
	xor		rax, rax
	xor		rbx, rbx
loop_2:
	pop		rax
	cmp		al, byte [r8 + rbx * 1]
	jne		error_2
	add		rbx, 1
	loop	loop_2
	mov		rdi, mes
	call	puts
end:
	ret

error_1:
	mov		rdi, mes_error
	call	puts
	jmp		end
error_2:
	sub		rcx, 1
loop_3:
	pop		rax
	loop	loop_3
	mov		rdi, mes_error2
	call	puts
	jmp		end
