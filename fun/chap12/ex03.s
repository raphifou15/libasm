	global	ft_sort

	section	.text

ft_sort:
; prologue ft_sort receive adrress list in rdi and len in rsi
; lets go
	push	rbx
	xor		rbx, rbx		; rbx = 0
	xor		rax, rax		; receive value
	xor		rcx, rcx		; couter
	sub		rsi, 1			; the last elem is rsi - 1
loop_1:
	mov		eax, dword [rdi + rcx * 4]
	inc		rcx
	cmp		eax, dword [rdi + rcx * 4]
	jg		change_value
	cmp		rcx, rsi
	jne		loop_1
end:
	pop		rbx
	ret



change_value:
	mov		eax, dword [rdi + rcx * 4]
	dec		rcx
	mov		ebx, dword [rdi + rcx * 4]
	mov		dword [rdi + rcx * 4], eax
	inc		rcx
	mov		dword [rdi + rcx * 4], ebx
	xor		rcx, rcx
	jmp		loop_1
