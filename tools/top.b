module top
(
    input a,
    output logic z,
);
    
always_comb
begin
    case ((a))
    SIZE__WORD:
    begin
        a = b;
    end
    OP__LB:
    begin
        a == c;
PYTHON
(
        print('        a == c + d;')
        print('        y == c + d;')
)
    end
    endcase
end

PYTHON
(
    for i in range(5):
        print('    hi')
)

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
