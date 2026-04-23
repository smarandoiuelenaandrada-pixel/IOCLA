; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

struc my_struct
    int_x: resb 4
    char_y: resb 1
    string_s: resb 32
endstruc

section .data
    sample_obj:
        istruc my_struct
            at int_x, dd 1000
            at char_y, db 'a'
            at string_s, db 'My string is better than yours', 0
        iend

    new_int dd 2000
    new_char db 'b'
    new_string db 'Are you sure?', 0

section .text
extern printf
global main

main:
    push rbp
    mov rbp, rsp

    ; Print all three values (int_x, char_y, string_s) from sample_obj.
    ; Hint: use "lea reg, [base + offset]" to save the result of
    ; "base + offset" into register "reg".
    
    PRINTF64 `int_x: %d\n\0x`, qword [sample_obj + int_x]
    PRINTF64 `char_y: %c\n\0x`, qword [sample_obj + char_y]

    lea rax, [sample_obj + string_s]
    PRINTF64 `string_s: %s\n\0x`, rax

    ; TODO: write the equivalent of "sample_obj->int_x = new_int".

    mov rax, [new_int]
    mov [sample_obj + int_x], rax

    ; TODO: write the equivalent of "sample_obj->char_y = new_char".

    mov rax, [new_char]
    mov [sample_obj + char_y], rax
    
    ; TODO: write the equivalent of "strcpy(sample_obj->string_s, new_string)".

    xor rax, rax
    xor rcx, rcx

strcpy:
    mov rax, [new_string + rcx]
    mov [sample_obj + string_s + rcx], rax
    inc rcx
    cmp rax, 0
    jnz strcpy

    ; TODO: print all three values again to validate the results of the
    ; three set operations above.

    PRINTF64 `int_x: %d\n\0x`, qword [sample_obj + int_x]
    PRINTF64 `char_y: %c\n\0x`, qword [sample_obj + char_y]

    lea rax, [sample_obj + string_s]
    PRINTF64 `string_s: %s\n\0x`, rax

    xor rax, rax
    leave
    ret
