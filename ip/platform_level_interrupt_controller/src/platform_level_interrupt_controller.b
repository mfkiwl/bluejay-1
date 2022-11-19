//==============================================
// platform_level_interrupt_controller 
//==============================================
module platform_level_interrupt_controller
(
    clk,
    rst,
    ce,
    rw,
    addr,
    wr_data,
    rd_data,
    signal__0,
    signal__1
);

input clk;
input rst;
input ce;
input rw;
input [25:0] addr;
input [31:0] wr_data;
output [31:0] rd_data;
input a__0;
input a__1;

logic clk;
logic rst;

logic ce;
logic rw;
logic [25:0] addr;
logic [31:0] wr_data;
logic [31:0] rd_data;

logic signal__0;
logic signal__1;

logic ir__0;
logic ir__1;

logic complete__0;
logic complete__1;

logic context__0__eip;


//==============================
// PLIC_core 
//==============================
PLIC_core core
(
    .clk(clk),
    .rst(rst),
    .ce(ce),
    .rw(rw),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .ir__0(ir__0),
    .ir__1(ir__1),
    .complete__0(complete__0),
    .complete__1(complete__1),
    .context__0__eip(context__0__eip)
);

//==============================================
// gateway__1
//==============================================
PLIC_gateway gateway__1
(
    clk(clk),
    rst(rst),
    signal(signal__1),
    ir(ir__1)
);

endmodule



