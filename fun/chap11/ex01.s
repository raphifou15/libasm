; le 3eme paramétre de la macro renvoie l'average, le quatriéme renvoie le min et le cinquiéme le max

%macro	aver	5
	xor		rax, rax
	xor		rcx, rcx
	xor		rdx, rdx
	xor		r8, r8
	mov		ecx, dword [%2]
%%sum_list:
	mov		eax, dword [%1 + r8 * 4]
	cmp		eax, dword [%4]
	jge		%%next_1
	mov		dword [%4], eax
%%next_1:
	cmp		eax, dword [%5]
	jle		%%next_2
	mov		dword [%5], eax
%%next_2:
	add		eax, dword [%3]
	mov		dword [%3], eax
	inc		r8
	loop	%%sum_list
	mov		dword [%3], eax
	cdq
	idiv	dword [%2]
	mov		dword [%3], eax
%endmacro

	global	main
	extern	printf

	section	.data
		list	dd	-34 , 99 , -2, -2, -2
		len		dd	5
		min		dd	0
		max		dd	0
		ave		dd	0
		mes		db	"%d  %d  %d", 10, 0
	section	.text

main:
	aver	list, len, ave, min, max
	xor		rax, rax
	mov		rdi, mes
	mov		esi, dword [ave]
	mov		edx, dword [min]
	mov		ecx, dword [max]
	sub		rsp, 8
	call	printf
	add		rsp, 8
end:
	ret
	
