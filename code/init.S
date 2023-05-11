.text
.global init

########
# init #
########
init:
    # initialize machine trap-vector base-address register 
    la t0, trap
    csrw mtvec, t0
    ret
