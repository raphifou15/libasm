	global	main
	extern	printf
	
	section	.data
		average_n	dd		0
		sum_n		dd		0
		count_n		dd		0	
		average		dd		0
		sum			dd		0
		maximum		dd		0
		minimum		dd		0
		tab			dd		10, 22, -5, 32, -3
		mes			db		"maximum = %d", 10, "minimum = %d", 10, "sum = %d", 10, "average = %d", 10, 0
		mes2		db		"count_n = %d", 10, "sum_n = %d", 10, "average_n = %d", 10, 0

	section	.text
main:
	xor		rax, rax
	mov		eax, dword [tab]
	mov		dword [minimum], eax
	xor		rax, rax
	mov		rcx, 5
	mov		rsi, 0
	mov		rbx, tab
loop_1:
	mov		eax, dword [rbx + rsi * 4]
	mov		r8d, dword [sum]
	add		r8d, eax
	mov		dword [sum], r8d
	xor		r8, r8
	cmp		dword [minimum], eax
	jg		min
next:
	cmp		dword [maximum], eax
	jl		max
next_2:
	add		rsi, 1
	loop	loop_1
	mov		r8d, 5
	xor		rax, rax
	xor		rdx,rdx
	mov		eax, dword [sum]
	div		r8d
	xor		r8, r8
	mov		dword [average], eax
	xor		rdx, rdx
print:
	xor		rax, rax
	mov		rdi, mes
	mov		esi, dword [maximum]
	mov		edx, dword [minimum]
	mov		ecx, dword [sum]
	mov		r8d, dword [average]
	sub		rsp, 8
	call	printf
	add		rsp, 8
subset_2:
	xor		rdx, rdx
	xor		rax, rax
	xor		rbx, rbx
	xor		rcx, rcx
	mov		rbx, tab
	mov		rcx, 5
	xor		rsi, rsi
loop_2:
	mov		eax, dword [rbx]
	mov		r9d, 0
	cmp		eax, r9d
	jge		next_3
	xor		r8, r8
	mov		r8d, 1
	add		r8d, dword [count_n]
	mov		dword [count_n], r8d
	xor		r8, r8
	mov		r8d, dword [sum_n]
	add		r8d, eax
	mov		dword [sum_n], r8d
	add		rsi, 1
next_3:
	add		rbx, 4
	loop	loop_2
next4:
	xor		rdx, rdx
	mov		eax, dword [sum_n]
	cdq
	idiv	esi
	mov		dword [average_n], eax
print2:
	mov		rdi, mes2
	mov		esi, dword [count_n]
	mov		edx, dword [sum_n]
	mov		ecx, dword [average_n]
	xor		rax, rax
	sub		rsp, 8
	call	printf
	add		rsp, 8
end:
	ret

min:
	mov		dword [minimum], eax
	jmp	next

max:
	mov		dword [maximum], eax
	jmp	next_2
