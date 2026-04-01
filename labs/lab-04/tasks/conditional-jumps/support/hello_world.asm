; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    myString: db "Hello, World!", 0
    N: dq 6                         ; N = 6

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    mov rcx, QWORD [N]              ; rcx will store the value of N
    PRINTF64 `%d\n\x0`, rcx         ; DO NOT REMOVE/MODIFY THIS LINE

    mov rax, 2
    mov r8, 1
    cmp rax, r8
    ja print                        ; TODO1: rax > r8?
    xor rax, rax
   
    leave
    ret

print:
                      
    xor rcx, rcx

    start:
        PRINTF64 `Hello, World!\n\0x`
        INC rcx                    
        CMP rcx, [N]
        jnz start

    xor rax, rax
    PRINTF64 `Goodbye, World!\0x`
    leave
    ret
