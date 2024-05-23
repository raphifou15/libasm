global ft_atoi_base
extern ft_strlen
ft_atoi_base:
    xor rax, rax
    cmp rdi, 0
    je param_null
    cmp rsi, 0
    je param_null
    push rdi
    mov rdi, rsi
    call ft_strlen
    cmp rax, 1
    jbe end_error
    mov rbx, rax    ; size de base
    call checkDuplicateChar
    cmp rax, 0
    je end_error
    call validateSignsAndSpaces
    cmp rax, 0
    je end_error
    pop rdi
    push rdx
    mov rdx, rbx
    call atoi_base_without_error
    pop rdx
    ret

param_null:
    ret;

end_error:
    pop rdi
    mov rax , 0
    ret


; global checkDuplicateChar
checkDuplicateChar:
    push rdx
    push rbx
    mov rdx, 1      ; pour faire la double boucle
    mov rbx, 0      ; pour faire la double boucle
    xor rax, rax

    mov al, byte[rdi + rbx]
    jmp loop

before_loop_rbx:
    inc rbx,
    mov al, byte[rdi + rbx]
    mov rdx, rbx
    inc rdx
    jmp loop
before_loop_rdx:
    inc rdx
loop:
    cmp al , 0
    je end2
    cmp byte[rdi + rdx], 0
    je before_loop_rbx
    cmp al, byte[rdi + rdx]
    jne before_loop_rdx
    pop rbx
    pop rdx
    mov rax, 0
    ret

end2:
    pop rbx
    pop rdx
    mov rax, 1
    ret


global validateSignsAndSpaces

validateSignsAndSpaces:
    push rdx
    xor rax, rax
    mov rdx, 0
loop_validateSignsAndSpaces:
    cmp byte[rdi + rdx] , 0
    je end_validateSignsAndSpaces
    cmp byte[rdi + rdx] , 43  ; comparaison +
    je error_validateSignsAndSpaces
    cmp byte[rdi + rdx] , 45  ; comparaison -
    je error_validateSignsAndSpaces
    cmp byte[rdi + rdx] , 9  ; comparaison tabulation horizontale
    je error_validateSignsAndSpaces
    cmp byte[rdi + rdx] , 10  ; comparaison retour a la ligne
    je error_validateSignsAndSpaces
    cmp byte[rdi + rdx] , 11  ; comparaison tabulation verticale
    je error_validateSignsAndSpaces
    cmp byte[rdi + rdx] , 12  ; comparaison tabulation verticale
    je error_validateSignsAndSpaces
    cmp byte[rdi + rdx] , 13  ; comparaison form feed
    je error_validateSignsAndSpaces
    cmp byte[rdi + rdx] , 32  ; espace
    je error_validateSignsAndSpaces
    inc rdx
    jmp loop_validateSignsAndSpaces

end_validateSignsAndSpaces:
    pop rdx
    mov rax, 1
    ret;
error_validateSignsAndSpaces:
    pop rdx
    mov rax, 0
    ret;


atoi_base_without_error: ; rdi str rsi base rdx size
    xor rax, rax
    push rbx
    push r8
    mov r8, rdx
    push rdx
    mov rbx , 0 ; sign
    mov rdx, 0  ; inc
    jmp loop_whitespace
    loop_whitespace_inc:
        inc rdx
    loop_whitespace:
        cmp byte[rdi + rdx], 9
        jl loop_sign
        cmp byte[rdi + rdx], 13
        jle loop_whitespace_inc
        cmp byte[rdi + rdx], 32
        je loop_whitespace_inc
        jmp loop_sign
    loop_sign_inc_plus:
        mov rbx, 1
        inc rdx
        jmp loop_sign
    loop_sign_inc_minus:
        mov rbx, -1
        inc rdx
    loop_sign:
        cmp byte[rdi + rdx] , 43 ; comparaison +
        je loop_sign_inc_plus
        cmp byte[rdi + rdx] , 45 ; comparaison -
        je loop_sign_inc_minus

    push rcx

    mov rcx, 0 ;stock la data
    jmp loop_atoi
    increment_atoi:
        inc rdx
    loop_atoi:
        cmp byte[rdi + rdx], 0
        je verif_sign
        
       

        mov al, byte[rdi + rdx]
        push rdi
        mov rdi, rax
        call index_base
        pop rdi
        cmp rax, -1
        je verif_sign

        push rax
        push rdx
        mov rax, r8
        mul rcx,
        pop rdx 
        mov rcx, rax
        pop rax

        add rcx, rax
        jmp increment_atoi

    verif_sign:
        cmp rbx, -1
        jne end_atoi_base
        neg rcx
    end_atoi_base:
        mov rax, rcx 
        pop rcx
        pop rdx
        pop r8
        pop rbx
        ret



index_base:
    push rdx

    mov rdx, 0
    jmp loop_index_base
    increment_index_base:
        inc rdx
    loop_index_base:
        cmp byte [rsi + rdx], 0
        je error_index_base
        cmp dil, byte [rsi + rdx]
        jne increment_index_base
    mov rax, rdx
    pop rdx
    ret
    error_index_base:
    mov rax, -1;
    pop rdx
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

