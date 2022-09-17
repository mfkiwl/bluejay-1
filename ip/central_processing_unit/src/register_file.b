//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input [4:0] rd_addr__0,
    output logic [63:0] rd_data__0,
    input [4:0] rd_addr__1,
    output logic [63:0] rd_data__1,
    input [4:0] wr_addr,
    input [63:0] wr_data
);

PYTHON(for i in range(32): print(f"logic [63:0] x__{i};"))

assign x__0 = 64'h0;

always_comb begin
    case (rd_addr__0)
        PYTHON(for i in range(32): print(f"5'h{i:x}: rd_data__0 = x__{i};"))
    endcase
end

always_comb begin
    case (rd_addr__1)
        PYTHON(for i in range(32): print(f"5'h{i:x}: rd_data__1 = x__{i};"))
    endcase
end

always_ff @(posedge clk) begin
    case (wr_addr)
        PYTHON(for i in range(1, 32): print(f"5'h{i:x}: x__{i} <= we ? wr_data : x__{i};"))
    endcase
end

endmodule
