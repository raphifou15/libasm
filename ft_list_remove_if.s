global ft_list_remove_if

extern free
ft_list_remove_if: ;rdi **list ; rsi *data_ref; rdx *cmp(); rcx *free_fct
    xor rax, rax
    cmp rdi, 0
    je param_null
    cmp rsi, 0
    je param_null
    cmp rdx, 0
    je param_null
    cmp rcx, 0
    je param_null
    push rbx ; c'est rbx qui va ponter sur t_list
    push r8
    push r10
    push r11

    mov r10, 0
    mov r8, rsi
    mov rbx, [rdi]
    mov r11, rdi

    loop_list_remove:
        cmp rbx , 0
        je end_list_remove

        push r9 ; sert a stocker cmp 
        mov r9, rdx

        push rdi
        push rsi
        push rdx
        push rcx

        mov rsi , r8
        mov rdi , [rbx]

        push rbx
        push r8
        push r10
        push r11

        call r9

        pop r11
        pop r10
        
        pop r8
        pop rbx

        pop rcx
        pop rdx
        pop rsi
        pop rdi

        pop r9

        

        cmp rax, 0
        jne no_free


        ;;;; free data ici
        push r9
        mov r9, rcx

        push rdi
        push rsi
        push rdx
        push rcx

        mov rdi , [rbx]

        push r11
        push r10
        push r8 
        push rbx

        call rcx


        pop rbx
        pop r8
        pop r10 
        pop r11

        pop rcx
        pop rdx
        pop rsi
        pop rdi
        pop r9

        ;;;; free noeu ici 


        push rdi
        push rsi
        push rdx
        push rcx

        mov rdi , rbx
        add rbx, 8
        mov rbx, [rbx]

        push r11
        push r10
        push r8 
        push rbx

        call free wrt ..plt

        pop rbx
        pop r8
        pop r10 
        pop r11

        pop rcx
        pop rdx
        pop rsi
        pop rdi

        cmp r10 , 0
        je switch_first_chain
        add r11, 8
        mov [r11], rbx
        sub r11, 8
        jmp loop_list_remove
        switch_first_chain:
            mov [r11], rbx
            jmp loop_list_remove
    no_free:
        add r10, 1
        mov r11, rbx
        add rbx, 8
        mov rbx, [rbx]
        jmp loop_list_remove
    end_list_remove:
        
        mov rax, r10
        pop r11
        pop r10
        pop r8 
        pop rbx
        ret
    
param_null:
    ret

; envoyer a free un pointer sur quoi free 

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