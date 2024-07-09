# Victor Kozel
# Lab Assignment 7

.globl main

.data
    char0: .ascii "H"
    char1: .ascii "A"
    char2: .ascii "P"
    char3: .ascii "P"
    char4: .ascii "Y"

.text
    main:
        jal reverse5

        li $v0, 10 # exit the program
        syscall

    reverse5:
        # push characters onto the stack
        # load characters into registers
        lbu $a0, char0
        lbu $a1, char1
        lbu $a2, char2
        lbu $a3, char3

        sw $s1, ($sp) # save the value in $s1 in case there is a value in there that we want to restore
        lbu $s1, char4 # load 'Y' into a saved register
        subu $sp, $sp, 4 # decrement the stack pointer so we can push the characters onto it

        sw $a0, ($sp) # push 'H' onto the stack
        subu $sp, $sp, 4 
        sw $a1, ($sp) # push 'A' onto the stack
        subu $sp, $sp, 4 
        sw $a2, ($sp) # push 'P' onto the stack
        subu $sp, $sp, 4 
        sw $a3, ($sp) # push 'P' onto the stack
        subu $sp, $sp, 4 
        sw $s1, ($sp) # push 'Y' onto the stack

        # print characters in the stack + pop the character and incermement the stack pointer
        li $v0, 11 # code to print a character
        lw $a0, ($sp) # load last character stored on the stack
        syscall
        addiu $sp, $sp, 4 # increment the stack pointer so we go back one character

        li $v0, 11 
        lw $a0, ($sp) 
        syscall
        addiu $sp, $sp, 4 

        li $v0, 11 
        lw $a0, ($sp) 
        syscall
        addiu $sp, $sp, 4 

        li $v0, 11 
        lw $a0, ($sp)
        syscall
        addiu $sp, $sp, 4 

        li $v0, 11 
        lw $a0, ($sp)
        syscall
        addiu $sp, $sp, 4 # put the stack pointer at what value it was originally

        lw $s1, ($sp) # restore whatever value might have been in $s1 before the procedure call

        jr $ra
