; global _start
extern print_char

section .data
    buffer db 0

section .text

read_char:
    mov rax, 0 ; read
    mov rdi, 0 ; stdin
    mov rsi, buffer ; where to stick the value
    mov rdx, 1 ; how many bytes to read
    syscall
    ; move value in `buffer` to `rax`
    mov rax, [buffer]
    ret

; _start:
;     call read_char
;     mov rdi, rax
;     call print_char
; 
;     mov rax, 60
;     xor rdi, rdi
    syscall
