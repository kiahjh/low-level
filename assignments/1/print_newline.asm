global _start
extern str_len

section .text

print_newline:
    push 0xa
    mov rsi, rsp
    pop rdi
    mov rax, 1 ; write syscall
    mov rdi, 1 ; to stdout 
    mov rdx, 1 ; length of str
    syscall
    ret

_start:
    call print_newline

    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall


