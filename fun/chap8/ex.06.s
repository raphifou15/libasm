	global	main
	extern	printf

	section	.data
		
		tab		dd		2, 10, -5, 34, 0
		mes		db		"%d", 10, 0

main:
	xor		rax, rax
	xor		rbx, rbx
	xor		rsi, rsi
	mov		rbx, tab
	mov		rcx, 4
loop_1:
	xor		r8, r8
	mov		r8d, [rbx + rsi * 4]
	cmp		r8d, [rbx + rsi * 4 + 4]
	jle		next
	mov		eax, [rbx + rsi * 4]
	mov		r8d, [rbx + rsi * 4 + 4]
	mov		[rbx + rsi * 4], r8d
	mov		[rbx + rsi * 4 + 4], eax
	mov		rcx, 5
	mov		esi, -1
next:
	add		esi, 1
	loop	loop_1
	xor		rbx, rbx
	mov		rcx, 5
print:
	xor		rax, rax
	xor		rsi, rsi
	mov		rdi, mes
	mov		esi, [tab + rbx * 4]
	push	rbx
	push	rcx
	sub		rsp, 8
	call	printf
	add		rsp, 8
	pop		rcx
	pop		rbx
	add		rbx, 1
	loop	print
end:
	ret
