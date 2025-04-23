global _start

section .data
    test_str_1: db "hello world", 0

section .text

string_length:
    ; takes pointer to string in rdi
    ; loop through string until null terminator (0)

    ; rdi -> "string", 0
    xor rax, rax ; initialize counter to 0
.loop:
    cmp byte [rdi+rax], 0
    je .end
    inc rax
    jmp .loop

.end:
    ret


print_string:
    xor rax, rax
    ret

print_char:
    xor rax, rax
    ret

print_newline:
    xor rax, rax
    ret


print_uint:
    xor rax, rax
    ret


print_int:
    xor rax, rax
    ret

string_equals:
    xor rax, rax
    ret


read_char:
    xor rax, rax
    ret 

read_word:
    ret

; rdi points to a string
; returns rax: number, rdx : length
parse_uint:
    xor rax, rax
    ret

; rdi points to a string
; returns rax: number, rdx : length
parse_int:
    xor rax, rax
    ret 

string_copy:
    ret

_start:
    mov rdi, test_str_1
    call string_length
    mov rdi, rax
    mov rax, 60
    syscall


