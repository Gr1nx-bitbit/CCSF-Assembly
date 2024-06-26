.data
    a: .word -24
    storage: .word 0 # this is here just so I can print what's in $t0 and debug

.globl main # set the main label as the entrypoint for the program

.text
    # use blt (branch on less than) beq (branch on equal) and bgt (branch on greater than)
    main:
        lw $t2, a # load the value from a into $t2 for comparison

        blt $t2, $zero, negative # branch to negative if the value in $t2 < 0
        beq $t2, $zero, level # branch to level if the value in $t2 == 0
        bgt $t2, $zero, positive # branch to positive if the value in $t2 > 0

        negative:
            li $t0, -1
            j end # jump to end so as not to execute the instructions in level and positive
        level:
            li $t0, 0
            j end # jump to end so as not to execute instruction in positive
        positive:
            li $t0, 1 # no jump needed as end is the start for subsequent instruction(s)

        end:
            li $v0, 1
            sw $t0, storage
            lw $a0, storage
            syscall # print out the number to confirm the program works
            
            li $v0, 10
            syscall # exit the program
