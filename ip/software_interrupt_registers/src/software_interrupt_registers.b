//==============================================
// software_interrupt_registers
//==============================================
module software_interrupt_registers
(
    input clk,
    input rst,
    input cs,
    input we,
    input [63:0] wr_data,
    output logic ready,
    output logic resp,
    output logic [63:0] rd_data,
    output logic sip
);

logic [63:0] msip;

logic en__msip;

assign en__msip = cs & we;

assign ready = 1'b1;
assign resp = 1'b0;
assign rd_data = msip;

assign sip = msip[SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP__FIELD];

//==============================
// software_interrupt_registers__msip__0
//==============================
software_interrupt_registers__msip software_interrupt_registers__msip__0
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .wr_data(wr_data),
    .msip(msip),
);

endmodule
