global _start

section .data
message: db 'hello', 10

section .text

print_hello:
    mov rax, 1 ; write
    mov rdi, 1 ; stdout
    mov rsi, message
    mov rdx, 6
    syscall
    ret

loop_hellos:
    xor rcx, rcx ; initialize counter to 0
.loop:
    cmp rcx, 10
    je .end
    push rcx
    call print_hello ; rcx is corrupted right here
    pop rcx
    inc rcx
    jmp .loop

.end:
    ret

_start:
    call loop_hellos

    ; exit:
    mov rax, 60
    xor rdi, rdi
    syscall
