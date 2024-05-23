global ft_strdup
extern __errno_location
extern ft_strlen
extern ft_strcpy
extern malloc



ft_strdup:
    xor rax, rax
    call ft_strlen
    push rdi
    inc rax
    mov rdi, rax 
    call malloc wrt ..plt
    cmp rax, 0
    je finnish
    pop rdi
    mov rsi, rdi
    mov rdi, rax  ; l'address de malloc est return dans rdi  
    call ft_strcpy
    ret

finnish:
    ret
