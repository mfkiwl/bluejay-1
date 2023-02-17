//==============================================
// advanced_high_performance_bus
//==============================================
module advanced_high_performance_bus
(
    hclk,
    hresetn,
    cs__0,
    we__0,
    addr__0,
    size__0,
    wr_data__0,
    rd_data__0,
    cs__1,
    we__1,
    addr__1,
    size__1,
    wr_data__1,
    rd_data__1,
    cs__2,
    we__2,
    addr__2,
    size__2,
    wr_data__2,
    rd_data__2,
    cs__3,
    we__3,
    addr__3,
    size__3,
    wr_data__3,
    rd_data__3
);

input hclk;
input hresetn;

output cs__0;
output we__0;
output [39:0] addr__0;
output [2:0] size__0;
output [63:0] wr_data__0;
input [63:0] rd_data__0;

output cs__1;
output we__1;
output [39:0] addr__1;
output [2:0] size__1;
output [63:0] wr_data__1;
input [63:0] rd_data__1;

output cs__2;
output we__2;
output [39:0] addr__2;
output [2:0] size__2;
output [63:0] wr_data__2;
input [63:0] rd_data__2;

output cs__3;
output we__3;
output [39:0] addr__3;
output [2:0] size__3;
output [63:0] wr_data__3;
input [63:0] rd_data__3;



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
    .hsel__3(hsel__3)
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

//==============================================                                                                                                          
// master 
//==============================================
advance_high_performance_bus__master master 
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
// slave__default
//==============================
advanced_high_performance_bus__default_slave slave__default 
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
// slave__0
//==============================
advance_high_performance_bus__slave slave__0 
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
// slave__1 
//==============================
advance_high_performance_bus__slave slave__1
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
// slave__2
//==============================
advance_high_performance_bus__slave slave__2 
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

//==============================
// slave__3
//==============================
advance_high_performance_bus__slave slave__3
(
    .hclk(hclk),
    .hresetn(hresetn),                                                                                                                                    
    .hsel(hsel__3),
    .haddr(haddr),
    .hwrite(hwrite),
    .hsize(hsize),
    .hburst(hburst),
    .hprot(hprot),
    .htrans(htrans),
    .hmastlock(hmastlock),
    .hwdata(hwdata),
    .hready(hready),
    .hresp(hresp__3),
    .hreadyout(hreadyout__3),
    .hrdata(hrdata__3),
    .cs(cs__3),
    .we(we__3),
    .addr(addr__3),
    .size(size__3),
    .wr_data(wr_data__3),
    .rd_data(rd_data__3)
);


endmodule

