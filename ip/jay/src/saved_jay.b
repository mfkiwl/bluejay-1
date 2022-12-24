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
// decoder
//==============================================
advanced_high_performance_bus__decoder decoder
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
// multiplexor
//==============================
advanced_high_performance_bus__multiplexor multiplexor
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
// default_slave
//==============================
advanced_high_performance_bus__default_slave default_slave 
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
// platform_level_interrupt_controller__ahb_slave
//==============================
platform_level_interrupt_controller__ahb_slave plic_slave
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
    .is__0(is__0),
    .is__1(is__1),
    .context__0__eip(context__0__eip)
);

//==============================
// machine_timer_registers__ahb_slave
//==============================
machine_timer_registers__ahb_slave mtr_slave
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
    .tip(tip)
);

//==============================
// physical_memory_attribute_registers__ahb_slave
//==============================
physical_memory_attribute_registers__ahb_slave pmar_slave
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
//  
//==============================
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
    .tip(tip)
);


endmodule

