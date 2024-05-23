
global ft_create_elem
extern malloc
ft_create_elem: ;rdi void(data) pointeur sur la data.
    xor rax, rax
    cmp rdi, 0
    je param_null
    push rsi
    push rdi
    mov rdi, 16
    call malloc wrt ..plt
    cmp rax, 0
    je finnish
    mov rsi, rax
    pop rdi,
    mov qword [rsi], rdi
    add rsi, 8
    mov qword [rsi], 0
    sub rsi, 8
    mov rax, rsi
    pop rsi
    ret
finnish:
    pop rdi
    pop rsi
    ret

param_null:
    ret

; Declaration
; db 8-bit variable(s)
; dw 16-bit variable(s)
; dd 32-bit variable(s)
; dq 64-bit variable(s)
; ddq 128-bit variable(s) → integer
; dt 128-bit variable(s) → float

;les 6 premiers arguments sont passer dans RDI RSI RDX RCX R8 R9 puis la pile
;RSP est le registre qui pointe sur la pile


; rax eax ax al
; rbx ebx bx bl
; rcx ecx cx cl
; rdx edx dx dl
; rsi esi si sil
; rdi edi di dil
; rbp ebp bp bpl
; rsp esp sp spl
; r8 r8d r8w r8b
; r9 r9d r9w r9b
; r10 r10d r10w r10b
; r11 r11d r11w r11b
; r12 r12d r12w r12b
; r13 r13d r13w r13b
; r14 r14d r14w r14b
; r15 r15d r15w r15b

; je <label> ; if <op1> == <op2>
; jne <label> ; if <op1> != <op2>
; jl <label> ; signed, if <op1> < <op2>
; jle <label> ; signed, if <op1> <= <op2>
; jg <label> ; signed, if <op1> > <op2>
; jge <label> ; signed; if <op1> >= <op2>
; jb <label> ; unsigned, if <op1> < <op2>
; jbe <label> ; unsigned, if <op1> <= <op2>
; ja <label> ; unsigned, if <op1> > <op2>
; jae <label> ; unsigned, if <op1> >= <op2>

;jmp aller vers une fonction