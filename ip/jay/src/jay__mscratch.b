//==============================================
// jay__mscratch
//==============================================
module jay__mscratch
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] rd_data
);

logic [63:0] mscratch;
logic [CSR__MSCRATCH__MSCRATCH__WIDTH-1:0] mscratch__mscratch;
logic [CSR__MSCRATCH__MSCRATCH__WIDTH-1:0] mscratch__mscratch__n;

assign rd_data = mscratch;

assign mscratch[CSR__MSCRATCH__MSCRATCH__FIELD] = mscratch__mscratch;

assign mscratch__mscratch__n = wr_data[CSR__MSCRATCH__MSCRATCH__FIELD];

//==============================
// d_flip_flop__mscratch__mscratch
//==============================
d_flip_flop #(.WIDTH(CSR__MSCRATCH__MSCRATCH__WIDTH), .RESET_VALUE(CSR__MSCRATCH__MSCRATCH__RESET_VALUE)) d_flip_flop__mscratch__mscratch
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mscratch__mscratch__n),
    .q(mscratch__mscratch)
);

endmodule
