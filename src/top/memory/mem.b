//==============================================
// mem
//==============================================
module mem
(
    input clk,
    input rst,
    input [DEPTH__LOG2-1:0] addr,
    input we,
    input en,
    input [WIDTH-1:0] wr_data,
    output logic [WIDTH-1:0] rd_data
);

parameter WIDTH = 1;
parameter DEPTH = 2;
parameter DEPTH__LOG2 = 1;

logic [WIDTH-1:0] memory [DEPTH-1:0];
logic [WIDTH-1:0] temp__0;
logic [WIDTH-1:0] temp__1;

// Read memory.
always @(posedge clk) begin
    if (en) begin 
        temp__0 <= memory[addr];
        temp__1 <= temp__0;
        rd_data <= temp__1;
    end
end

// Write memory.
always @(posedge clk) begin
    if (en && we) begin 
        memory[addr] <= wr_data;
    end
end

endmodule