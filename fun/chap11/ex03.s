%macro	multi_2	2
	xor		rcx, rcx
	xor		rax, rax
	xor		rdx, rdx
	xor		rbx, rbx
	mov		ecx, dword [%2]
%%multy:
	mov		eax, [%1 + rbx * 4]
	imul	eax, 2
	mov		[%1 + rbx * 4], eax
	inc		rbx
	loop	%%multy
%endmacro

	global	main
	extern	printf
	
	section	.data
		list_1	dd	10, 22, 55
		list_2	dd	-4, -19, -32
		list_3	dd	-4, 22, -32
		len		dd	3
		mes		db	"%d  %d  %d", 10, 0
	
	section	.text

main:	
	multi_2	list_1, len
	multi_2	list_2, len
	multi_2	list_3, len
	xor		rcx, rcx
print:
	xor		rax, rax
	mov		rdi, mes
	mov		esi, dword [list_1]
	mov		edx, dword [list_1 + 4]
	mov		ecx, dword [list_1 + 8]
	sub		rsp, 8
	call	printf
	add		rsp, 8

	xor		rax, rax
	mov		rdi, mes
	mov		esi, dword [list_2]
	mov		edx, dword [list_2 + 4]
	mov		ecx, dword [list_2 + 8]
	sub		rsp, 8
	call	printf
	add		rsp, 8

	xor		rax, rax
	mov		rdi, mes
	mov		esi, dword [list_3]
	mov		edx, dword [list_3 + 4]
	mov		ecx, dword [list_3 + 8]
	sub		rsp, 8
	call	printf
	add		rsp, 8
end:
	ret
