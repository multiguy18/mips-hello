
.set noreorder
.section .text

.global __start

__start:
    li $v0, 4004
    li $a0, 1
    la $a1, testmsg
    li $a2, 41
    syscall

    jal testfun
    nop

    li $v0, 4004
    li $a0, 1
    la $a1, newline
    li $a2, 1
    syscall

    la $a0, mynumber
    jal atoi
    nop

    move $a0, $v0
    
    la $a1, mybuf
    jal itoa
    nop

    li $v0, 4004
    li $a0, 1
    la $a1, mybuf
    li $a2, 11
    syscall

    li $v0, 4004
    li $a0, 1
    la $a1, newline
    li $a2, 1
    syscall

    li $v0, 4004
    li $a0, 1
    la $a1, prompt
    li $a2, 24
    syscall

    li $v0, 4003
    li $a0, 0
    la $a1, input
    li $a2, 30
    syscall

    li $v0, 4004
    li $a0, 1
    la $a1, response
    li $a2, 15
    syscall

    li $v0, 4004
    li $a0, 1
    la $a1, input
    li $a2, 80
    syscall


    li $v0, 4001
    li $a0, 0
    syscall

.section .data


testmsg: .asciiz "Testing assembler calls to c and back...\n"
newline: .asciiz "\n"
prompt: .asciiz "Please enter your name: "
response: .asciiz "\nYour name is: "
mynumber: .asciiz "933"
mybuf: .space 12
input: .space 81
