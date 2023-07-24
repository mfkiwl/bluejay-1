//==============================================
// jay__mtval
//==============================================
module jay__mtval
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mtval 
);

logic [CSR__MTVAL__MTVAL__WIDTH-1:0] mtval__mtval;
logic [CSR__MTVAL__MTVAL__WIDTH-1:0] mtval__mtval__n;

assign mtval[CSR__MTVAL__MTVAL__FIELD] = mtval__mtval;

assign mtval__mtval__n = wr_data[CSR__MTVAL__MTVAL__FIELD];

//==============================
// d_flip_flop__mtval__mtval
//==============================
d_flip_flop #(.WIDTH(CSR__MTVAL__MTVAL__WIDTH), .RESET_VALUE(CSR__MTVAL__MTVAL__RESET_VALUE)) d_flip_flop__mtval__mtval
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mtval__mtval__n),
    .q(mtval__mtval)
);

endmodule
