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
    output logic [63:0] rd_data,
    output logic sip
);

// Machine Software Interrupt Pending Register (msip)
logic [63:0] msip;
logic [SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP__WIDTH-1:0] msip__msip;
logic [SOFTWARE_INTERRUPT_REGISTERS__MSIP__WARL__0__WIDTH-1:0] msip__warl__0;
logic we__msip;
logic en__msip;

assign rd_data = msip;
assign sip = msip__msip;

//============================================== 
// Machine Software Interrupt Pending Register (mtime)
//==============================================
assign we__msip = we;
assign en__msip = we & cs; 

//==============================
// d_flip_flop__msip__msip
//==============================
d_flip_flop #(.WIDTH(SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP__WIDTH), .RESET_VALUE(SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP__RESET_VALUE)) d_flip_flop__msip__msip
(
    .clk(clk),
    .rst(rst),
    .en(en__msip),
    .d(wr_data[SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP__FIELD]),
    .q(msip__msip)
);

assign msip__warl__0 = SOFTWARE_INTERRUPT_REGISTERS__MSIP__WARL__0__VALUE;

assign msip[SOFTWARE_INTERRUPT_REGISTERS__MSIP__MSIP___WIDTH] = msip__msip;
assign msip[SOFTWARE_INTERRUPT_REGISTERS__MSIP__WARL__0__WIDTH] = msip__warl__0;

endmodule
