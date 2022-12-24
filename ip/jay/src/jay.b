//==============================================
// jay 
//==============================================
module jay 
(
    input clk,
    input rst,
);


logic hclk;
logic hresetn;
logic [39:0] haddr;
logic hwrite;
logic [2:0] hsize;
logic [2:0] hburst;
logic [3:0] hprot;
logic [1:0] htrans;
logic hmastlock;
logic [63:0] hwdata;
logic hready;
logic hresp;
logic hreadyout;
logic [63:0] hrdata;
logic hsel__default;
logic hresp__default;
logic hreadyout__default;
logic hsel__0;
logic hresp__0;
logic hreadyout__0;
logic hsel__1;
logic hresp__1;
logic hreadyout__1;

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

logic is__0;
logic is__1;
logic context__0__eip;

logic tip;

logic [7:0] pmar__0;
logic [7:0] pmar__1;
logic [7:0] pmar__2;
logic [7:0] pmar__3;
logic [7:0] pmar__4;
logic [7:0] pmar__5;
logic [7:0] pmar__6;
logic [7:0] pmar__7;

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

logic ahb_slave_to_device__2__cs;
logic ahb_slave_to_device__2__ready;
logic ahb_slave_to_device__2__we;
logic [39:0] ahb_slave_to_device__2__addr;
logic [2:0] ahb_slave_to_device__2__size;
logic [63:0] ahb_slave_to_device__2__wr_data;
logic ahb_slave_to_device__2__error;
logic ahb_slave_to_device__2__rd_data;

logic ahb_slave_to_device__3__cs;
logic ahb_slave_to_device__3__ready;
logic ahb_slave_to_device__3__we;
logic [39:0] ahb_slave_to_device__3__addr;
logic [2:0] ahb_slave_to_device__3__size;
logic [63:0] ahb_slave_to_device__3__wr_data;
logic ahb_slave_to_device__3__error;
logic ahb_slave_to_device__3__rd_data;


assign hclk = clk;
assign hresetn = ~rst;

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
    .device_to_ahb_master__valid(device_to_ahb_master__valid),
    .device_to_ahb_master__we(device_to_ahb_master__we),
    .device_to_ahb_master__addr(device_to_ahb_master__addr),
    .device_to_ahb_master__size(device_to_ahb_master__size),
    .device_to_ahb_master__data(device_to_ahb_master__data),
    .ahb_master_to_device__valid(ahb_master_to_device__valid),
    .ahb_master_to_device__error(ahb_master_to_device__error),
    .ahb_master_to_device__data(ahb_master_to_device__data),
    .pmar__0(pmar__0),
    .pmar__1(pmar__1),
    .pmar__2(pmar__2),
    .pmar__3(pmar__3),
    .pmar__4(pmar__4),
    .pmar__5(pmar__5),
    .pmar__6(pmar__6),
    .pmar__7(pmar__7)
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

//==============================
// physical_memory_attribute_registers
//==============================
physical_memory_attribute_registers pma_registers
(   
    .clk(clk),
    .rst(rst),
    .cs(ahb_slave_to_device__2__cs),
    .we(ahb_slave_to_device__2__we)
    .addr(ahb_slave_to_device__2__addr[2:0]),
    .wr_data(ahb_slave_to_device__2__wr_data),
    .rd_data(ahb_slave_to_device__2__rd_data),
    .pmar__0(pmar__0),
    .pmar__1(pmar__1),
    .pmar__2(pmar__2),
    .pmar__3(pmar__3),
    .pmar__4(pmar__4),
    .pmar__5(pmar__5),
    .pmar__6(pmar__6),
    .pmar__7(pmar__7)
);


//==============================================
// ahb__decoder
//==============================================
advanced_high_performance_bus__decoder ahb__decoder
(
    .hclk(hclk),
    .hresetn(hresetn),
    .haddr(haddr),
    .hsel__default(hsel__default),
    .hsel__0(hsel__0),
    .hsel__1(hsel__1),
    .hsel__2(hsel__2),
    .hsel__1(hsel__3)
);

//==============================
// ahb__multiplexor
//==============================
advanced_high_performance_bus__multiplexor ahb__multiplexor
(
    .hclk(hclk),
    .hresetn(hresetn),
    .hrdata(hrdata),
    .hresp(hresp),
    .hready(hready),
    .hsel__default(hsel__default),
    .hrdata__default(hrdata__default),
    .hresp__default(hresp__default),
    .hreadyout__default(hreadyout__default),
    .hsel__0(hsel__0),
    .hrdata__0(hrdata__0),
    .hresp__0(hresp__0),
    .hreadyout__0(hreadyout__0),
    .hsel__1(hsel__1),
    .hrdata__1(hrdata__1),
    .hresp__1(hresp__1),
    .hreadyout__1(hreadyout__1),
    .hsel__2(hsel__2),
    .hrdata__2(hrdata__2),
    .hresp__2(hresp__2),
    .hreadyout__2(hreadyout__2),
    .hsel__3(hsel__3),
    .hrdata__3(hrdata__3),
    .hresp__3(hresp__3),
    .hreadyout__3(hreadyout__3)
);

