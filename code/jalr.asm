########
# main #
########                    
main:
    # initialize x1 to 0
    add x1, x0, x0
    # call foo 
    jal x31, foo   
    # return control to os
    li a7, 93
    ecall 

#######
# foo #
#######
foo:
    # increment x1
    addi x1, x1, 1
    # return
    jalr x31, x31, -4