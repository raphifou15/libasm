%macro	ft_putnbr_tab	2
	xor		rax, rax
	xor		rbx, rbx
	xor		rcx, rcx
	mov		r8, 10
	mov		rbx, %2
	mov		eax, dword [%1]
%%begin:
	cmp		eax, 0
	jge		%%next
	mov		byte [rbx], '-'
	inc		rbx
	neg		eax
%%next:
	xor		rdx, rdx
	cdq
	idiv	r8d
	push	rdx
	inc		rcx
	cmp		eax, 0
	jne		%%begin
%%loop_1:
	pop		rax
	add		rax, 48
	mov		byte [rbx], al
	inc		rbx
	loop	%%loop_1
	mov		byte [rbx], 0
%endmacro

	global	main
	extern	printf

	section		.data
		num_3	dd	0
		num_2	dd	-43456
		num_1	dd	-23456
		mes		db	"%s", 10, 0
	section		.bss
		line_1	resb	10
	section		.text
main:
	ft_putnbr_tab	num_1, line_1
	ft_putnbr_tab	num_2, line_1
	ft_putnbr_tab	num_2, line_1
print:
	xor		rax, rax
	mov		rdi, mes
	mov		rsi, line_1
	sub		rsp, 8
	call	printf
	add		rsp, 8
end:
	ret
