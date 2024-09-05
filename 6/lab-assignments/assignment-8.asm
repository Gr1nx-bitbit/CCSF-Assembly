# Victor Kozel
# Lab Assignment 8

.globl main

.text

    main:
        li $a0, 7
        li $a1, 12
        li $a2, 19
        li $a3, 41

        jal f # call f

        li $v0, 10 # the return value is stored in $v0 which gets overwritten here to end the program 
        syscall

    f:
        blt $a0, $a1, returnLess # if $a0 < $a1, then branch to returnLess 
        beq $a0, $a1, returnEqual # if $a0 and $a1 are equal, branch to retrunEqual
        bgt $a0, $a1, returnGreater # if $a0 > $a1, then branch to returnGreater

    returnLess:
        move $v0, $a2 # load third parameter into return register 
        jr $ra # jump back to instruction after jal to end the program

    returnEqual:
        move $v0, $a3 # load fourth parameter into return register
        jr $ra

    returnGreater:
        add $v0, $a2, $a3 # store $a2 + $a3 in return register
        jr $ra
