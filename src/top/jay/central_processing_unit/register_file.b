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

// General-purpose registers.
PYTHON(for i in range(32): print(f"logic [63:0] x_{i};"))

// Register x_0 is hardwired to 0.
assign x_0 = 64'h0;

// Assign rd_data__0.
always_comb begin
    case (rd_addr__0)
        PYTHON(for i in range(32): print(f"5'h{i:x}: rd_data__0 = x_{i};"))
    endcase
end

// Assign rd_data__1.
always_comb begin
    case (rd_addr__1)
        PYTHON(for i in range(32): print(f"5'h{i:x}: rd_data__1 = x_{i};"))
    endcase
end
     
// Write rd_data (if we is asserted). 
always_ff @(posedge clk) begin
    case (wr_addr)
        PYTHON(for i in range(1, 32): print(f"5'h{i:x}: x_{i} <= we ? wr_data : x_{i};"))
    endcase
end

endmodule
