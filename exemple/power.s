	global	main
	extern	printf
	extern	atoi
	extern	puts

	section	.data

		message	db	"la fonction doit prendre 2 pramamétres", 0
		message2 db	"%d", 10, 0
		neg_message	db	"l'exposent ne doit pas être négatif", 0
		mes_pos db	"1", 0
		mes_neg db	"-1", 0
	
	section	.text
main:
	cmp		rdi, 3
	je		next
	mov		rdi, message
	call	puts
	jmp		end

next:
	add		rsi, 8
	push	rsi
	xor		rax, rax
	mov		rdi, [rsi]
	call	atoi
	mov		r8, rax
	pop		rsi	
	add		rsi, 8
	push	rsi
	push	r8
	xor		rax, rax
	mov		rdi, [rsi]
	call	atoi
	mov		r9, rax
	pop		r8
	pop		rsi

neg:
	cmp		r9d, 0
	jge		zero
	push	r8
	push	r9
	mov		rdi, neg_message
	call	puts
	pop		r9
	pop		r8
	jmp		end
zero:
	mov		rcx, r8
	cmp		r9, 0
	jne		power
	cmp		r8d, 0
	jge		pos
	jl		nega
power:
	dec		r9
	jz		print
	imul	r8d, ecx
	cmp		r9, 0
	jne		power
print:
	push	r8
	mov		rdi, message2
	mov		rsi, r8
	xor		rax, rax
	call	printf
	pop		r8

end:
	ret

pos:
	mov		rdi, mes_pos
	call	puts
	jmp		end
nega:
	mov		rdi, mes_neg
	call	puts
	jmp		end
	
