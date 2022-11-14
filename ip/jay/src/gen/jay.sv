//==============================================
// jay
//==============================================
module jay
(
    input clk,
    input rst,
    output logic [7:0] port__0
);


//==============================================
// Logic 
//==============================================
logic clk;
logic rst;

logic cpu_to_mem__valid;
logic cpu_to_mem__ready;
logic cpu_to_mem__we;
logic [63:0] cpu_to_mem__addr;
logic [2:0] cpu_to_mem__dtype;
logic [63:0] cpu_to_mem__data;
logic mem_to_cpu__valid;
logic mem_to_cpu__ready;
logic mem_to_cpu__error;
logic [63:0] mem_to_cpu__data;


//==============================
// cpu 
//==============================
central_processing_unit cpu 
(
    .clk(clk),
    .rst(rst),
    .cpu_to_mem__valid(cpu_to_mem__valid),
    .cpu_to_mem__ready(cpu_to_mem__ready),
    .cpu_to_mem__we(cpu_to_mem__we),
    .cpu_to_mem__addr(cpu_to_mem__addr),
    .cpu_to_mem__dtype(cpu_to_mem__dtype),
    .cpu_to_mem__data(cpu_to_mem__data),
    .mem_to_cpu__valid(mem_to_cpu__valid),
    .mem_to_cpu__ready(mem_to_cpu__ready),
    .mem_to_cpu__error(mem_to_cpu__error),
    .mem_to_cpu__data(mem_to_cpu__data)
);

//==============================
// memory_management_unit 
//==============================
memory_management_unit mmu
(
    .clk(clk),
    .rst(rst),
    .cpu_to_mem__valid(cpu_to_mem__valid),
    .cpu_to_mem__ready(cpu_to_mem__ready),
    .cpu_to_mem__we(cpu_to_mem__we),
    .cpu_to_mem__addr(cpu_to_mem__addr),
    .cpu_to_mem__dtype(cpu_to_mem__dtype),
    .cpu_to_mem__data(cpu_to_mem__data),
    .mem_to_cpu__valid(mem_to_cpu__valid),
    .mem_to_cpu__ready(mem_to_cpu__ready),
    .mem_to_cpu__error(mem_to_cpu__error),
    .mem_to_cpu__data(mem_to_cpu__data),
    .port__0(port__0)
);

endmodule
