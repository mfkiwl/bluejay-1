.text
.global init

########
# init #
########
init:
    # initialize mtvec
    la t0, trap
    csrw mtvec, t0
    ret
