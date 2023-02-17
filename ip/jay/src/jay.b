//==============================================
// jay 
//==============================================
module jay 
(
    clk,
    rst
);

input clk;
input rst;

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

logic irq__0;
logic irq__1;
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

logic cs__0;
logic we__0;
logic [39:0] addr__0;
logic [2:0] size__0;
logic [63:0] wr_data__0;
logic [63:0] rd_data__0;

logic cs__1;
logic we__1;
logic [39:0] addr__1;
logic [2:0] size__1;
logic [63:0] wr_data__1;
logic [63:0] rd_data__1;

logic cs__2;
logic we__2;
logic [39:0] addr__2;
logic [2:0] size__2;
logic [63:0] wr_data__2;
logic [63:0] rd_data__2;

logic cs__3;
logic we__3;
logic [39:0] addr__3;
logic [2:0] size__3;
logic [63:0] wr_data__3;
logic [63:0] rd_data__3;


//==============================
// central_processing_unit__0
//==============================
central_processing_unit central_processing_unit__0 
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
memory_management_unit memory_management_unit__0
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
platform_level_interrupt_controller platform_level_interrupt_controller__0
(
    .clk(clk),
    .rst(rst),
    .cs(cs__0),
    .we(we__0),
    .addr(addr__0[25:0]),
    .wr_data(wr_data__0[31:0]),
    .rd_data(rd_data__0[31:0]),
    .irq__0(irq__0),
    .irq__1(irq__1),
    .context__0__eip(context__0__eip)
);

//==============================================
// machine_timer_registers__0 
//==============================================
machine_timer_registers machine_timer_registers__0 
(
    .clk(clk),
    .rst(rst),
    .cs(cs__1),
    .we(we__1),
    .addr(addr__1[0]),
    .wr_data(wr_data__1),
    .rd_data(rd_data__1),
    .tip(tip)
);

//==============================
// physical_memory_attribute_registers__0
//==============================
physical_memory_attribute_registers physical_memory_attribute_registers__0
(   
    .clk(clk),
    .rst(rst),
    .cs(cs__2),
    .we(we__2)
    .addr(addr__2[2:0]),
    .wr_data(wr_data__2),
    .rd_data(rd_data__2),
    .pmar__0(pmar__0),
    .pmar__1(pmar__1),
    .pmar__2(pmar__2),
    .pmar__3(pmar__3),
    .pmar__4(pmar__4),
    .pmar__5(pmar__5),
    .pmar__6(pmar__6),
    .pmar__7(pmar__7)
);

//==============================
// advanced_high_performance_bus__0
//==============================
advanced_high_performance_bus advanced_high_performance_bus__0
(
    .hclk(clk),
    .hresetn(~rst),
    .cs__0(cs__0),
    .we__0(we__0),
    .addr__0(addr__0),
    .size__0(size__0),
    .wr_data__0(wr_data__0),
    .rd_data__0(rd_data__0),
    .cs__1(cs__1),
    .we__1(we__1),
    .addr__1(addr__1),
    .size__1(size__1),
    .wr_data__1(wr_data__1),
    .rd_data__1(rd_data__1),
    .cs__2(cs__2),
    .we__2(we__2),
    .addr__2(addr__2),
    .size__2(size__2),
    .wr_data__2(wr_data__2),
    .rd_data__2(rd_data__2),
    .cs__3(cs__3),
    .we__3(we__3),
    .addr__3(addr__3),
    .size__3(size__3),
    .wr_data__3(wr_data__3),
    .rd_data__3(rd_data__3)
);


















//==============================================
// advanced_high_performance_bus__decoder__0
//==============================================
advanced_high_performance_bus__decoder advanced_high_performance_bus__decoder__0
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
// advanced_high_performance_bus__multiplexor__0
//==============================
advanced_high_performance_bus__multiplexor advanced_high_performance_bus__multiplexor__0
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

//==============================================                                                                                                          
// advance_high_performance_bus__master__0
//==============================================
advance_high_performance_bus__master advance_high_performance_bus__master__0
(
    .hclk(hclk),
    .hresetn(hresetn),
    .haddr(haddr),
    .hwrite(hwrite),
    .hsize(hsize),
    .hburst(hburst),
    .hprot(hprot),
    .htrans(htrans),
    .hmastlock(hmastlock),
    .hwdata(hwdata),
    .hready(hready),
    .hresp(hresp),
    .hrdata(hrdata),
    .device_to_ahb_master__valid(device_to_ahb_master__valid),
    .device_to_ahb_master__we(device_to_ahb_master__we),
    .device_to_ahb_master__addr(device_to_ahb_master__addr),
    .device_to_ahb_master__size(device_to_ahb_master__size),
    .device_to_ahb_master__data(device_to_ahb_master__data),
    .ahb_master_to_device__valid(ahb_master_to_device__valid),
    .ahb_master_to_device__error(ahb_master_to_device__error),
    .ahb_master_to_device__data(ahb_master_to_device__data)
);

//==============================
// advanced_high_performance_bus__default_slave__0
//==============================
advanced_high_performance_bus__default_slave advanced_high_performance_bus__default_slave__0
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
// advance_high_performance_bus__slave__0
//==============================
advance_high_performance_bus__slave advance_high_performance_bus__slave__0
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
    .cs(cs__0),
    .we(we__0),
    .addr(addr__0),
    .size(size__0),
    .wr_data(wr_data__0),
    .rd_data(rd_data__0)
);

//==============================
// advance_high_performance_bus__slave__1
//==============================
advance_high_performance_bus__slave advance_high_performance_bus__slave__1
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
    .cs(cs__1),
    .we(we__1),
    .addr(addr__1),
    .size(size__1),
    .wr_data(wr_data__1),
    .rd_data(rd_data__1)
);

//==============================
// advance_high_performance_bus__slave__2
//==============================
advance_high_performance_bus__slave advance_high_performance_bus__slave__2
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
    .cs(cs__2),
    .we(we__2),
    .addr(addr__2),
    .size(size__2),
    .wr_data(wr_data__2),
    .rd_data(rd_data__2)
);


endmodule

