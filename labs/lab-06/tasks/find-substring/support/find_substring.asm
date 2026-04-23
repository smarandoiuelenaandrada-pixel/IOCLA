; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE STRING IN QUOTES
substring: db "BABC", 0 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE STRING IN QUOTES

print_format: db "Substring found at index: %d", 10, 0

section .text
extern printf
global main
main:
    push rbp
    mov rbp, rsp

    ; TODO: Print the start indices for all occurrences of the substring in source_text
    xor rcx, rcx
    xor rax, rax
    xor rbx, rbx
    xor rdx, rdx
    xor r8, r8
    xor r9, r9
sub:
    mov al, [source_text + rcx]
    cmp al, 0
    je re

    mov bl, [substring + rdx]
    cmp bl, 0
    je print

    cmp al, bl
    inc rcx
    jne set_zero
 ;   inc rcx
    inc r8
    inc rdx
    jmp sub
    
set_zero:
   ; inc rcx
    xor rdx, rdx
    xor r8, r8
    jmp sub

print:
    mov r9, rcx
    sub r9, rdx
    PRINTF64 `%d `, r9
    jmp set_zero
re:
    xor rax, rax
    leave
    ret
