	global	main
	extern	printf
	extern	puts

	section	.data
		mes_error	db	"la fonction doit prendre 1 seul paramétre", 0
		mes			db	"ce mot ou cette phrase est un palindrome", 0
		mes_error2	db	"ce mot ou cette phrase n'est pas un palindrome", 0
		dash		db	"ce signe est dash", 0
		mess		db	"%c", 10, 0
		prints		db	"%d", 10, 0
	
	section	.text
main:
	mov		rax, 2
	cmp		rdi, rax
	jne		error_1
	add		rsi, 8
	mov		rbx, [rsi]
	xor		rcx, rcx
	xor		r8, r8
loop_1:
	mov		eax, dword[rbx + rcx]
	cmp		eax, 9666786
	je		kaboum
next_3:
	xor		rax, rax
	mov		al, byte [rbx + rcx]
	movzx	rax, al
	cmp		rax, 0
	je		loop_2
	push	rax
	add		rcx, 1
	jmp		loop_1
loop_2:
	mov		eax, dword[rbx + r8]
	cmp		eax, 9666786
	je		kaboume
	xor		rax, rax
	mov		al, byte [rbx + r8]
	cmp		al, 45
	je		next_2
	cmp		al, 44
	je		next_2
	cmp		al, 33
	je		next_2
	cmp		al, 32
	je		next_2
loop_4:
	xor		rax, rax
	pop		rax
	cmp		rax, 45
	je		next
	cmp		rax, 44
	je		next
	cmp		rax, 33
	je		next
	cmp		rax, 32
	je		next
	cmp		al, byte [rbx + r8]
	jne		error_2
	add		r8, 1
	loop	loop_2
print:
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

next:
	sub		rcx, 1
	cmp		rcx, 0
	jne		loop_4
	jmp		print
next_2:
	add		r8, 1
	jmp		loop_2


kaboum:
	add		rcx, 3
	cmp		byte [rbx + rcx], 0
	je		loop_2
	jmp		loop_1
kaboume:
	sub		rcx, 3
	add		r8, 3
	cmp		rcx, 0
	je		print
	jmp		loop_2
