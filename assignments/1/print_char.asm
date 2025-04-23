global _start
global print_char

section .text

print_char:
    push rdi
    mov rsi, rsp
    pop rdi
    mov rax, 1 ; write syscall
    mov rdi, 1 ; to stdout 
    mov rdx, 1 ; length of str
    syscall
    ret

; _start:
;     mov rdi, 0x61 ; should be 'a'
;     call print_char
; 
;     ; exit
;     mov rax, 60
;     xor rdi, rdi
;     syscall


