	global	ft_strlen

	section	.text

ft_strlen:
	xor	rax, rax			; met rax a 0 c'est la valeur que renvoie une fonction par défaut
next:
	mov sil, byte [rdi]		; je met 1 byte de rdi dans sil qui est le registre 1 byte de rsi
	cmp sil, 0				; je compare le byte de syl et 0
	je	end					; si sil == 0 jump sur end
	inc	rdi					; j'incrément de 1 donc de 8 bite rdi ou 1 byte pour aller au byte suivant
	inc	rax					; j'incrément la valeur de retour rax
	jmp	next				; boucle sur lui même pour aller a next
end:
	ret						; quand on utilise un .c en complément d'asm on finnnit par ret le programme
