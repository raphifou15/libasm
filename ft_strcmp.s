	global	ft_strcmp

	section	.text

ft_strcmp:
	xor		rax, rax				; rax = 0
	xor		rcx, rcx				; rcx = 0
	xor		rdx, rdx				; rdx = 0
next:
	cmp		byte [rdi + rax], 0		; (rdi[0] - 0)
	je		zero_zero				; (rdi[0] == 0) ?  zero_zero : continue
next_2:
	mov		cl, byte [rdi + rax]	; (byte rcx) cl = rdi[x]
	mov		dl, byte [rsi + rax]	; (byte rdx) dl = rsi[x]
	inc		rax						; rax += 1
	cmp		cl, dl					; cl - dl
	je		next					; (cl == dl) ? next : continue
	jg		sup						; (cl > dl) ? sup : continue
	mov		eax, -1					; (4 byte of rax) eax = -1
end:
	ret								; end

zero_zero:
	cmp		byte [rsi + rax], 0		; (rsi[0] - 0)
	je		pass_zero				; (rsi == 0) ? pass_zero : continue
	jmp		next_2					; jump next_2

pass_zero:
	xor		rax, rax				; rax = 0
	jmp		end						; jump to end
sup:
	mov		eax, 1					; eax = 1
	jmp		end						; jump to the end
