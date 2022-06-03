//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input [4:0] addr,
    output logic [63:0] rd_data,
    input [63:0] wr_data
);

// General-purpose registers.
PYTHON(for i in range(32): print(f"logic [63:0] x_{i};"))

// Register x_0 is hardwired to 0.
assign x_0 = 64'h0;

// Assign rd_data.
always_comb begin
    case (addr)
        PYTHON(for i in range(32): print(f"5'h{i:x}: rd_data = x_{i};"))
    endcase
end
     
// Write wr_data (if we is asserted). 
always_ff @(posedge clk) begin
    case (addr)
        PYTHON(for i in range(1, 32): print(f"5'h{i:x}: x_{i} <= we ? wr_data : x_{i};"))
    endcase
end

endmodule
