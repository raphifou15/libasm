global ft_read
extern __errno_location
ft_read:
    mov rax, 0
    syscall
    cmp rax , 0
    jg finnish
    neg rax
    push rax
    mov rdi, 0
    call __errno_location wrt ..plt
    mov rdi, rax
    pop rax
    mov [rdi], rax
    mov eax , -1
finnish:
    ret
