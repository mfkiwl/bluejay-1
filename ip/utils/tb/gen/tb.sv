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
logic [3:0] addr;
logic [63:0] wr_data;
logic [63:0] rd_data;
logic pwm;

pulse_width_modulator dut
(
    .clk(clk),
    .rst(rst),
    .cs(cs),
    .we(we),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .pwm(pwm)
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
    addr = 4'h0000000;
    wr_data = 2;
    #10;
    cs = 1'b0;
    #10
    cs = 1'b1;
    we = 1'b1;
    addr = 4'h0000004;
    wr_data = 1;
    #10;
    cs = 1'b0;
    #500;
    cs = 1'b1;
    we = 1'b1;
    addr = 4'h0000000;
    wr_data = 4;
    #10;
    cs = 1'b0;
    #500;
    cs = 1'b1;
    we = 1'b1;
    addr = 4'h0000004;
    wr_data = 1;
    #10;
    cs = 1'b0;
    #500;
    cs = 1'b1;
    we = 1'b1;
    addr = 4'h0000004;
    wr_data = 2;
    #10;
    cs = 1'b0;
    #500;
    cs = 1'b1;
    we = 1'b1;
    addr = 4'h0000004;
    wr_data = 3;
    #10;
    cs = 1'b0;
    #500;
    cs = 1'b1;
    we = 1'b1;
    addr = 4'h0000004;
    wr_data = 4;
    #10;
    cs = 1'b0;
    #500;
    cs = 1'b1;
    we = 1'b1;
    addr = 4'h0000004;
    wr_data = 0;
    #10;
    cs = 1'b0;
    #500;
    cs = 1'b1;
    we = 1'b1;
    addr = 4'h0000000;
    wr_data = 0;
    #10;
    cs = 1'b0;
    #500;
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
