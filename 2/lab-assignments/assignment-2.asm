# Victor Kozel

.data # the labels in this directive will be used to retrieve the value / number from main memory
    two: .word 2
    four: .word 4
    nine: .word 9
    sixteen: .word 16
    twentyFive: .word 25
    thirtySix: .word 36
    fortyNine: .word 49
    sixtyFour: .word 64
    eightyOne: .word 81
    hundred: .word 100
    storage: .word 0 # this label is for debugging and verfication purposes and is used by the program to print out the sum stored in $t0

.globl main # this indicates that the program will start with the main label

.text # this directive will hold the instructions for the program and main: will be the entry point 
    run: 
    	lw $t1, two # this will load a word of data from the location that two points to into the t1 register
        add $t0, $zero, $t1 # this instruction will add the data in the register zero to the data in register one and store it in regiester t0
        lw $t1, four # repeat of the above
        add $t0, $t0, $t1 # from here on, $t0 is added with itself and the value stored in $t1
        lw $t1, nine
        add $t0, $t0, $t1
        lw $t1, sixteen
        add $t0, $t0, $t1
        lw $t1, twentyFive
        add $t0, $t0, $t1
        lw $t1, thirtySix
        add $t0, $t0, $t1
        lw $t1, fortyNine
        add $t0, $t0, $t1
        lw $t1, sixtyFour
        add $t0, $t0, $t1
        lw $t1, eightyOne
        add $t0, $t0, $t1
        lw $t1, hundred
        add $t0, $t0, $t1

        sw $t0, storage # this will store the data in $t0 (size of one word) in the storage address
        li $v0, 1 # this will load the instruction to print an integer into $v0
        lw $a0, storage # this will load the argument to the syscall number in $v0, namely, the sum of the numbers
        syscall # this will print the sum
        li $v0, 10 # this will load the syscall number to end the program into $v0
        syscall # this will end the program
    
    main:
        la $v0, run # this is just an expirement but it seems to work. we can load the address of the run label into the register for performing syscalls and run the program with one line!
        syscall # this will "call" run almost like a function!
