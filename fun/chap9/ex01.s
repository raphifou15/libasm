		global	main
		extern	printf

		section	.data

			tab		dq		1, 2, 3, 4, 5
			mes		db		"%d", 10, 0
		section	.text

main:
	xor		rax, rax
	mov		rbx, tab			; put address of tab inside rbx
	mov		rcx, 5				; put 5 inside rcx
	mov		rsi, 0				; put 0 inside rsi
loop_1:
	mov		rax, [rbx + rsi * 8] 
	push	rax					; put the value in the adrress of [rbx + rsi * 8] inside the stack (pile)
	add		rsi, 1				; add 1 to rsi
	loop	loop_1				; decrement of 1 rcx and jump to loop_1 while rcx is different of 0
	mov		rcx, 5				; put 5 in rcx
	mov		rsi, 0				; put 0 to rsi
loop_2:
	pop		rax
	mov		[rbx + rsi * 8], rax
	add		rsi, 1				; put 1 in rsi
	loop	loop_2				; decrement of 1 rcx and jump to loop_2 while rcx is different of 0
	mov		rsi, 0
	mov		rcx, 5
print:
	push	rcx
	push	rsi
	xor		rax, rax
	mov		rdi, mes
	mov		rsi, [tab + rsi * 8]
	sub		rsp, 8
	call	printf
	add		rsp, 8
	pop		rsi
	pop		rcx
	add		rsi, 1
	loop	print
end:
	ret

