//==============================================
// bus 
//==============================================
module bus 
(
    input clk,
    input rst,
PYTHON
(
    for i in range(8):
        print(f"    output logic cs__{i},")
        print(f"    output logic we__{i},")
        print(f"    output logic [39:0] addr__{i},")
        print(f"    output logic [1:0] size__{i},")
        print(f"    output logic [63:0] wr_data__{i},")
        print(f"    input ready__{i},")
        print(f"    input resp__{i},")
        print(f"    input [63:0] rd_data__{i},")
        print(f"    input [7:0] pma__{i},")
)
    input cs,
    input we,
    input [63:0] addr,
    input [1:0] size,
    input [63:0] wr_data,
    output logic ready,
    output logic resp,
    output logic [63:0] rd_data
);


//==============================
// bus__decoder 
//==============================
bus__decoder decoder 
(
    .clk(clk),
    .rst(rst),
PYTHON
(
    for i in range(8):
        print(f"    .cs__{i}(int__cs__{i}),")
        print(f"    .we__{i}(int__we__{i}),")
        print(f"    .addr__{i}(int__addr__{i}),")
        print(f"    .size__{i}(int__size__{i}),")
        print(f"    .wr_data__{i}(int__wr_data__{i}),")
        print(f"    .ready__{i}(int__ready__{i}),")
        print(f"    .resp__{i}(int__resp__{i}),")
        print(f"    .rd_data__{i}(int__rd_data__{i}),")
        print(f"    .pma__{i}(pma__{i}),")
)
    .cs(int__cs),
    .we(int__we),
    .addr(int__addr),
    .size(int__size),
    .wr_data(int__wr_data),
    .ready(int__ready),
    .resp(int__resp),
    .rd_data(int__rd_data)
);

//==============================
// bus__receiver
//==============================
bus__receiver receiver 
(
    
    .clk(clk),
    .rst(rst),
    .a__cs(cs),
    .a__we(we),
    .a__addr(addr),
    .a__size(size),
    .a__wr_data(wr_data),
    .a__ready(ready),
    .a__resp(resp),
    .a__rd_data(rd_data)
    .b__cs(int__cs),
    .b__we(int__we),
    .b__addr(int__addr),
    .b__size(int__size),
    .b__wr_data(int__wr_data),
    .b__ready(int__ready),
    .b__resp(int__resp),
    .b__rd_data(int__rd_data)
);

//==============================
// bus__receiver
//==============================
bus__receiver receiver__0
(
    .clk(clk),
    .rst(rst),
    .a__cs(int__cs__0),
    .a__we(int__we__0),
    .a__addr(int__addr__0),
    .a__size(int__size__0),
    .a__wr_data(int__wr_data__0),
    .a__ready(int__ready__0),
    .a__resp(int__resp__0),
    .a__rd_data(int__rd_data__0)
    .b__cs(cs__0),
    .b__we(we__0),
    .b__addr(addr__0),
    .b__size(size__0),
    .b__wr_data(wr_data__0),
    .b__ready(ready__0),
    .b__resp(resp__0),
    .b__rd_data(rd_data__0)
);


endmodule

