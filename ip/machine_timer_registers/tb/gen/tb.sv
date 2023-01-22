//==============================================
// timescale
//==============================================
//`timescale 1ns / 1ps

//==============================================
// tb 
//==============================================
module tb();

logic clk;
logic rst;
logic cs;
logic we;
logic addr;
logic [63:0] wr_data;
logic [63:0] rd_data;
logic tip;

machine_timer_registers dut
(
    .clk(clk),
    .rst(rst),
    .cs(cs),
    .we(we),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .tip(tip)
);


// clock
always
begin
    clk = 1'b0;
    forever #5 clk = !clk;
end


initial begin
    rst = 1'b1;
    addr = 1'b0;
    we = 1'b0;
    cs = 1'b0;
    #10;
    rst = 1'b0;
    #20;
    cs = 1'b1;
    we = 1'b1;
    addr = 1'b1;
    wr_data = 64'h4;
    #10;
    cs = 1'b1;
    we = 1'b1;
    addr = 1'b0;
    wr_data = 64'h0;
    #10;
    cs = 1'b0;
    #50;
    $finish();
end


endmodule
