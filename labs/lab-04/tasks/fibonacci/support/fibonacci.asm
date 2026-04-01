; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    N: dq 7          ; N-th fibonacci number to calculate

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    mov rcx, QWORD [N]       ; we want to find the N-th fibonacci number; N = RCX = 7
    PRINTF64 `%d\n\x0`, rcx  ; DO NOT REMOVE/MODIFY THIS LINE

    ; TODO: calculate the N-th fibonacci number (f(0) = 0, f(1) = 1)

    xor rbx, rbx
    xor rcx, rcx ; set to 0
    xor rax, rax ; set to 1 fibonacci number = 0
    mov rdx, 1 ; set to 2 fibonacci number = 1

    cmp QWORD [N], 0
    add RCX, 1
    jnz cont
    add rbx, rax
    jz print

cont:
    cmp QWORD [N], 2
    add RCX, 1
    jnz repet
    add rbx, rax
    add rbx, rdx
    jz print 

repet:
    xor rbx, rbx
    add rbx, rax
    add rbx, rdx
    mov rax, rdx
    mov rdx, rbx
    add RCX, 1
    cmp RCX, [N]
    jbe repet

print:
    PRINTF64 `%d\n\x0`, rbx

    leave
    ret
