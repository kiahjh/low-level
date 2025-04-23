global _start

section .data
test_string: db "abcdef", 0

section .text

strlen:
    xor rax, rax

.loop:
    cmp byte [rdi+rax], 0
    je .end ; if ^  and ^ are equal, skip to .end
    inc rax
    jmp .loop

.end:
    ret

_start:
    mov rdi, test_string
    call strlen
    ; strlen(rdi: test_string)
    mov rdi, rax ; mov rax to rdi to make it the exit code
    mov rax, 60 ; syscall code for exit
    syscall ; exit with rdi as exit code (which is the length of the string)
