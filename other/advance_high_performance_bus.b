//==============================================
// advance_high_performance_bus
//==============================================
module advance_high_performance_bus
(
    input hclk,
    input hresetn,
    output logic ahb_slave_to_device__0__cs,
    input ahb_slave_to_device__0__ready,
    output logic ahb_slave_to_device__0__we,
    output logic [39:0] ahb_slave_to_device__0__addr,
    output logic [2:0] ahb_slave_to_device__0__size,
    output logic [63:0] ahb_slave_to_device__0__wr_data,
    input ahb_slave_to_device__0__error,
    input ahb_slave_to_device__0__rd_data
);

logic [39:0] haddr;
logic hwrite;
logic [2:0] hsize;
logic [2:0] hburst;
logic [3:0] hprot;
logic [1:0] htrans;
logic hmastlock;
logic [63:0] hwdata;
hready;
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

//==============================================
// decoder
//==============================================
advance_high_performance_bus__decoder decoder
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
advance_high_performance_bus__multiplexor multiplexor
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
// slave__default
//==============================
advance_high_performance_bus__slave slave__default 
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
    .hrdata(hrdata__default),
    .ahb_slave_to_device__cs(),
    .ahb_slave_to_device__we(),
    .ahb_slave_to_device__addr(),
    .ahb_slave_to_device__size(),
    .ahb_slave_to_device__wr_data(),
    .ahb_slave_to_device__error(1'b0),
    .ahb_slave_to_device__rd_data()
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
    .ahb_slave_to_device__cs(ahb_slave_to_device__0__cs),
    .ahb_slave_to_device__ready(ahb_slave_to_device__0__ready),
    .ahb_slave_to_device__we(ahb_slave_to_device__0__we),
    .ahb_slave_to_device__addr(ahb_slave_to_device__0__addr),
    .ahb_slave_to_device__size(ahb_slave_to_device__0__size),
    .ahb_slave_to_device__wr_data(ahb_slave_to_device__0__wr_data),
    .ahb_slave_to_device__error(ahb_slave_to_device__0__error),
    .ahb_slave_to_device__rd_data(ahb_slave_to_device__0__rd_data)
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
    .ahb_slave_to_device__cs(ahb_slave_to_device__1__cs),
    .ahb_slave_to_device__ready(ahb_slave_to_device__1__ready),
    .ahb_slave_to_device__we(ahb_slave_to_device__1__we),
    .ahb_slave_to_device__addr(ahb_slave_to_device__1__addr),
    .ahb_slave_to_device__size(ahb_slave_to_device__1__size),
    .ahb_slave_to_device__wr_data(ahb_slave_to_device__1__wr_data),
    .ahb_slave_to_device__error(ahb_slave_to_device__1__error),
    .ahb_slave_to_device__rd_data(ahb_slave_to_device__1__rd_data)
);






endmodule

