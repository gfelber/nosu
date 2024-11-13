.intel_syntax noprefix
.section .text
.globl _start

#include <sys/syscall.h>

_start:
    # get number of arguments
    pop rbx # argc
    cmp rbx, 2
    jge  MAIN
    mov rdi, 2      # status code 2
    jmp EXIT
    

MAIN: 
    # setuid to root
    mov rax, SYS_setuid # SETUID SYSCALL
    xor rdi, rdi        # ROOT UID
    syscall
    mov rdi, 3          # exit code
    cmp rax, 0
    jl EXIT

    pop rax             # remove the binary name
    # Execute the specified binary using execve
    mov rax, SYS_execve  # EXECVE SYSCALL
    lea rsi, [rsp]
    pop rdi
    lea rdx, qword [rsp + 8*rbx - 0x10]  # envs
    syscall

    mov rdi, 1      # status code 1

EXIT:
    # Exit
    mov rax, 60       # EXIT SYSCALL
    syscall

