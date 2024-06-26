; 	global	ft_strcpy

; 	section	.text
; 	; pass byte of sting inside another, can overlap
; ft_strcpy:
; 	push	rbx						; calle saved
; 	xor		rbx, rbx				; rbx = 0
; 	xor		rax, rax				; rax = 0
; 	cmp		byte [rsi], 0			; (rsi[x] - 0)
; 	je		end						; (rsi[s] == 0) ? end : continue
; next:
; 	mov		bl, byte [rsi + rax]	; bl = rsi[x]
; 	mov		byte [rdi + rax], bl	; rdi[x] = bl
; 	inc		rax						; rax += 1
; 	cmp		byte [rsi + rax], 0		; (rsi[x] - 0)
; 	jne		next					; (rsi[x] != 0) ? next : continue
; 	mov		byte [rdi + rax], 0		; rdi[end] = '\0'
; end:
; 	mov	rax, rdi					; address : rax = rdi
; 	pop	rbx							; replace value initial of rbx
; 	ret								; end of the function

global ft_strcpy

section .text

ft_strcpy: ; rdi dest ; rsi dest2
    xor rax, rax
    cmp rdi, 0
    push rdx
    
    mov rdx, 0
    loop:
        cmp al, byte[rsi + rdx]
        je  end
        mov al, byte[rsi + rdx]
        mov byte[rdi + rdx] , al
        xor rax, rax
        inc rdx
        jmp loop
    end:
        mov byte[rdi + rdx], 0
        pop rdx
        mov rax, rdi
        ret