.globl main

.text
    # result is what is returned to so that variable will be register $v1 since we will need $v0 to end the program

    main:
        li $a0, 7
        li $a1, 12
        li $a2, 19
        li $a3, 41

    f:
        blt $a0, $a1, returnLess # if $a0 < $a1, then branch to returnLess 
        beq $a0, $a1, returnEqual # if $a0 and $a1 are equal, branch to retrunEqual
        bgt $a0, $a1, returnGreater # if $a0 > $a1, then branch to returnGreater

    returnLess:
        move $v1, $a2 # load third parameter into return register 
        j end

    returnEqual:
        move $v1, $a3 # load fourth parameter into return register
        j end

    returnGreater:
        add $v1, $a2, $a3 # store $a2 + $a3 in return register

    end:
        li $v0, 1
        move $a0, $v1
        syscall

        li $v0, 10
        syscall
