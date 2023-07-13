//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input cs,
    input we,
    input [4:0] addr,
    output logic [63:0] rd_data,
    input [63:0] wr_data
);

PYTHON
(
    for i in range(32):
        print(f"logic [63:0] x__{i};")
)

PYTHON
(
    for i in range(32):
        print(f"logic we__x__{i};")
)

PYTHON
(
    for i in range(32):
        print(f"logic en__x__{i};")
)


always_comb
begin
PYTHON
(
    for i in range(32):
        print(f"    we__x__{i} = 1'b0;")
)

    case (addr)
PYTHON
(
    for i in range(32):
        print(
        f"""        
            5'h{i:x}:
            begin
                rd_data = x__{i};
                we__x__{i} = we;
            end
        """
        )
)
    endcase
end

PYTHON
(
    for i in range(32):
        print(f"assign en__x__{i} = cs & we__x__{i};")
)


assign x__0 = 64'h0;


PYTHON
(
    for i in range(1, 32):
        print(f"//==============================")
        print(f"// d_flip_flop__x__{i}")
        print(f"//==============================")
        print(f"d_flip_flop #(.WIDTH(64)) d_flip_flop__x__{i}")
        print(f"(")
        print(f"    .clk(clk),")
        print(f"    .rst(1'b0),")
        print(f"    .en(en__x__{i}),")
        print(f"    .d(wr_data),")
        print(f"    .q(x__{i})")
        print(f");")
)

endmodule
