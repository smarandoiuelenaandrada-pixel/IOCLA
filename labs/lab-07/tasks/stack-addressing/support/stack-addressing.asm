%include "printf64.asm"

%define NUM 5

section .text

extern printf
global main
main:
    sub rsp, 8
    mov [rsp], rbp
    mov rbp, rsp
   
    mov rcx, NUM
push_nums:
    sub rsp, 8
    mov [rsp], rcx
    loop push_nums

    sub rsp, 8
    mov qword [rsp], 0
    
    mov rax, "handsome"
    sub rsp, 8
    mov [rsp], rax

    mov rax, "is very "
    sub rsp, 8
    mov [rsp], rax

    mov rax, "Anthony "
    sub rsp, 8
    mov [rsp], rax

    lea rsi, [rsp]
    PRINTF64 `%s\n\x0`, rsi

    mov rbx, rbp
loop:
    mov rcx, [rbx]
    PRINTF64 `%p: 0x%x\n\x0`, rbx, rcx
    cmp rbx, rsp            
    je done_loop            
    sub rbx, 8              
    jmp loop

done_loop:
    lea rsi, [rsp]
    PRINTF64 `%s\n\x0`, rsi

    mov rbx, rbp
    sub rbx, 8 * NUM
    mov rdx, NUM
loop3:
    mov rcx, qword [rbx]
    PRINTF64 `%d \x0`, rcx
    add rbx, 8
    dec rdx
    jnz loop3
    PRINTF64 `\n\x0`
    
    mov rsp, rbp
    xor rax, rax
    leave
    ret
