	global	ft_read
	extern	__errno_location

; rdi = fd, rsi = *buf, rdx = count
; system call to read  rax = 0 (SYS_read), rdi (unsigned int fd), rsi (char *buf), rdx (size_t count)

ft_read:
	xor		rax, rax		; rax = 0
	syscall					; all the info are sent into the function at the right place so
	cmp		rax, 0			; (rax - 0)
	jl		error_read		; (rax < 0) ? error_read : continue
end:
	ret						; end of the funtion

error_read:
	neg		rax				; change sign of the rax value
	push	rax				; put the value of rax on the stack
	call	__errno_location	; call the function to use erno
	mov		rdi, rax		; rdi = adress rax
	pop		rax				; replace the value of rax in rax
	mov		[rdi], rax		; rdi[0] = rax
	mov		rax, -1			; rax = -1
	jmp		end				; go to end
