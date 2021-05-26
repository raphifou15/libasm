	global	main
	extern	puts

	section	.text

main:
	push	rdi
	push	rsi
	mov		rdi, [rsi]
	call	puts
	pop		rsi
	pop		rdi
	add		rsi, 8
	dec		rdi
	jnz		main
end:
	ret
