//==============================================================
// memory
//==============================================================
module memory
(
    input clk,
    input rst,
    input [DEPTH__LOG2-1:0] addr,
    input we,
    input [WIDTH-1:0] wr_data,
    output logic [WIDTH-1:0] rd_data
);

parameter WIDTH = 1;
parameter DEPTH = 2;
parameter DEPTH__LOG2 = 1;

logic [WIDTH-1:0] memory [DEPTH-1:0];

// Read memory.
assign rd_data = memory[addr];

// Write memory.
always @(posedge clk) begin
    if (we) begin 
        memory[addr] <= wr_data;
    end
end

endmodule