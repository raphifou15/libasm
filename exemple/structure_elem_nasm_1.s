
	global		_start	; déclaration de _start en global
						; => export du point d'entrée pour créer le programme
	segment		.data
		; création de variables initialisées
	segment		.bss
		; création de variables non-initialisées
	segment		.text
		; création de vos procédures/fonctions entre le segment et le point d'entrée
	_start:
		; instructions de votre programme
		; Les 3 lignes suivantes doivent être à la fin du programme
		mov eax, 1	; signalement de fin du programme
		mov ebx, 0	; code de sortie du programme
		int 0x80	; interruption Linux : votre programme rend la main au système

