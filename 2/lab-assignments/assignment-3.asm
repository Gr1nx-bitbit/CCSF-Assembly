.data
    a: .word 5, 6, 7, 10, 14, 17, 21, 22, 25, 36 # this is the array of integers with each value taking up one word's worth of data
    storage: .word 0 # this is for storing stuff that I can print

.globl main # set the main tag as the entry point to the program

.text # list instructions under this directive
    run: 
        la $t0, a # load the address of the array into a register
        lw $t1, 36($t0) # load the element of the array 9 words after the start of it into $t1 so as not to overwrite $t0
        lw $t0, 0($t0) # load the first element of the array into $t0

        li $v0, 1 # load the value of print int into $v0
        sw $t0, storage # store the first element in storage
        lw $a0, storage # load the first element into $a0 from storage
        syscall # print the int in $v0
        
        li $v0, 1 # repeat but for the value in $t1
        sw $t1, storage
        lw $a0, storage
        syscall # unfortunately I wasn't able to figure out how to print a newline or a space (I got an out of range error) so the values are printed out stuck together
        
        li $v0, 10
        syscall # exit the program
    
    main:
        la $v0, run
        syscall # "call" the instructions stored at the run: location
