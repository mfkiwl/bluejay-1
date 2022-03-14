//==============================================
// top
//==============================================
module top
(
    input clk,
    input rst
);

// cpu_to_il1
logic cpu_to_il1__valid;
logic cpu_to_il1__ready;
logic cpu_to_il1__rw;
logic [63:0] cpu_to_il1__addr;
logic [63:0] cpu_to_il1__data;
logic [1:0] cpu_to_il1__size;
// il1_to_cpu
logic il1_to_cpu__valid;
logic il1_to_cpu__ready;
logic [63:0] il1_to_cpu__addr;
logic [63:0] il1_to_cpu__data;

// il1_to_mem
logic il1_to_mem__valid;
logic il1_to_mem__rw;
logic [63:0] il1_to_mem__addr;
logic [511:0] il1_to_mem__wr_data;
logic [511:0] il1_to_mem__rd_data;
// mem_to_il1
// logic mem_to_il1__valid;
// logic mem_to_il1__ready;
// logic [511:0] mem_to_il1__data;

//==============================
// cpu
//==============================
central_processing_unit cpu
(
    .clk(clk),
    .rst(rst),
    .cpu_to_il1__valid(cpu_to_il1__valid),
    .cpu_to_il1__ready(cpu_to_il1__ready),
    .cpu_to_il1__rw(cpu_to_il1__rw),
    .cpu_to_il1__addr(cpu_to_il1__addr),
    .cpu_to_il1__data(cpu_to_il1__data),
    .cpu_to_il1__size(cpu_to_il1__size),
    .il1_to_cpu__valid(il1_to_cpu__valid),
    .il1_to_cpu__ready(il1_to_cpu__ready),
    .il1_to_cpu__data(il1_to_cpu__data) 
);

//==============================
// il1
//==============================
l1_cache il1
(
    .clk(clk),
    .rst(rst),
    .cpu_to_l1__valid(cpu_to_il1__valid),
    .cpu_to_l1__ready(cpu_to_il1__ready),
    .cpu_to_l1__rw(cpu_to_il1__rw),
    .cpu_to_l1__addr(cpu_to_il1__addr),
    .cpu_to_l1__data(cpu_to_il1__data),
    .cpu_to_l1__size(cpu_to_il1__size),
    .l1_to_cpu__valid(il1_to_cpu__valid),
    .l1_to_cpu__ready(il1_to_cpu__ready),
    .l1_to_cpu__addr(il1_to_cpu__addr),
    .l1_to_cpu__data(il1_to_cpu__data),
    .l1_to_mem__valid(il1_to_mem__valid),
    .l1_to_mem__rw(il1_to_mem__rw),
    .l1_to_mem__addr(il1_to_mem__addr),
    .l1_to_mem__wr_data(il1_to_mem__wr_data),
    .l1_to_mem__rd_data(il1_to_mem__rd_data)
);



endmodule;