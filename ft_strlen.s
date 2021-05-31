	global	ft_strlen

	section	.text
; the value sent is a reference address of a string inside rdi

ft_strlen:
	push	rbx						; is a calle saved register so i put the value on the stack
	xor		rax, rax				; (will be the value send so) rax = 0
	xor		rbx, rbx				; rbx = 0
loop_1:								; loop the string byte by byte
	mov		al, byte [rdi + rbx]	; al = rdi[x] : al is byte register for rax
	cmp		al, 0					; (al - 0)
	je		end						; (al == 0) ? end : continue
	inc		rbx						; rbx += 1
	jmp		loop_1					; jump to loop_1
end:
	mov		rax, rbx				; rax = rbx (count final)
	pop		rbx						; replace the initial value inside rbx
	ret								; end of the function
