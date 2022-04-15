//==============================================================
// main_memory 
//==============================================================
module main_memory 
(
    input clk,
    input rst,

    input valid,
    input [63:0] addr,
    input rw,
    input [511:0] wr_data,
    output logic [511:0] rd_data
);

parameter MEMORY__SIZE = 1024;

logic [7:0] memory [MEMORY__SIZE-1:0];

always_comb begin
    PYTHON(for i in range(64): print(f"rd_data[{i*8 + 7}:{i*8}] = memory[addr + {i}];"))
end

always_ff @(posedge clk) begin
   PYTHON(for i in range(64): print(f"memory[addr + {i}] <= (valid & rw) ? wr_data[{i*8 + 7}:{i*8}];"))
end


endmodule
