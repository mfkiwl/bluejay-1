//==============================================
// bus__multiplexor
//==============================================
module bus__multiplexor
(
    clk,
    rst,
    sel,
    cs,
    ready,
    resp,
    rd_data,
    cs__0,
    ready__0,
    resp__0,
    rd_data__0,
    cs__1,
    ready__1,
    resp__1,
    rd_data__1,
    cs__2,
    ready__2,
    resp__2,
    rd_data__2,
    cs__3,
    ready__3,
    resp__3,
    rd_data__3,
    cs__4,
    ready__4,
    resp__4,
    rd_data__4,
    cs__5,
    ready__5,
    resp__5,
    rd_data__5,
    cs__6,
    ready__6,
    resp__6,
    rd_data__6,
    cs__7,
    ready__7,
    resp__7,
    rd_data__7
);

input clk;
input rst;

input [2:0] sel;

input cs;
output ready;
output resp;
output [63:0] rd_data;

output cs__0;
input ready__0;
input resp__0;
input [63:0] rd_data__0;

output cs__1;
input ready__1;
input resp__1;
input [63:0] rd_data__1;

output cs__2;
input ready__2;
input resp__2;
input [63:0] rd_data__2;

output cs__3;
input ready__3;
input resp__3;
input [63:0] rd_data__3;

output cs__4;
input ready__4;
input resp__4;
input [63:0] rd_data__4;

output cs__5;
input ready__5;
input resp__5;
input [63:0] rd_data__5;

output cs__6;
input ready__6;
input resp__6;
input [63:0] rd_data__6;

output cs__7;
input ready__7;
input resp__7;
input [63:0] rd_data__7;

logic clk;
logic rst;

logic [2:0] sel;

logic cs;
logic ready;
logic resp;
logic [63:0] rd_data;

logic cs__0;
logic ready__0;
logic resp__0;
logic [63:0] rd_data__0;

logic cs__1;
logic ready__1;
logic resp__1;
logic [63:0] rd_data__1;

logic cs__2;
logic ready__2;
logic resp__2;
logic [63:0] rd_data__2;

logic cs__3;
logic ready__3;
logic resp__3;
logic [63:0] rd_data__3;

logic cs__4;
logic ready__4;
logic resp__4;
logic [63:0] rd_data__4;

logic cs__5;
logic ready__5;
logic resp__5;
logic [63:0] rd_data__5;

logic cs__6;
logic ready__6;
logic resp__6;
logic [63:0] rd_data__6;

logic cs__7;
logic ready__7;
logic resp__7;
logic [63:0] rd_data__7;

always_comb
begin
    cs__0 = 1'b0; 
    cs__1 = 1'b0; 
    cs__2 = 1'b0; 
    cs__3 = 1'b0; 
    cs__4 = 1'b0; 
    cs__5 = 1'b0; 
    cs__6 = 1'b0; 
    cs__7 = 1'b0; 

    case (sel)
        2'h0:
        begin
            cs__0 = cs;
            ready = ready__0;
            resp = resp__0;
            rd_data = rd_data__0;
        end
        2'h1:
        begin
            cs__1 = cs;
            ready = ready__1;
            resp = resp__1;
            rd_data = rd_data__1;
        end
        2'h2:
        begin
            cs__2 = cs;
            ready = ready__2;
            resp = resp__2;
            rd_data = rd_data__2;
        end
        2'h3:
        begin
            cs__3 = cs;
            ready = ready__3;
            resp = resp__3;
            rd_data = rd_data__3;
        end
        2'h4:
        begin
            cs__4 = cs;
            ready = ready__4;
            resp = resp__4;
            rd_data = rd_data__4;
        end
        2'h5:
        begin
            cs__5 = cs;
            ready = ready__5;
            resp = resp__5;
            rd_data = rd_data__5;
        end
        2'h6:
        begin
            cs__6 = cs;
            ready = ready__6;
            resp = resp__6;
            rd_data = rd_data__6;
        end
        2'h7:
        begin
            cs__7 = cs;
            ready = ready__7;
            resp = resp__7;
            rd_data = rd_data__7;
        end
    endcase
end

endmodule
