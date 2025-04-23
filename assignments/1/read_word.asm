global _start
extern read_char
extern print_uint
extern print_newline

section .data
    word_buffer dq 0 ; 8 bytes

section .text

read_word:
    ; TODO: fill this out
    ret

_start:
    ; rdi = buffer address
    ; rsi = size

    mov rdi, word_buffer
    mov rsi, 8
    call read_word

    call print_newline

    mov rdi, rax
    call print_uint

    call print_newline

    mov rax, 60
    xor rdi, rdi
    syscall
