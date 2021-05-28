		global	main
		extern	printf
		section .data
			mes		db		"%d", 10, 0
			elem	dd		10
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
loop:
	xor		rax, rax				; rax = 0
	cmp		byte [rbx + rcx], 0		; (rsi[1][x] - 0)
	je		print					; if (rsi[1][x] == 0) ? print : continue
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

print:
	xor		rsi, rsi
	xor		rax, rax
	mov		rdi, mes
	mov		esi, dword [num]
	sub		rsp, 8
	call	printf
	add		rsp, 8

end:								; fin du programme
	ret

	
