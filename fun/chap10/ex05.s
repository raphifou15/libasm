		global	main
		extern	printf
		extern	puts
		section .data
			mes		db		"%d", 10, 0
			elem	dd		10
			sign	dd		0
			mes_error	db	"error", 0
		section	.bss
			num		resd	1
		section	text
main:								; check argc
	mov		rax, 2					; rax = 2
	cmp		rdi, rax				; if (rdi - rax)
	jne		end						; if (rdi != 2) ? end : continue
	add		rsi, 8					; add 8 to rsp to go to the next adress, (line) rsi += 8
	mov		rbx, [rsi]				; mov address [rsi] (value) rsi is a double tab
	mov		rcx, 0					; rcx = 0
	mov		dword [num], ecx		; num = 0

check_begin:
	cmp		byte [rbx + rcx], 43	; (rsi[1][x] - 43)
	je		sign_plus				; jump sign_plus

check_begin_2:
	cmp		byte [rbx + rcx], 45	; (rsi[1][x] - 45)
	je		sign_minus				; jump sign_minus

loop:
	xor		rax, rax				; rax = 0
	cmp		byte [rbx + rcx], 0		; (rsi[1][x] - 0)
	je		number_sign				; if (rsi[1][x] == 0) ? number_sign : continue
	cmp		byte [rbx + rcx], 48	; (rsi[1][x] - 48)
	jl		error					; (rsi[1][x] < 48) ? error: continue
	cmp		byte [rbx + rcx], 58	; (rsi[1][x] - 48)
	jg		error					; (rsi[1][x] > 48) ? error: continue
	mov		eax, dword [num]		; eax = num
	mul		dword [elem]			; eax * elem(10)
	mov		dword [num], eax		; num = eax
	xor		rax, rax				; rax = 0
	mov		al, byte [rbx + rcx]	; al = rsi[1][x]
	sub		al, 48					; al -= 48
	movzx	eax, al					; eax = al
	add		eax, dword [num]		; eax = eax + num
	mov		dword [num], eax		; num = eax
	inc		rcx						; rcx++
	jmp		loop					; jump loop

number_sign:
	xor		rax, rax				; xar = 0
	cmp		dword [sign], eax		; (sign - 0)
	je		print					; (sign == 0) ? print : continue
	mov		eax, dword [num]		; eax = num
	neg		eax						; eax = -eax
	mov		dword [num], eax		; num = eax

print:
	xor		rax, rax
	xor		rsi, rsi
	mov		rdi, mes
	mov		esi, dword [num]
	sub		rsp, 8
	call	printf
	add		rsp, 8

end:								; fin du programme
	ret

sign_plus:
	inc		rcx						; rcx++
	jmp		check_begin				; jump check_begin_2

sign_minus:
	inc		rcx						; rcx++
	mov		dword [sign], ecx		; sign = 1
	jmp		check_begin				; jump loop

error:
	mov		rdi, mes_error			; rdi = mes_error : 1 élément to sent to the function puts
	call	puts					; call function puts to print mes_error
	jmp		end						; jump to end
