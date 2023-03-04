//==============================================
// bus 
//==============================================
module bus 
(
    clk,
    rst,
    cs,
    we,
    addr,
    size,
    wr_data,
    ready,
    resp,
    rd_data,
    cs__0,
    we__0,
    addr__0,
    size__0,
    wr_data__0,
    ready__0,
    resp__0,
    rd_data__0,
    cs__1,
    we__1,
    addr__1,
    size__1,
    wr_data__1,
    ready__1,
    resp__1,
    rd_data__1,
    cs__2,
    we__2,
    addr__2,
    size__2,
    wr_data__2,
    ready__2,
    resp__2,
    rd_data__2,
    cs__3,
    we__3,
    addr__3,
    size__3,
    wr_data__3,
    ready__3,
    resp__3,
    rd_data__3,
    cs__4,
    we__4,
    addr__4,
    size__4,
    wr_data__4,
    ready__4,
    resp__4,
    rd_data__4,
    cs__5,
    we__5,
    addr__5,
    size__5,
    wr_data__5,
    ready__5,
    resp__5,
    rd_data__5,
    cs__6,
    we__6,
    addr__6,
    size__6,
    wr_data__6,
    ready__6,
    resp__6,
    rd_data__6,
    cs__7,
    we__7,
    addr__7,
    size__7,
    wr_data__7,
    ready__7,
    resp__7,
    rd_data__7
);


input clk;
input rst;

input cs;
input we;
input [39:0] addr;
input [1:0] size;
input [63:0] wr_data;
output ready;
output resp;
output [63:0] rd_data;

output cs__0;
output we__0;
output [39:0] addr__0;
output [1:0] size__0;
output [63:0] wr_data__0;
input ready__0;
input resp__0;
input [63:0] rd_data__0;

output cs__1;
output we__1;
output [39:0] addr__1;
output [1:0] size__1;
output [63:0] wr_data__1;
input ready__1;
input resp__1;
input [63:0] rd_data__1;

output cs__2;
output we__2;
output [39:0] addr__2;
output [1:0] size__2;
output [63:0] wr_data__2;
input ready__2;
input resp__2;
input [63:0] rd_data__2;

output cs__3;
output we__3;
output [39:0] addr__3;
output [1:0] size__3;
output [63:0] wr_data__3;
input ready__3;
input resp__3;
input [63:0] rd_data__3;

output cs__4;
output we__4;
output [39:0] addr__4;
output [1:0] size__4;
output [63:0] wr_data__4;
input ready__4;
input resp__4;
input [63:0] rd_data__4;

output cs__5;
output we__5;
output [39:0] addr__5;
output [1:0] size__5;
output [63:0] wr_data__5;
input ready__5;
input resp__5;
input [63:0] rd_data__5;

output cs__6;
output we__6;
output [39:0] addr__6;
output [1:0] size__6;
output [63:0] wr_data__6;
input ready__6;
input resp__6;
input [63:0] rd_data__6;

output cs__7;
output we__7;
output [39:0] addr__7;
output [1:0] size__7;
output [63:0] wr_data__7;
input ready__7;
input resp__7;
input [63:0] rd_data__7;


logic clk;
logic rst;

logic [2:0] sel;

logic cs;
logic we;
logic [39:0] addr;
logic [1:0] size;
logic [63:0] wr_data;
logic ready;
logic resp;
logic [63:0] rd_data;

logic cs__0;
logic we__0;
logic [39:0] addr__0;
logic [1:0] size__0;
logic [63:0] wr_data__0;
logic ready__0;
logic resp__0;
logic [63:0] rd_data__0;

logic cs__1;
logic we__1;
logic [39:0] addr__1;
logic [1:0] size__1;
logic [63:0] wr_data__1;
logic ready__1;
logic resp__1;
logic [63:0] rd_data__1;

logic cs__2;
logic we__2;
logic [39:0] addr__2;
logic [1:0] size__2;
logic [63:0] wr_data__2;
logic ready__2;
logic resp__2;
logic [63:0] rd_data__2;

logic cs__3;
logic we__3;
logic [39:0] addr__3;
logic [1:0] size__3;
logic [63:0] wr_data__3;
logic ready__3;
logic resp__3;
logic [63:0] rd_data__3;

logic cs__4;
logic we__4;
logic [39:0] addr__4;
logic [1:0] size__4;
logic [63:0] wr_data__4;
logic ready__4;
logic resp__4;
logic [63:0] rd_data__4;

logic cs__5;
logic we__5;
logic [39:0] addr__5;
logic [1:0] size__5;
logic [63:0] wr_data__5;
logic ready__5;
logic resp__5;
logic [63:0] rd_data__5;

logic cs__6;
logic we__6;
logic [39:0] addr__6;
logic [1:0] size__6;
logic [63:0] wr_data__6;
logic ready__6;
logic resp__6;
logic [63:0] rd_data__6;

logic cs__7;
logic we__7;
logic [39:0] addr__7;
logic [1:0] size__7;
logic [63:0] wr_data__7;
logic ready__7;
logic resp__7;
logic [63:0] rd_data__7;


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

//==============================
// multiplexor
//==============================
bus__multiplexor multiplexor
(
    .clk(clk),
    .rst(rst),
    .sel(sel),
    .cs(cs),
    .ready(ready),
    .resp(resp),
    .rd_data(rd_data),
    .cs__0(cs__0),
    .ready__0(ready__0),
    .resp__0(resp__0),
    .rd_data__0(rd_data__0),
    .cs__1(cs__1),
    .ready__1(ready__1),
    .resp__1(resp__1),
    .rd_data__1(rd_data__1),
    .cs__2(cs__2),
    .ready__2(ready__2),
    .resp__2(resp__2),
    .rd_data__2(rd_data__2),
    .cs__3(cs__3),
    .ready__3(ready__3),
    .resp__3(resp__3),
    .rd_data__3(rd_data__3),
    .cs__4(cs__4),
    .ready__4(ready__4),
    .resp__4(resp__4),
    .rd_data__4(rd_data__4),
    .cs__5(cs__5),
    .ready__5(ready__5),
    .resp__5(resp__5),
    .rd_data__5(rd_data__5),
    .cs__6(cs__6),
    .ready__6(ready__6),
    .resp__6(resp__6),
    .rd_data__6(rd_data__6),
    .cs__7(cs__7),
    .ready__7(ready__7),
    .resp__7(resp__7),
    .rd_data__7(rd_data__7)
);

endmodule

