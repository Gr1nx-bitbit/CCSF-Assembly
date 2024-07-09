# this is just lab assignment 7 but the way I'd want to do it

.globl main

.data
    string: .space 40 # string to contain "HAPPY"

.text
    main:
        # # input the string
        # li $v0, 8
        # la $a0, string
        # li $a1, 40
        # syscall

        # push each character onto the stack
        li $t1, 0 # offset this by the string to get each character
    addLetter:
        lbu $t0, string($t1) # load character onto
        addiu $t1, 1 # increment to next character by adding one byte to the address

    reverse5:
        # print character in the stack
        # pop the character and incermement the stack pointer