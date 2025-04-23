; global _start
global str_len

; section .data
;     test_str_1: db "hello world", 0

section .text

str_len:
    xor rax, rax ; initialize counter to 0
.loop:
    cmp byte [rdi+rax], 0
    je .end
    inc rax
    jmp .loop

.end:
    ret

; _start:
;     mov rdi, test_str_1
;     call str_len
;     mov rdi, rax
;     mov rax, 60
;     syscall


