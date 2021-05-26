	global	main
	extern	printf

	section	.data
		message	db	"%d", 10, 0

		bAns1	db	0
		bAns2	db	0
		bAns3	db	0
		bAns6	db	0
		bAns7	db	0
		bAns8	db	0
		wAns11	dw	0
		wAns12	dw	0
		wAns13	dw	0
		bAns16	db	0
		bAns17	db	0
		bAns18	db	0
		bRem18	db	0
		bNum1	db	1
		bNum2	db	2
		bNum3	db	3
		bNum4	db	4
		wNum1	dw	7
	section	.text

main:
	xor		rax, rax
	xor		rsi, rsi
	mov		al, byte [bNum1]
	add		al, byte [bNum2]
	mov		byte [bAns1], al
	xor		rax, rax
	mov		rdi, message
answer1:
	mov		sil, byte [bAns1]
	sub		rsp, 8
	call	printf
	add		rsp, 8
answer2:
	xor		rax, rax
	xor		rsi, rsi
	mov		al, byte [bNum1]
	add		al, byte [bNum3]
	mov		byte [bAns2], al
	xor		rax, rax
	mov		rdi, message
	mov		sil, byte [bAns2]
	sub		rsp, 8
	call	printf
	add		rsp, 8
answer3:
	xor		rax, rax
	xor		rsi, rsi
	mov		al, byte [bNum3]
	add		al, byte [bNum4]
	mov		byte [bAns3], al
	xor		rax, rax
	mov		rdi, message
	mov		sil, [bAns3]
	sub		rsp, 8
	call	printf
	add		rsp, 8
answer4:
	xor		rax, rax
	xor		rsi, rsi
	mov		al, byte [bNum1]
	sub		al, byte [bNum2]
	mov		byte [bAns6], al
	xor		rax, rax
	mov		rdi, message
	mov		sil, [bAns6]
	sub		rsp, 8
	call	printf
	add		rsp, 8
answer5:
	xor		rax, rax
	xor		rsi, rsi
	mov		al, byte [bNum1]
	sub		al, byte [bNum3]
	mov		byte [bAns7], al
	xor		rax, rax
	mov		rdi, message
	mov		sil, [bAns7]
	sub		rsp, 8
	call	printf
	add		rsp, 8
answer6:
	xor		rax, rax
	xor		rsi, rsi
	mov		al, byte [bNum2]
	sub		al, byte [bNum4]
	mov		byte [bAns8], al
	xor		rax, rax
	mov		rdi, message
	mov		sil, [bAns8]
	sub		rsp, 8
	call	printf
	add		rsp, 8
answer7:
	xor		rax, rax
	xor		rsi, rsi
	xor		rdx, rdx
	mov		al, byte [bNum1]
	mul		byte [bNum2]
	mov		word [wAns11], ax
	xor		rax, rax
	mov		rdi, message
	mov		si, [wAns11]
	sub		rsp, 8
	call	printf
	add		rsp, 8
answer8:
	xor		rax, rax
	xor		rsi, rsi
	xor		rdx, rdx
	mov		al, byte [bNum2]
	mul		byte [bNum2]
	mov		word [wAns12], ax
	xor		rax, rax
	mov		rdi, message
	mov		si, [wAns12]
	sub		rsp, 8
	call	printf
	add		rsp, 8
answer9:
	xor		rax, rax
	xor		rsi, rsi
	xor		rdx, rdx
	mov		al, byte [bNum2]
	mul		byte [bNum4]
	mov		word [wAns13], ax
	xor		rax, rax
	mov		rdi, message
	mov		si, [wAns13]
	sub		rsp, 8
	call	printf
	add		rsp, 8
answer10:
	xor		rax, rax
	xor		rsi, rsi
	xor		rdx, rdx
	mov		al, byte [bNum1]
	div		byte [bNum2]
	mov		byte [bAns16], al
	xor		rax, rax
	mov		rdi, message
	mov		sil, [bAns16]
	sub		rsp, 8
	call	printf
	add		rsp, 8
answer11:
	xor		rax, rax
	xor		rsi, rsi
	xor		rdx, rdx
	mov		al, byte [bNum3]
	div		byte [bNum4]
	mov		byte [bAns17], al
	xor		rax, rax
	mov		rdi, message
	mov		sil, [bAns17]
	sub		rsp, 8
	call	printf
	add		rsp, 8
answer12:
	xor		rax, rax
	xor		rsi, rsi
	xor		rdx, rdx

	mov		ax, word [wNum1]
	movzx	bx,	byte [bNum4]
	div		bx
	mov		byte [bAns18], al
	;mov		byte [bAns18], al
	xor		rax, rax
	mov		rdi, message
	mov		sil, byte [bAns18]
	push	dx
	sub		rsp, 6
	call	printf
	add		rsp, 6
	pop		dx
answer13:
	xor		rax, rax
	xor		rsi, rsi
	mov		rdi, message
	mov		sil, dl
	sub		rsp, 8
	call	printf
	add		rsp, 8
	ret
