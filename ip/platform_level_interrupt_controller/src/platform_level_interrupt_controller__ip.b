//==============================================
// platform_level_interrupt_controller__ip 
//==============================================
module platform_level_interrupt_controller__ip
(
    input clk,
    input rst,
PYTHON
(
    for i in range(32):
        print(f"    input request__{i},")
        print(f"    input claim__{i},")
)
    output logic [31:0] ip
);

PYTHON
(
    for i in range(32):
        print(f"logic [PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IP__IP__{i}__WIDTH-1:0] ip__ip__{i};")
        print(f"logic [PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IP__IP__{i}__WIDTH-1:0] ip__ip__{i}__n;")
)

PYTHON
(
    for i in range(32):
        print(f"logic en__ip__ip__{i};")
)

PYTHON
(
    for i in range(32):
        print(f"assign ip[PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IP__IP__{i}__FIELD] = ip__ip__{i};")
)

PYTHON
(
    for i in range(32):
        print(f"assign en__ip__ip__{i} = request__{i} | claim__{i};")
)

PYTHON
(
    for i in range(32):
        print(f"assign ip__ip__{i}__n = request__{i} ? 1'b1 : claim__{i} ? 1'b0 : ip__ip__{i};")
)

PYTHON
(
    for i in range(32):
        print(f"//==============================")
        print(f"// d_flip_flop__ip__ip__{i}")
        print(f"//==============================")
        print(f"d_flip_flop #(.WIDTH(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IP__IP__{i}__WIDTH-1:0), .RESET_VALUE(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IP__IP__{i}__NOT_PENDING)) d_flip_flop__ip__ip__{i}")
        print(f"(")
        print(f"    .clk(clk),")
        print(f"    .rst(rst),")
        print(f"    .en(en__ip__ip__{i}),")
        print(f"    .d(ip__ip__{i}__n),")
        print(f"    .q(ip__ip__{i})")
        print(f");")
        print(f"")
)

endmodule

