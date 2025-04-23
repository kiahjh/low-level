global _start
extern str_len

section .data
    test_str_1: db "hello world", 10, 0

section .text

print_str:
    call str_len
    mov rdx, rax
    mov rax, 1
    mov rsi, rdi
    mov rdi, 1
    syscall
    ret

_start:
    mov rdi, test_str_1
    call print_str

    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall


