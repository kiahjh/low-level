global _start
extern print_char
extern print_uint

section .text

print_int:
    ; have a number in rdi
    test rdi, rdi
    js is_negative
    jmp is_positive_or_zero
is_negative:
    push rdi
    mov rdi, 0x2d ; '-'
    call print_char
    pop rdi
    neg rdi
    call print_uint
    ret
is_positive_or_zero:
    push rdi
    mov rdi, 0x2b ; '+'
    call print_char
    pop rdi
    call print_uint
    ret

_start:
    mov rcx, 0b10010011 ; -109
    movsx rdi, cl
    call print_int
    mov rdi, 0b00000111 ; +7
    call print_int

    mov rax, 60
    xor rdi, rdi
    syscall
