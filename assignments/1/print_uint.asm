; global _start
global print_uint
extern print_char

section .text

print_uint:
    mov rax, rdi
    push 10
.div_loop:
    ; combine 64-bit rax and rdx to make 128-bit rdx:rax
    ; we don't need the extra 64 bits, so we zero them out
    xor rdx, rdx
    ; lower 8 bytes are already in rax (see above .loop)
    mov rcx, 10
    div rcx ; quotient -> rax, remainder (%) -> rdx
    ; push remainder onto stack:
    push rdx
    cmp rax, 0 ; check if quotient is 0
    je .pop_print_loop ; if so, jump to end
    jmp .div_loop ; otherwise, continue looping
.pop_print_loop:
    ; 1) pop num off stack
    pop rax
    cmp rax, 10
    je .end
    mov rdi, rax
    add rdi, 0x30
    ; 2) print it
    call print_char
    jmp .pop_print_loop
.end:
    ret

_start:
    mov rdi, 12345
    call print_uint

    mov rax, 60
    xor rdi, rdi
    syscall
