global _start

section .text
_start:
    mov rdi, 1 ; 1=exit code
    mov rax, 60 ; 60=exit
    syscall
