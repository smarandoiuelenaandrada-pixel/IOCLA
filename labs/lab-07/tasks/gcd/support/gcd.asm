%include "printf64.asm"

section .text

extern printf
global main
main:
    push rbp
    mov rbp, rsp

    sub rsp, 8  ;; Necessary for stack alignment

    ; input values (rax, rdx): the 2 numbers to compute the gcd for
    mov rax, 49
    mov rdx, 28

    mov r8, rax
    mov r9, rdx
    
gcd:
    cmp rax, rdx
    je gcd_end

    ja subtract_values
    sub rdx, rax
    jmp gcd

subtract_values:
    sub rax, rdx
    jmp gcd
    
gcd_end:
    ;add rax, rdx
    
    ;inc rax

    ; TODO 1: solve the 'Segmentation fault!' error

    ; TODO 2: print the result in the form of: "gdc(rax, rdx)=7" with PRINTF64 macro
    ; output value in rax
    PRINTF64 `gcd(%d, %d) = %d\n\x0`, r8, r9, rax
    xor rax, rax

    add rsp, 8  ;; Necessary for stack alignment

    mov rsp, rbp
    pop rbp
    ret
