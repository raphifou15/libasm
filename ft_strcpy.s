	global	ft_strcpy

	section	.text

ft_strcpy:
	xor		rax, rax
	cmp		byte [rsi], 0
	je		end
next:
	mov		dl, byte [rsi + rax]
	mov		byte [rdi + rax], dl
	inc		rax
	cmp		byte [rsi + rax], 0
	jne		next
	mov		byte [rdi + rax], 0
end:
	mov	rax, rdi 
	ret
