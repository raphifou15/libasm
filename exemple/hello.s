	global	_start

	segment	.data

	raph	db 'salut', 10

	segment	.text

_start:
	
	mov	rax, 1 		; sys_write
	mov	rdi, 1		; unsigned int fd
	mov	rsi, raph	; const char *buf
	mov	rdx, 6		; size_t count
	syscall
	mov rax, 60		; sys_exit
	xor	rdi, rdi	; int error_code
	syscall			; appell machine
