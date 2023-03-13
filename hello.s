
.set noreorder
.section .text

.global __start

__start:
    
    li $v0, 4004
    li $a0, 1
    la $a1, prompt
    li $a2, 23
    syscall

    li $v0, 4003
    li $a0, 0
    la $a1, input
    li $a2, 4
    syscall

    la $a0, input
    jal atoi
    nop

    add $a0, $v0, 12
    la $a1, output
    jal itoa
    nop

    li $v0, 4004
    li $a0, 1
    la $a1, response
    li $a2, 26
    syscall

    li $v0, 4004
    li $a0, 1
    la $a1, output
    li $a2, 4
    syscall

    li $v0, 4004
    li $a0, 1
    la $a1, newline
    li $a2, 1
    syscall

    li $v0, 4001
    li $a0, 0
    syscall

.section .data

prompt: .asciiz "Please enter your age: "
response: .asciiz "\nYour age in 12 years is: "
newline: .asciiz "\n"
output: .space 4
input: .space 4
