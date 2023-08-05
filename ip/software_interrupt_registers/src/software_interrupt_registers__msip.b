//==============================================
// software_interrupt_registers__msip
//==============================================
module software_interrupt_registers__msip
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] msip,
);

logic [SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP__WIDTH-1:0] msip__msip;
logic [SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP__WIDTH-1:0] msip__msip__n;
logic [SOFTWARE_INTERRUPT_REGISTERS__MSIP__WARL__0__WIDTH-1:0] msip__warl__0;

assign msip[SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP___WIDTH] = msip__msip;
assign msip[SOFTWARE_INTERRUPT_REGISTERS__MSIP__WARL__0__WIDTH] = msip__warl__0;

assign msip__msip__n = wr_data[SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP__FIELD];
assign msip__warl__0 = SOFTWARE_INTERRUPT_REGISTERS__MSIP__WARL__0__VALUE;

//==============================
// d_flip_flop__msip__msip
//==============================
d_flip_flop #(.WIDTH(SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP__WIDTH), .RESET_VALUE(SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP__NOT_PENDING)) d_flip_flop__msip__msip
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(msip__msip__n),
    .q(msip__msip)
);

endmodule
