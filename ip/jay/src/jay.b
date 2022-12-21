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
logic cpu_to_mem__we;
logic [63:0] cpu_to_mem__addr;
logic [2:0] cpu_to_mem__dtype;
logic [63:0] cpu_to_mem__data;
logic mem_to_cpu__valid;
logic mem_to_cpu__error;
logic [63:0] mem_to_cpu__data;
logic context__0__eip;
logic tip;

logic ahb_slave_to_device__0__cs;
logic ahb_slave_to_device__0__ready;
logic ahb_slave_to_device__0__we;
logic [39:0] ahb_slave_to_device__0__addr;
logic [2:0] ahb_slave_to_device__0__size;
logic [63:0] ahb_slave_to_device__0__wr_data;
logic ahb_slave_to_device__0__error;
logic ahb_slave_to_device__0__rd_data;

logic ahb_slave_to_device__1__cs;
logic ahb_slave_to_device__1__ready;
logic ahb_slave_to_device__1__we;
logic [39:0] ahb_slave_to_device__1__addr;
logic [2:0] ahb_slave_to_device__1__size;
logic [63:0] ahb_slave_to_device__1__wr_data;
logic ahb_slave_to_device__1__error;
logic ahb_slave_to_device__1__rd_data;



//==============================
// cpu 
//==============================
central_processing_unit cpu 
(
    .clk(clk),
    .rst(rst),
    .cpu_to_mem__valid(cpu_to_mem__valid),
    .cpu_to_mem__we(cpu_to_mem__we),
    .cpu_to_mem__addr(cpu_to_mem__addr),
    .cpu_to_mem__dtype(cpu_to_mem__dtype),
    .cpu_to_mem__data(cpu_to_mem__data),
    .mem_to_cpu__valid(mem_to_cpu__valid),
    .mem_to_cpu__error(mem_to_cpu__error),
    .mem_to_cpu__data(mem_to_cpu__data)
    .eip(context__0__eip),
    .tip(tip)
);

//==============================================
// ahb 
//==============================================
advance_high_performance_bus ahb
(
    .hclk(clk),
    .hresetn(~rst),
    .ahb_slave_to_device__0__cs(ahb_slave_to_device__0__cs),
    .ahb_slave_to_device__0__ready(ahb_slave_to_device__0__ready),
    .ahb_slave_to_device__0__we(ahb_slave_to_device__0__we),
    .ahb_slave_to_device__0__addr(ahb_slave_to_device__0__addr),
    .ahb_slave_to_device__0__size(ahb_slave_to_device__0__size),
    .ahb_slave_to_device__0__wr_data(ahb_slave_to_device__0__wr_data),
    .ahb_slave_to_device__0__error(ahb_slave_to_device__0__error),
    .ahb_slave_to_device__0__rd_data(ahb_slave_to_device__0__rd_data)
);


//==============================
// memory_management_unit 
//==============================
memory_management_unit mmu
(
    .clk(clk),
    .rst(rst),
    .cpu_to_mem__valid(cpu_to_mem__valid),
    .cpu_to_mem__we(cpu_to_mem__we),
    .cpu_to_mem__addr(cpu_to_mem__addr),
    .cpu_to_mem__dtype(cpu_to_mem__dtype),
    .cpu_to_mem__data(cpu_to_mem__data),
    .mem_to_cpu__valid(mem_to_cpu__valid),
    .mem_to_cpu__error(mem_to_cpu__error),
    .mem_to_cpu__data(mem_to_cpu__data),
);

//==============================================
// platform_level_interrupt_controller 
//==============================================
platform_level_interrupt_controller plic
(
    .clk(clk),
    .rst(rst),
    .cs(ahb_slave_to_device__0__cs),
    .we(ahb_slave_to_device__0__we),
    .addr(ahb_slave_to_device__0__addr[25:0]),
    .wr_data(ahb_slave_to_device__0__wr_data[31:0]),
    .rd_data(ahb_slave_to_device__0__rd_data[31:0]),
    .is__0(is__0),
    .is__1(is__0),
    .context__0__eip(context__0__eip)
);

assign ahb_slave_to_device__0__error = 1'b0;


//==============================================
// machine_timer_registers
//==============================================
machine_timer_registers mtr 
(
    .clk(clk),
    .rst(rst),
    .cs(ahb_slave_to_device__1__cs),
    .we(ahb_slave_to_device__1__we),
    .addr(ahb_slave_to_device__1__addr[0]),
    .wr_data(ahb_slave_to_device__1__wr_data),
    .rd_data(ahb_slave_to_device__1__rd_data),
    .tip(tip)
);

assign ahb_slave_to_device__1__error = 1'b0;

//==============================
// physical_memory_attribute_registers
//==============================
physical_memory_attribute_registers pmar 
(   
    .clk(clk),
    .rst(rst),
    .addr(addr[2:0]),
    .rd_data(),
)

endmodule
