	global	stats2

stats2:
; prologue
	push	rbp
	mov		rbp, rsp
	push	rbx
	xor		rbx, rbx
	xor		rax, rax
; return min is the first value of address
	mov		eax, dword [rdi]
	mov		dword [rdx], eax
; return max is the last value of address [rdi + rsi - 1 * 4]
	dec		rsi
	mov		eax, dword [rdi + rsi * 4]
	inc		rsi
	mov		dword [r8], eax
; return med the middle of the address because is ordered
	mov		r8, 2
	mov		eax, dword [rdi + r8 * 4]
	mov		dword [rcx], eax
; return sum of the address
	xor		rcx, rcx
	xor		rax, rax
loop_1:
	add		eax, dword [rdi + rcx * 4]
	inc		rcx
	cmp		rcx, rsi
	jne		loop_1
	mov		dword [r9], eax
; return average of the address
	xor		rdx, rdx
	cdq
	idiv	rsi
	mov		rbx, [rbp + 16]
	mov		dword [rbx], eax
end:
	pop		rbx
	pop		rbp
	ret
