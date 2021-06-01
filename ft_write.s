	global	ft_write
	extern __errno_location

;rdi = fd, rsi = *buf, rdx = count

ft_write:
	xor		rax, rax			; rax = 0
	mov		rax, 1				; sys_write
	syscall						; system call
	cmp		rax, 0				; (rax - 0)
	jl		error_write			; (rax < 0) ? error_write : continue
end:
	ret							; end of the function
	
error_write:
	neg		rax					; inverse sign error  exemple (-9 become 9)
	push	rax					; push the value error on the stack
	call	__errno_location	; call	the extern function for error
	mov		rdi, rax			; reference of rax go in rdi
	pop		rax					; rax = (rax push before)
	mov		[rdi], rax			; rdi[0] = rax
	mov		rax, -1				; rax = -1 because when there is an error the return value = -1
	jmp		end					; jump end
