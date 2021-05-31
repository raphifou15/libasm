	global	stats2
	extern	ft_sort
	section	.text

; -----------------------------------------------------------
;ft_sort:
; prologue ft_sort receive adrress list in rdi and len in rsi
; lets go
;	push	rbx
;	xor		rbx, rbx		; rbx = 0
;	xor		rax, rax		; receive value
;	xor		rcx, rcx		; couter
;	sub		rsi, 1			; the last elem is rsi - 1
;loop_1:
;	mov		eax, dword [rdi + rcx * 4]
;	inc		rcx
;	cmp		eax, dword [rdi + rcx * 4]
;	jg		change_value
;	cmp		rcx, rsi
;	jne		loop_1
;end:
;	pop		rbx
;	ret

;change_value:
;	mov		eax, dword [rdi + rcx * 4]
;	dec		rcx
;	mov		ebx, dword [rdi + rcx * 4]
;	mov		dword [rdi + rcx * 4], eax
;	inc		rcx
;	mov		dword [rdi + rcx * 4], ebx
;	xor		rcx, rcx
;	jmp		loop_1
; ------------------------------------------------------------

stats2:
; prologue
	push	rbp
	push	rbx
	push	rdx
	push	rcx
	push	r8
	push	r9
	call	ft_sort
	inc		rsi
	pop		r9
	pop		r8
	pop		rcx
	pop		rdx
	pop		rbx
	pop		rbp
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

