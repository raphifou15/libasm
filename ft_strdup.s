	global	ft_strdup
	extern	malloc
	extern	ft_strlen
	extern	ft_strcpy

; ft_strdup	rdi = char *s
; malloc = rdi = size_t
; ft_strlen, rdi = char *s

ft_strdup:
	xor		rax, rax
	push	rbx
	mov		rbx, rdi
	call	ft_strlen
	inc		rax
	mov		rdi, rax
	call	malloc
	cmp		rax, 0
	jl		error_malloc
	mov		rdi, rax
	mov		rsi, rbx
	call	ft_strcpy
end:
	pop		rbx
	ret

error_malloc:
	xor		rax, rax
	jmp		end
