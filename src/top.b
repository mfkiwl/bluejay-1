//==============================================
// top
//==============================================
module top
(
    input clk,
    input rst,
);

logic il1_to_mem__valid;
logic il1_to_mem__ready;
logic il1_to_mem__rw;
logic [63:0] il1_to_mem__addr;
logic [511:0] il1_to_mem__data;
logic mem_to_il1__valid;
logic mem_to_il1__ready;
logic [511:0] mem_to_il1__data;

//==============================
// cpu
//==============================
central_processing_unit cpu
(
    .clk(clk),
    .rst(rst),
    .IF__pc(IF__pc),
    .IF__ir(IF__ir)
);

//==============================
// instr_cache
//==============================
l1_cache instr_cache
(
    .clk(clk),
    .rst(rst),
    .cpu_to_l1__valid(cpu_to_il1__valid),
    .cpu_to_l1__ready(IF__cpu_to_il1__ready),
    .cpu_to_l1__rw(IF__cpu_to_instr_cache__rw),
    .cpu_to_l1__addr(IF__cpu_to_instr_cache__addr),
    .cpu_to_l1__data(IF__cpu_to_instr_cache__data),
    .cpu_to_l1__size(IF__cpu_to_instr_cache__size),
    .l1_to_cpu__valid(IF__instr_cache_to_cpu__valid),
    .l1_to_cpu__ready(IF__instr_cache_to_cpu__ready),
    .l1_to_cpu__data(IF__instr_cache_to_cpu__data),
    .l1_to_mem__valid(IF__instr_cache_to_mem__valid),
    .l1_to_mem__ready(IF__instr_cache_to_mem__ready),
    .l1_to_mem__rw(IF__instr_cache_to_mem__rw),
    .l1_to_mem__addr(IF__instr_cache_to_mem__addr),
    .l1_to_mem__data(IF__instr_cache_to_mem__data),
    .mem_to_l1__valid(IF__mem_to_instr_cache__valid),
    .mem_to_l1__ready(IF__mem_to_instr_cache__ready),
    .mem_to_l1__data(IF__mem_to_instr_cache__data)
);



endmodule;