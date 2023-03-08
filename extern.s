.set noreorder
.section .text

.global sys_print

sys_print:
    sub $sp, $sp, 4
    sw $v0, 0($sp)
    li $v0, 4004
    syscall
    lw $v0, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    nop
