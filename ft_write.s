
global ft_write
extern __errno_location


ft_write:
    mov rax, 1
    syscall
    cmp eax , 0
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
