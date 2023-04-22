//==============================================
// bus 
//==============================================
module bus 
(
    input clk,
    input rst,
    input [7:0] pma__0,
    input [7:0] pma__1,
    input [7:0] pma__2,
    input [7:0] pma__3,
    input [7:0] pma__4,
    input [7:0] pma__5,
    input [7:0] pma__6,
    input [7:0] pma__7,
PYTHON
(
    for i in range(8):
        print(f"    output logic cs__{i},")
        print(f"    output logic we__{i},")
        print(f"    output logic [63:0] addr__{i},")
        print(f"    output logic [1:0] size__{i},")
        print(f"    output logic [63:0] wr_data__{i},")
        print(f"    input ready__{i},")
        print(f"    input resp__{i},")
        print(f"    input [63:0] rd_data__{i},")
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


logic [2:0] sel;


logic cs__x;
logic ready__x;
logic resp__x;
logic [63:0] rd_data__x;

logic cs__y;
logic ready__y;
logic [63:0] rd_data__y;

logic [7:0] pma;
logic [1:0] status;


assign cs__x = cs;
assign ready = ready__x;
assign resp = resp__x;
assign rd_data = rd_data__x;

assign we__0 = we; 
assign we__1 = we; 
assign we__2 = we; 
assign we__3 = we; 
assign we__4 = we; 
assign we__5 = we; 
assign we__6 = we; 
assign we__7 = we; 

assign addr__0 = addr;
assign addr__1 = addr;
assign addr__2 = addr;
assign addr__3 = addr;
assign addr__4 = addr;
assign addr__5 = addr;
assign addr__6 = addr;
assign addr__7 = addr;

assign size__0 = size;
assign size__1 = size;
assign size__2 = size;
assign size__3 = size;
assign size__4 = size;
assign size__5 = size;
assign size__6 = size;
assign size__7 = size;

assign wr_data__0 = wr_data;
assign wr_data__1 = wr_data;
assign wr_data__2 = wr_data;
assign wr_data__3 = wr_data;
assign wr_data__4 = wr_data;
assign wr_data__5 = wr_data;
assign wr_data__6 = wr_data;
assign wr_data__7 = wr_data;

//==============================================
// decoder
//==============================================
bus__decoder decoder
(
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .sel(sel)
);


//==============================================
// physical_memory_attribute_multiplexer
//==============================================
bus__physical_memory_attribute_multiplexer physical_memory_attribute_multiplexer
(
    .clk(clk),
    .rst(rst),
    .sel(sel),
    .pma__0(pma__0),
    .pma__1(pma__1),
    .pma__2(pma__2),
    .pma__3(pma__3),
    .pma__4(pma__4),
    .pma__5(pma__5),
    .pma__6(pma__6),
    .pma__7(pma__7),
    .pma(pma)
);

//==============================================
// physical_memory_attribute_checker
//==============================================
bus__physical_memory_attribute_checker physical_memory_attribute_checker
(
    .clk(clk),
    .rst(rst),
    .addr(addr[2:0]),
    .size(size),
    .pma(pma),
    .status(status)
);

//==============================================
// bus__trap
//==============================================
bus__trap trap
(
    .clk(clk),
    .rst(rst),
    .status(status),
    .cs__x(cs__x),
    .ready__x(ready__x),
    .resp__x(resp__x),
    .rd_data__x(rd_data__x),
    .cs__y(cs__y),
    .ready__y(ready__y),
    .rd_data__y(rd_data__y)
);

//==============================
// multiplexer
//==============================
bus__multiplexer multiplexer
(
    .clk(clk),
    .rst(rst),
    .sel(sel),
    .cs(cs__y),
    .ready(ready__y),
    .rd_data(rd_data__y),
    .cs__0(cs__0),
    .ready__0(ready__0),
    .rd_data__0(rd_data__0),
    .cs__1(cs__1),
    .ready__1(ready__1),
    .rd_data__1(rd_data__1),
    .cs__2(cs__2),
    .ready__2(ready__2),
    .rd_data__2(rd_data__2),
    .cs__3(cs__3),
    .ready__3(ready__3),
    .rd_data__3(rd_data__3),
    .cs__4(cs__4),
    .ready__4(ready__4),
    .rd_data__4(rd_data__4),
    .cs__5(cs__5),
    .ready__5(ready__5),
    .rd_data__5(rd_data__5),
    .cs__6(cs__6),
    .ready__6(ready__6),
    .rd_data__6(rd_data__6),
    .cs__7(cs__7),
    .ready__7(ready__7),
    .rd_data__7(rd_data__7)
);

endmodule

