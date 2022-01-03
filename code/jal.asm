########
# main #
########                    
main:
    jal x1, main
    # return control to os
    li a7, 93
    ecall 

