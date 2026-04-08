; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    num dq 100000

section .text
extern printf
global main
main:
    push rbp
    mov rbp, rsp

    mov rcx, [num]     ; Use rcx as counter for computing the sum.
    xor rax, rax       ; Use rax to store the sum. Start from 0.
    xor rdx, rdx
    xor rbx, rbx

sum_squared:
    mov rax, rcx
    mul rcx

    add rbx, rax
    loop sum_squared

    mov rcx, [num]
    PRINTF64 `Sum n squares(%lu): %lu\n\x0`, rcx, rbx

    leave
    ret
