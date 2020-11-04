bits 32

section .multiboot      ;according to multiboot spec
        dd 0x1BADB002   ;setting magic number for bootloader

        dd 0x0          ;setting flags
        dd - (0x1BADB002 + 0x0)  ;set checksum

section .text
global start
extern main             ;defined in C file

start:
        cli                  ;block interrupts
        mov esp, stack_space ;set stack pointer
        call main
        hlt                  ;halts cpu

section .bss
resb 8192       ;8kb for stack
stack_space: