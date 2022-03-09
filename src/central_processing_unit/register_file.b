//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input [4:0] rs1,
    output logic [63:0] rs1_data,
    input [4:0] rs2,
    output logic [63:0] rs2_data,
    input [4:0] rd,
    input [63:0] rd_data
);
    
// general-purpose registers
PYTHON(for i in range(32): print(f"logic [63:0] x_{i};"))

// register x_0 is hardwired to 0
assign x_0 = 64'h0;
     
// assign rs1_data
always_comb begin
    case (rs1)
        PYTHON(for i in range(32): print(f"5'h{i:x}: rs1_data = x_{i};"))
    endcase
end

// assign rs2_data
always_comb begin
    case (rs2)
        PYTHON(for i in range(32): print(f"5'h{i:x}: rs2_data = x_{i};"))
    endcase
end
     
// write rd_data (if we is asserted) 
always_ff @(posedge clk) begin
    case (rd)
        PYTHON(for i in range(32): print(f"5'h{i:x}: x_{i} <= we ? rd_data : x_{i};"))
    endcase
end

endmodule
