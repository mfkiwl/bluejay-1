//==============================================
// main_memory
//==============================================
module main_memory
(
    input clk,
    input rst,

    input req__valid,
    output logic req__ready,
    input req__rw,
    input [64:0] req__addr,
    input [511:0] req__data,

    output logic rtn__valid,
    input logic rtn__ready,
    output logic [511:0] rtn__data
);

logic [511:0] memory [255:0];

endmodule