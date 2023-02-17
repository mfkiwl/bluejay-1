//==============================================
// advanced_high_performance_bus__multiplexor
//==============================================
module advanced_high_performance_bus__multiplexor
(
    clk,
    rst,
    rd_data,
    ready,
    cs__0,
    ready__0,
    rd_data__0,
    cs__1,
    ready__1,
    rd_data__1,
    cs__2,
    ready__2,
    rd_data__2,
    cs__3,
    ready__3,
    rd_data__3
);

input clk;
input rst;

output [63:0] rd_data;
output ready;

input cs__0;
input ready__0;
input [63:0] rd_data__0;

input cs__1;
input ready__1;
input [63:0] rd_data__1;


logic clk;
logic rst;

logic [63:0] rd_data;
logic ready;

logic cs__0;
logic ready__0;
logic [63:0] rd_data__0;

logic cs__1;
logic ready__1;
logic [63:0] rd_data__1;

logic cs__2;
logic ready__2;
logic [63:0] rd_data__2;

logic cs__3;
logic ready__3;
logic [63:0] rd_data__3;


logic [1:0] sel;

localparam SEL__0 = 2'h0;
localparam SEL__1 = 2'h1;
localparam SEL__2 = 2'h2;
localparam SEL__3 = 2'h3;

always_comb
begin
    sel = cs__3 ? SEL__3 : hsel__2 ? SEL__2 : hsel__1 ? SEL__1 : hsel__0 ? SEL__0 : SEL__0;
end

always_comb
begin
    case (sel)
        SEL__0:
        begin
            rd_data = rd_data__0:
            ready = ready__0:
        end
        SEL__1:
        begin
            rd_data = rd_data__1:
            ready = ready__1:
        end
        SEL__2:
        begin
            rd_data = rd_data__2:
            ready = ready__2:
        end
        SEL__3:
        begin
            rd_data = rd_data__3:
            ready = ready__3:
        end
    endcase
end

endmodule
