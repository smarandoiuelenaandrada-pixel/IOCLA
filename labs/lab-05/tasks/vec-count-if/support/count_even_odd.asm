; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

%define ARRAY_SIZE    10

section .data
    qword_array dq 1392, 12544, 7991, 6992, 7202, 27187, 28789, 17897, 12988, 17992

section .text
extern printf
global main
main:

    xor rax, rax
    xor rbx, rbx
    xor r8, r8
    xor r9, r9
    mov rcx, ARRAY_SIZE

iterrate_array:
    
    xor rdx, rdx
    mov rax, [qword_array + rcx * 8 - 8]
    mov rbx, 2
    div rbx

    cmp edx, 0
    je num_of_even 

    inc r9
    jmp next

num_of_even:
    inc r8

next:
    loop iterrate_array

done:
    PRINTF64 `%lu %lu\n\x0`, r8, r9

    xor rax, rax
    ret