//==============================
// ahb__default_slave 
//==============================
advanced_high_performance_bus__default_slave ahb__default_slave 
(
    .hclk(hclk),
    .hresetn(hresetn),
    .hsel(hsel__default),
    .haddr(haddr),
    .hwrite(hwrite),
    .hsize(hsize),
    .hburst(hburst),
    .hprot(hprot),
    .htrans(htrans),
    .hmastlock(hmastlock),
    .hwdata(hwdata),
    .hready(hready),
    .hresp(hresp__default),
    .hreadyout(hreadyout__default),
    .hrdata(hrdata__default)
);

//==============================
// ahb__slave__0
//==============================
advance_high_performance_bus__slave ahb__slave__0
(
    .hclk(hclk),
    .hresetn(hresetn),                                                                                                                                    
    .hsel(hsel__0),
    .haddr(haddr),
    .hwrite(hwrite),
    .hsize(hsize),
    .hburst(hburst),
    .hprot(hprot),
    .htrans(htrans),
    .hmastlock(hmastlock),
    .hwdata(hwdata),
    .hready(hready),
    .hresp(hresp__0),
    .hreadyout(hreadyout__0),
    .hrdata(hrdata__0),
    .ahb_slave_to_device__cs(ahb_slave_to_device__0__cs),
    .ahb_slave_to_device__ready(ahb_slave_to_device__0__ready),
    .ahb_slave_to_device__we(ahb_slave_to_device__0__we),
    .ahb_slave_to_device__addr(ahb_slave_to_device__0__addr),
    .ahb_slave_to_device__size(ahb_slave_to_device__0__size),
    .ahb_slave_to_device__wr_data(ahb_slave_to_device__0__wr_data),
    .ahb_slave_to_device__rd_data(ahb_slave_to_device__0__rd_data)
);

//==============================
// ahb__slave__1
//==============================
advance_high_performance_bus__slave ahb__slave__1
(
    .hclk(hclk),
    .hresetn(hresetn),                                                                                                                                    
    .hsel(hsel__1),
    .haddr(haddr),
    .hwrite(hwrite),
    .hsize(hsize),
    .hburst(hburst),
    .hprot(hprot),
    .htrans(htrans),
    .hmastlock(hmastlock),
    .hwdata(hwdata),
    .hready(hready),
    .hresp(hresp__1),
    .hreadyout(hreadyout__1),
    .hrdata(hrdata__1),
    .ahb_slave_to_device__cs(ahb_slave_to_device__1__cs),
    .ahb_slave_to_device__ready(ahb_slave_to_device__1__ready),
    .ahb_slave_to_device__we(ahb_slave_to_device__1__we),
    .ahb_slave_to_device__addr(ahb_slave_to_device__1__addr),
    .ahb_slave_to_device__size(ahb_slave_to_device__1__size),
    .ahb_slave_to_device__wr_data(ahb_slave_to_device__1__wr_data),
    .ahb_slave_to_device__rd_data(ahb_slave_to_device__1__rd_data)
);

//==============================
// ahb__slave__2
//==============================
advance_high_performance_bus__slave ahb__slave__2
(
    .hclk(hclk),
    .hresetn(hresetn),                                                                                                                                    
    .hsel(hsel__2),
    .haddr(haddr),
    .hwrite(hwrite),
    .hsize(hsize),
    .hburst(hburst),
    .hprot(hprot),
    .htrans(htrans),
    .hmastlock(hmastlock),
    .hwdata(hwdata),
    .hready(hready),
    .hresp(hresp__2),
    .hreadyout(hreadyout__2),
    .hrdata(hrdata__2),
    .ahb_slave_to_device__cs(ahb_slave_to_device__2__cs),
    .ahb_slave_to_device__ready(ahb_slave_to_device__2__ready),
    .ahb_slave_to_device__we(ahb_slave_to_device__2__we),
    .ahb_slave_to_device__addr(ahb_slave_to_device__2__addr),
    .ahb_slave_to_device__size(ahb_slave_to_device__2__size),
    .ahb_slave_to_device__wr_data(ahb_slave_to_device__2__wr_data),
    .ahb_slave_to_device__rd_data(ahb_slave_to_device__2__rd_data)
);


endmodule

