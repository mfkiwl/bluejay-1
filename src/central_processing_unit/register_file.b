//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input [LOG2(NUM_GPR)-1:0] rd_addr_0,
    output logic [WIDTH-1:0] rd_data_0,
    input [LOG2(NUM_GPR)-1:0] rd_addr_1, 
    output logic [WIDTH-1:0] rd_data_1,
    input [LOG2(NUM_GPR)-1:0] wr_addr,
    input [WIDTH-1:0] wr_data
);
    
// general-purpose registers
logic [WIDTH-1:0] PYTHON(for i in range(NUM_GPR-1): print(f"r_{i}, ", end = ""))PYTHON(print(f"r_{NUM_GPR-1};", end = ""))

// register r_0 is hardwired to 0
assign r_0 = WIDTH'h0;
     
// assign rd_data_0
always_comb begin
    case (rd_addr_0)
        PYTHON(for i in range(NUM_GPR): print(f"LOG2(NUM_GPR)'h{format(i, 'x')}: rd_data_0 = r_{i};"))
    endcase
end

// assign rd_data_1
always_comb begin
    case (rd_addr_1)
        PYTHON(for i in range(NUM_GPR): print(f"LOG2(NUM_GPR)'h{format(i, 'x')}: rd_data_1 = r_{i};"))
    endcase
end
     
// write wr_data (if we is asserted) 
always_ff @(posedge clk) begin
    case (wr_addr)
        PYTHON(for i in range(1, NUM_GPR): print(f"LOG2(NUM_GPR)'h{format(i, 'x')}: r_{i} <= we ? wr_data : r_{i};"))
    endcase
end

endmodule

