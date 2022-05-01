//==============================================
// top
//==============================================
module top
(
    input clk,
    input rst
);

logic [39:0] mem__addr;
logic [63:0] mem__rd_data;
logic [63:0] mem__wr_data;
logic il1_to_mem__valid;

logic [63:0] il1_to_mem__data;
logic il1_to_mem__credit;
logic mem_to_il1__valid;
logic [63:0] mem_to_il1__data;
logic mem_to_il1__credit;

logic [63:0] dl1_to_mem__data;
logic dl1_to_mem__credit;
logic mem_to_dl1__valid;
logic [63:0] mem_to_dl1__data;
logic mem_to_dl1__credit;


//==============================
// cpu
//==============================
central_processing_unit cpu
(
    .clk(clk),
    .rst(rst),
    .il1_to_mem__valid(il1_to_mem__valid),
    .il1_to_mem__data(il1_to_mem__data),
    .il1_to_mem__credit(il1_to_mem__credit),
    .mem_to_il1__valid(mem_to_il1__valid),
    .mem_to_il1__data(mem_to_il1__data),
    .mem_to_il1__credit(mem_to_il1__credit),
    .dl1_to_mem__valid(dl1_to_mem__valid),
    .dl1_to_mem__data(dl1_to_mem__data),
    .dl1_to_mem__credit(dl1_to_mem__credit),
    .mem_to_dl1__valid(mem_to_dl1__valid),
    .mem_to_dl1__data(mem_to_dl1__data),
    .mem_to_dl1__credit(mem_to_dl1__credit)
);

//==============================
// l2__cache
//==============================
l2 l2__cache
(
    .clk(clk),
    .rst(rst),
    .il1_to_mem__valid(il1_to_mem__valid),
    .il1_to_mem__data(il1_to_mem__data),
    .il1_to_mem__credit(il1_to_mem__credit), 
    .mem_to_il1__valid(mem_to_il1__valid),
    .mem_to_il1__data(mem_to_il1__data),
    .mem_to_il1__credit(mem_to_il1__credit),
    .dl1_to_mem__valid(dl1_to_mem__valid),
    .dl1_to_mem__data(dl1_to_mem__data),
    .dl1_to_mem__credit(dl1_to_mem__credit), 
    .mem_to_dl1__valid(mem_to_dl1__valid),
    .mem_to_dl1__data(mem_to_dl1__data),
    .mem_to_dl1__credit(mem_to_dl1__credit),
    .mem__addr(mem__addr),
    .mem__rw(mem__rw),
    .mem__wr_data(mem__wr_data),
    .mem__rd_data(mem__rd_data)
);

//==============================================
// mem
//==============================================
memory #(.WIDTH(64), .DEPTH(4096), .DEPTH__LOG2(12)) mem
(
    .clk(clk),
    .rst(rst),
    .addr(mem__addr[11:0]),
    .rw(1'b0),
    .wr_data(mem__wr_data),
    .rd_data(mem__rd_data)
);



endmodule
