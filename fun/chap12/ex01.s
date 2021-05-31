	global	stats1

	section	.text

stats1:
	push	rbx
	xor		rbx, rbx
	xor		rax, rax
loop_1:
	add		eax, dword [rdi + rbx * 4]
	inc		rbx
	cmp		rbx, rsi
	jne		loop_1
	
	mov		dword [rdx], eax
	xor		rdx, rdx
	cdq
	idiv	esi
	mov		dword [rcx], eax
	pop		rbx
end:
	ret
