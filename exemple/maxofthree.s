	global	maxofthree
	section	.text

maxofthree:
	mov		eax, edi
	cmp		eax, esi	; condition ?
	cmovl	eax, esi	; si esi > eax vrai eax = esi, si esi > eax faux eax = eax
	cmp		eax, edx
	cmovl	eax, edx	;
	ret
