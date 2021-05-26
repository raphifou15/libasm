		global	_start
		section	.data
			max_line	equ	6
			max_size	equ 45
		section	.bss
			output:	resb max_size
		section	.text

_start:
		mov	rdx, output	; cette endroit a pour but de stocker l'adresse de output et de ne pas stcker 20
		mov	r8, 0		;
		mov	r9,	1		;
line:
		mov	byte [rdx], '*'
		inc	rdx
		inc	r8
		cmp	r8, r9
		jne	line

new_line:
		mov	byte [rdx], 10
		inc	rdx
		inc	r9
		xor	r8,	r8
		cmp	r9, max_line
		jle	line
display:
		mov	rax, 1
		mov	rdi, 1
		mov	rsi, output
		mov	rdx, max_size
		syscall
		mov	rax, 60
		xor	rdi, rdi
		syscall
