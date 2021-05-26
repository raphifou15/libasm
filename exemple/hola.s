	global	main
	extern	puts

	section	.data
	hola	db	"hola", 0

	section	.text

main:
	mov	rdi, hola
	call puts
	ret
