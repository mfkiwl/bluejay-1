//==============================================
// jay__misa
//==============================================
module jay__misa
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] rd_data
);

logic [63:0] misa;
logic [CSR__MISA__EXTENSIONS__WIDTH-1:0] misa__extensions;
logic [CSR__MISA__WIRI__0__WIDTH-1:0] misa__wiri__0;
logic [CSR__MISA__BASE__WIDTH-1:0] misa__base;

assign rd_data = misa;

assign misa[CSR__MISA__EXTENSIONS__FIELD] = misa__extensions;
assign misa[CSR__MISA__WIRI__0__FIELD] = misa__wiri__0;
assign misa[CSR__MISA__BASE__FIELD] = misa__base;

assign misa__extensions = CSR__MISA__EXTENSIONS__I;
assign misa__wiri__0 = CSR__MISA__WIRI__0__VALUE;
assign misa__base = CSR__MISA__BASE__RV64;

endmodule
