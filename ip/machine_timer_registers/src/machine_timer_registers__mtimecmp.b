//==============================================
// machine_timer_registers__mtimecmp
//==============================================
module machine_timer_registers__mtimecmp
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] rd_data
);

logic [63:0] mtimecmp;
logic [MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__WIDTH-1:0] mtimecmp__mtimecmp;
logic [MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__WIDTH-1:0] mtimecmp__mtimecmp__n;

assign rd_data = mtimecmp;

assign mtimecmp[MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__FIELD] = mtimecmp__mtimecmp;

assign mtimecmp__mtimecmp__n = wr_data[MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__FIELD];

//==============================
// d_flip_flop__mtimecmp__mtimecmp
//==============================
d_flip_flop #(.WIDTH(MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__WIDTH), .RESET_VALUE(MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__RESET_VALUE)) d_flip_flop__mtimecmp__mtimecmp
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mtimecmp__mtimecmp__n),
    .q(mtimecmp__mtimecmp)
);


endmodule

