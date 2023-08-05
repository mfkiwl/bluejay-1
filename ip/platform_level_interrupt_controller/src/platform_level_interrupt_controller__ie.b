//==============================================
// platform_level_interrupt_controller__ie 
//==============================================
module platform_level_interrupt_controller__ie
(
    input clk,
    input rst,
    input en,
    input [31:0] wr_data,
    output logic [31:0] ie 
);

PYTHON
(
    for i in range(32):
        print(f"logic [PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IE__IE__{i}__WIDTH-1:0] ie__ie__{i};")
        print(f"logic [PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IE__IE__{i}__WIDTH-1:0] ie__ie__{i}__n;")
)


PYTHON
(
    for i in range(32):
        print(f"assign ie[PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IE__IE__{i}__FIELD] = ie__ie__{i};")
)

PYTHON
(
    for i in range(32):
        print(f"assign ie__ie__{i}__n = wr_data[PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IE__IE__{i}__FIELD];")
)

PYTHON
(
    for i in range(32):
        print(f"//==============================")
        print(f"// d_flip_flop__ie__ie__{i}")
        print(f"//==============================")
        print(f"d_flip_flop #(.WIDTH(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IE__IE__{i}__WIDTH-1:0), .RESET_VALUE(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IE__IE__{i}__NOT_ENABLED)) d_flip_flop__ie__ie__{i}")
        print(f"(")
        print(f"    .clk(clk),")
        print(f"    .rst(rst),")
        print(f"    .en(en),")
        print(f"    .d(ie__ie__{i}__n),")
        print(f"    .q(ie__ie__{i})")
        print(f");")
        print(f"")
)

endmodule

