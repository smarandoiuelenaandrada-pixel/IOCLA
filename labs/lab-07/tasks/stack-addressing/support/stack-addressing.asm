%include "printf64.asm"

%define NUM 5

section .text

extern printf
global main
main:
    push rbp
    mov rbp, rsp
   
    ; TODO 1: replace every "push" instruction by an equivalent sequence of commands (use direct addressing of memory. Hint: rsp)
    mov rcx, NUM
push_nums:
    ;push rcx
    sub rsp, 8
    mov [rsp], rcx

    loop push_nums

    ;push 0
    sub rsp, 8
    mov qword [rsp], 0
    
    mov rax, "handsome"
    ;push rax
    sub rsp, 8
    mov [rsp], rax

    mov rax, "is very "
  ;  push rax
    sub rsp, 8
    mov [rsp], rax

    mov rax, "Anthony "
   ; push rax
    sub rsp, 8
    mov [rsp], rax

    lea rsi, [rsp]
    PRINTF64 `%s\n\x0`, rsi

    ; TODO 2: print the stack in "address: value" format in the range of [RSP:RBP]
    ; use PRINTF64 macro - see format above
    xor rcx, rcx
    mov rbx, rbp
loop:
    mov rcx, [rbx]
    PRINTF64 `%p: 0x%x\n\x0`, rbx, rcx
    cmp rbx, rsp            
    je done_loop            
    sub rbx, 8              
    jmp loop
    ; TODO 3: print the string
    
  
  ;  mov rbx, rsp 
   
;loop2:
 ;   xor rcx, rcx
  ;  mov cl, byte [rbx]
   ; cmp cl, 0
   ; je done_string
   ; PRINTF64 `%p: %c\n\x0`, rbx, rcx
   ; inc rbx
   ; jmp loop2

done_loop:

    lea rsi, [rsp]
    PRINTF64 `%s\n\x0`, rsi
    ; TODO 4: print the array on the stack, element by element.

    ; restore the previous value of the rbp (Base Pointer)
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
