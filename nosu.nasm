section .text
  global _start

_start:
    ; get number of arguments
    mov r12, [rsp]  ; argc
    cmp r12, 2
    jge  MAIN
    mov rdi, 2      ; status code 2
    jmp EXIT
    

MAIN: 
    ; setuid to root
    mov rax, 0x69       ; SETUID SYSCALL
    mov rdi, 0          ; ROOT UID
    syscall
    mov rdi, 3          ; exit code
    cmp rax, 0
    jl EXIT

    ; Execute the specified binary using execve
    mov rax, 0x3b                 ; EXECVE SYSCALL
    mov rdi, qword [rsp + 0x10]   ; binary to call
    lea rsi, qword [rsp + 0x10]   ; argvs
    add r12, 3                  
    lea rdx, qword [rsp + 8*r12]  ; envs
    syscall

    mov rdi, 1      ; status code 1

EXIT:
    ; Exit
    mov rax, 60       ; EXIT SYSCALL
    syscall

