//==============================================
// platform_level_interrupt_controller 
//==============================================
module platform_level_interrupt_controller
(
    input clk,
    input rst,
    input cs,
    input we,
    input [25:0] addr,
    input [31:0] wr_data,
    output logic [31:0] rd_data,
    input int__1,
    output logic context__0__eip
);


logic request__0;
logic request__1;
logic complete__0;
logic complete__1;

//==============================
// core 
//==============================
platform_level_interrupt_controller__core core
(
    .clk(clk),
    .rst(rst),
    .cs(cs),
    .we(we),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .request__0(request__0),
    .request__1(request__1),
    .complete__0(complete__0),
    .complete__1(complete__1),
    .context__0__eip(context__0__eip)
);

//==============================
// gateway__1
//==============================
platform_level_interrupt_controller__gateway gateway__1
(
    .clk(clk),
    .rst(rst),
    .int(int__1),
    .request(request__1),
    .complete(complete__1)
);

endmodule



