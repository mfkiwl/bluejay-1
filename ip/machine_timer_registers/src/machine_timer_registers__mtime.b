//==============================================
// machine_timer_registers__mtime
//==============================================
module machine_timer_registers__mtime
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] rd_data
);

logic [63:0] mtime;
logic [MACHINE_TIMER_REGISTERS__MTIME__MTIME__WIDTH-1:0] mtime__mtime;
logic [MACHINE_TIMER_REGISTERS__MTIME__MTIME__WIDTH-1:0] mtime__mtime__n;

assign rd_data = mtime;

assign mtime[MACHINE_TIMER_REGISTERS__MTIME__MTIME__FIELD] = mtime__mtime;

assign mtime__mtime__n = en ? wr_data[MACHINE_TIMER_REGISTERS__MTIME__MTIME__FIELD] : mtime__mtime + 1;  

//==============================
// d_flip_flop__mtime__mtime
//==============================
d_flip_flop #(.WIDTH(MACHINE_TIMER_REGISTERS__MTIME__MTIME__WIDTH), .RESET_VALUE(MACHINE_TIMER_REGISTERS__MTIME__MTIME__RESET_VALUE)) d_flip_flop__mtime__mtime
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(mtime__mtime__n),
    .q(mtime__mtime)
);

endmodule

