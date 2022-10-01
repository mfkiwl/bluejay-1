//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input addr,
    output logic [63:0] rd_data,
    input [63:0] wr_data
);

PYTHON(for i in range(32): print(f"logic [63:0] x__{i};"))

assign x__0 = 64'h0;

always_comb begin
    case (addr)
        PYTHON(for i in range(32): print(f"5'h{i:x}: rd_data = x__{i};"))
    endcase
end

always_ff @(posedge clk) begin
    case (addr)
        PYTHON(for i in range(1, 32): print(f"5'h{i:x}: x__{i} <= we ? wr_data : x__{i};"))
    endcase
end

endmodule
