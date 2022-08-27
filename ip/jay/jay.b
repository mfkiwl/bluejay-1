//==============================================
// jay
//==============================================
module jay
(
    input clk,
    input rst,
    output logic [60:0] l1_to_mem__addr,
    output logic [63:0] l1_to_mem__wr_data,
    input [63:0] l1_to_mem__rd_data,
    output logic l1_to_mem__en,
    output logic l1_to_mem__we
);

//==============================
// central_processing_unit__0
//==============================
central_processing_unit central_processing_unit__0
(
    .clk(clk),
    .rst(rst),
    .l1_to_mem__addr(l1_to_mem__addr),
    .l1_to_mem__wr_data(l1_to_mem__wr_data),
    .l1_to_mem__rd_data(l1_to_mem__rd_data),
    .l1_to_mem__en(l1_to_mem__en),
    .l1_to_mem__we(l1_to_mem__we)
);

endmodule
