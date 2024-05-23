global ft_list_sort ;t_list **begin_list, int (*cmp)()
ft_list_sort:
    xor rax, rax
    cmp rdi , 0
    je error_list_sort_begin
    cmp qword[rdi], 0
    je error_list_sort_begin
    cmp rsi , 0
    je error_list_sort_begin
    push rbx
    push rdx

start_before_loop:
    mov rbx, [rdi]
    cmp rbx, 0
    je error_list_loop
loop_list_sort:
    mov rdx, rbx
    add rdx, 8
    mov rdx, [rdx]
    
    cmp rdx, 0
    je error_list_loop2

    ;; appel de la fonction, sauvegarde des donner; 
    push rcx
    mov rcx, rsi

    push rdi
    push rsi

    mov rdi, [rbx]
    mov rsi, [rdx]

    push rbx
    push rdx

    call rcx

    jg switch_data 

    pop rdx
    pop rbx

    pop rsi
    pop rdi
    pop rcx

    add rbx, 8
    mov rbx, [rbx]
    jmp loop_list_sort

    pop rdx
    pop rbx
    mov rax, 1
    ret
    
switch_data:
    pop rdx
    pop rbx

    pop rsi
    pop rdi
    pop rcx

    push rdi
    push rsi
    mov rdi, [rbx]
    mov rsi, [rdx]
    mov [rdx], rdi
    mov [rbx], rsi
    pop rsi
    pop rdi
    jmp start_before_loop
    

error_list_sort_begin:
    ret

error_list_loop:
    pop rdx
    pop rbx
    ret

error_list_loop2:
    pop rdx
    pop rbx
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