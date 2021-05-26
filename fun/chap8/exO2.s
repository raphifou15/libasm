	global	main
	extern	printf

	section	.data
		average	dd		0
		min		dd		0
		max		dd		0
		tab		dd		10, 50, 30, 40, 5
		mes		db		"maximum = %d", 10, "minimum = %d", 10, "average = %d", 10, 0
	section	.text
main:
	xor		rax, rax
	mov		eax, dword [tab]
	mov		dword [min], eax
	xor		rax, rax
	mov		rcx, 5
	mov		rbx, tab
	mov		rsi, 0
add:
	mov		eax, dword [rbx + rsi * 4]
	cmp		dword [max], eax
	jl		maximum
next:
	cmp		eax, dword [min]
	jl		minimum
next_2:
	add		eax, dword [average]
	mov		dword [average], eax
	add		rsi, 1
	loop	add
	xor		rsi, rsi
	mov		esi, 5
	mov		eax, dword [average]
	xor		rdx, rdx
	div		esi
	mov		dword [average], eax
display:
	mov		rdi, mes
	xor		rsi, rsi
	mov		esi, dword [max]
	mov		edx, dword [min]
	mov		ecx, dword [average]
	xor		rax, rax
	sub		rsp, 8
	call	printf
	add		rsp, 8
end:
	ret

maximum:
	mov		dword [max], eax
	jmp		next

minimum:
	mov		dword [min], eax
	jmp		next_2

