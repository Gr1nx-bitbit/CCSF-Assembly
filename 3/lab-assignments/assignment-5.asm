.data
    tenitis: .word 3, 17, 12, 9, 36, 102, 81, 500, -1, 9

.globl main

.text
    # use $s0 as the register to hold current element's address
    # use $s1 as the register to hold the current element ($t2 has a bigger word offset each time)
    # use $t1 as the register to hold the offset in the array
    # use $t2 as the register to hold the words offset
    # use $t3 as the register to hold the sum of the values in the array
    # use $t4 as the register to hold the length of the array
    # use $t5 as the register to hold the comparison value
    # use $t6 as the register to hold the current element's value
    main:
        la $s0, tenitis # load address into $s0
        li $t1, 0 # start with an offset of 0 bytes
        li $t3, 0 # start with 0 in $t3
        li $t4, 9 # the length of the array
        li $t5, 767 # load comparison value

        loop:
            sll $t2, $t1, 2 # store how many words to shift in $t2
            add $s1, $s0, $t2 # make $s1 the address of the current element since $t2 is getting bigger with every iteration
            addi $t1, $t1, 1 # increment i 
            # sw $t2, 0 # set $t2 back to 0 to make sure we don't add offsets after loop cycles
            lw $t6, ($s1) # load element into $t6
            add $t3, $t3, $t6 # add the current element to $t3
            la $s1, tenitis
            bgt $t1, $t4, comparison # check to see if we're still in the bounds of the array and branch if we're out of range
            j loop # jump back to the beginning of the loop
        
        comparison:
            blt $t3, $t5, negative
            beq $t3, $t5, level
            bgt $t3, $t5, positive

        negative:
            li $t0, -1
            j end
        level:
            li $t0, 0
            j end
        positive:
            li $t0, 1
        
        end:

            li $v0, 10
            syscall
            
