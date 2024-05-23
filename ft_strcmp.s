global ft_strcmp

section .text

ft_strcmp: ; rdi s1, rsi r2
    push rdx
    push rbx
    mov rdx, 0
    xor rax, rax
    jmp loop
increment:
    inc rdx
loop:
    xor rax, rax
    cmp al , byte[rdi + rdx]
    je end
    cmp al , byte[rsi + rdx]
    je end
    movzx eax, byte[rdi + rdx]
    cmp al,  byte[rsi + rdx]
    jne end
    jmp increment
end:
    xor rbx, rbx
    movzx eax, byte[rdi + rdx]
    movzx ebx, byte[rsi + rdx]
    sub eax, ebx
    pop rbx
    pop  rdx
    ret