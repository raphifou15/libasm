	global	ft_strcmp

	section	.text

ft_strcmp:
	xor		rax, rax				; je mets rax a 0
next:
	cmp		byte [rdi + rax], 0		; je compare s1 avec 0 : rdi = s1
	je		zero_zero				; si rdi == 0 je vais sur la partie zero_zero
next_2:
	mov		cl, byte [rdi + rax]	; je mets dans cl(partie 1 byte low de rcx) 1 byte de rdi
	mov		dl, byte [rsi + rax]	; je mets dans dl(partie 1 byte low de rdx) 1 byte de rsi
	inc		rax						; j'incrémente rax
	cmp		cl, dl					; je compare les daux bytes de rdi et rsi
	je		next					; si cl == dl je vais à la partie next
	jg		sup						; si cl > dl je vais sur sup
	mov		eax, -1					; je mets -1 dans eax, et je peus car eax est signé
end:
	ret								; fin de la fonction

zero_zero:
	cmp		byte [rsi + rax], 0		; je compare s2 avec 0 : rsi = s2
	je		pass_zero				; si rsi == 0 je vais a la partie pass_zero
	jmp		next_2

pass_zero:
	xor		rax, rax				; je mets rax a 0 ?pas sur de l'utilité?
	mov		eax, 0					; je mets 0 dans eax, car je renvoie un int
	jmp		end						; je vais a la partie end
sup:
	mov		eax, 1					; je mets dans eax , car je renvoie un int
	jmp		end						; je vais à la partie end
