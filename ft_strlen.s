global ft_strlen
section .text
ft_strlen:
    xor rax, rax
    push rdx
    mov rdx, 0
loop:
    cmp al, byte [rdi + rdx]
    je end
    inc rdx
    jmp loop
end:
    mov rax, rdx
    pop rdx
    ret
