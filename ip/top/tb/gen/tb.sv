//==============================================
// timescale
//==============================================
//`timescale 1ns / 1ps

//==============================================
// tb 
//==============================================
module tb;

logic clk_100mhz;
logic [15:0] sw;
logic btnc;
logic btnu;
logic btnl;
logic btnr;
logic btnd;
logic [15:0] led;
//logic led16_b;
wire led16_b;
wire aud_pwm;
wire aud_sd;
logic led16_g;
logic led16_r;
logic led17_b;
logic led17_g;
logic led17_r;
logic [7:0] an;
logic ca; 
logic cb; 
logic cc; 
logic cd; 
logic ce; 
logic cf; 
logic cg;

//==============================
// top 
//==============================
top dut
(
    .clk_100mhz(clk_100mhz),
    .sw(sw),
    .btnc(btnc),
    .btnu(btnu),
    .btnl(btnl),
    .btnr(btnr),
    .btnd(btnd),
    .led(led),
    .led16_b(led16_b),
    .led16_g(led16_g),
    .led16_r(led16_r),
    .led17_b(led17_b),
    .led17_g(led17_g),
    .led17_r(led17_r),
    .aud_pwm(aud_pwm),
    .aud_sd(aud_sd),
    .an(an),
    .ca(ca), 
    .cb(cb), 
    .cc(cc), 
    .cd(cd), 
    .ce(ce), 
    .cf(cf), 
    .cg(cg)
);



//==============================================
// Clock (10ns)
//==============================================
always begin
    #5 clk_100mhz = !clk_100mhz;
end


initial begin
    // initialize clk
    clk_100mhz = 1'b1;
    btnc = 1'b1;
    btnd = 1'b0;
    #11;
    // de-assert rst
    btnc = 1'b0;
    #30000
    btnd = 1'b1;
    #10000
    btnd = 1'b0;
    //
    #200000;
end

endmodule
