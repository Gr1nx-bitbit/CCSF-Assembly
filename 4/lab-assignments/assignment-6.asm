# Victor Kozel
#Lab Assignment 6

.globl main # set entry point to the program to be the main label

.text
    main:
        li $t0, 0 # load temporary registers with values
        li $t1, 1
        li $t2, 2
        li $t3, 3

        move $a0, $t0 # move the values in the temporary registers into the argument registers so add4 can use them
        move $a1, $t1
        move $a2, $t2
        move $a3, $t3

        jal add4 # jump to add4 and incrememnt store the address of the next instruction in $ra

        move $s1, $v0 # copy the value from the return register into the save register $s0

        li $v0, 10 # exit the program
        syscall

    add4:
        add $v0, $v0, $a0 # add the values in the argument registers into $v0 (the return register)
        add $v0, $v0, $a1
        add $v0, $v0, $a2
        add $v0, $v0, $a3
        jr $ra # jump back to the instruction that comes after jal add4
