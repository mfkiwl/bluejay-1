//==============================================
// tb__platform_level_interrupt_controller
//==============================================
module tb__platform_level_interrupt_controller;

logic clk;
logic rst;

logic cs;
logic we;
logic [25:0] addr;
logic [31:0] wr_data;
logic [31:0] rd_data;
logic is__0;
logic is__1;
logic context__0__eip;


//==============================================
// dut 
//==============================================
platform_level_interrupt_controller dut 
(
    .clk(clk),
    .rst(rst),
    .cs(cs),
    .we(we),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .is__0(is__0),
    .is__1(is__0),
    .context__0__eip(context__0__eip)
);

endmodule

