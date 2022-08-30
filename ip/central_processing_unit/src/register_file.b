//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input [4:0] rd_addr,
    output logic [63:0] rd_data,
    input [4:0] wr_addr,
    input [63:0] wr_data
);

// General-purpose registers.
PYTHON(for i in range(32): print(f"logic [63:0] x__{i};"))

// Register x__0 is hardwired to 0.
assign x__0 = 64'h0;

// Read register file.
always_comb begin
    case (rd_addr)
        PYTHON(for i in range(32): print(f"5'h{i:x}: rd_data = x__{i};"))
    endcase
end

     
// Write register file. 
always_ff @(posedge clk) begin
    case (wr_addr)
        PYTHON(for i in range(1, 32): print(f"5'h{i:x}: x__{i} <= we ? wr_data : x__{i};"))
    endcase
end

endmodule
