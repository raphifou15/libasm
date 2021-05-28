		global	main
		extern	puts

	section		.data
		num			dd		-12345		; num to transform in string
		sign_neg	db		45			; neagtive
		minus		dd		1			; negative
	section		.bss
		line		resb	10			; where the string has to be after transformation
	section		.text

main:
	mov		rbx, 10					; rbx is the divider (rbx = 10)
	mov		r8d, -1					; r8d is the divider if (num < 0)
	mov		eax, dword [num]		; eax is the word who has to be divide
	mov		rcx, 0					; rcx will be the count
	mov		rsi, 0					; rsi will be a counter
	mov		r9, line				; mov adrress of line to r9 to negative issue part

check:								; check if the integer is negative
	xor		rdx, rdx				; mov rdx to 0 to be sure to receve a good value after divide
	cmp		eax, 0					; if (eax - 0)
	jge		loop_1					; (eax >= 0) ? loop_1 : continue
	neg		eax
	;idiv	dword [minus]			; eax / r8d = positive value in eax
	xor		r8, r8					; mov r8 to 0
	mov		r8b, byte [sign_neg]	; mov 45 ou '-' to r8b
	mov		byte [r9 + rsi], r8b	; mov the value of r8b inside line
	inc		rsi						; rsi++

loop_1:								; push all integer (0 - 9) separatly
	xor		rdx, rdx				; mov rdx to 0 to be sure to receve a good value after divide
	div		rbx						; divide eax / 10 result in eax and rest in edx
	push	rdx						; rdx is push cause i can only push <64 operand>
	inc		rcx						; rcx++
	cmp		eax, 0					; if (eax - 0)
	jne		loop_1					; (eax != 0) ? loop_1 : continue

	mov		rbx, line				; mov the adress of line in rbx : rbx = line (adress)

loop_2:								; put all the int who are on the stack on the string line convert
	pop		rax						; mov the last pop in rax
	add		al, 48					; 48 is the ascii '0' so al + 48 = (0 - 9)
	mov		byte [rbx + rsi], al	; mov the value of al inside line 
	inc		rsi						; rsi++
	loop	loop_2					; rcx-- and  (rcx != 0) ? loop_2 : continue

	mov		byte [rbx + rsi], 0		; add NULL terminate at end of the string

print:								; to see if the result is ok
	mov		rdi, line				; mov address of the string in rdi
	call	puts					; call function puts

end:
	ret								; end of program

