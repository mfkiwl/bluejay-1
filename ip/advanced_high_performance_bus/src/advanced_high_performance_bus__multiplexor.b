//==============================================
// advanced_high_performance_bus__multiplexor
//==============================================
module advanced_high_performance_bus__multiplexor
(
    hclk,
    hresetn,
    hrdata,
    hresp,
    hready,
    hsel__default,
    hrdata__default,
    hresp__default,
    hreadyout__default,
    hsel__0,
    hrdata__0,
    hresp__0,
    hreadyout__0,
    hsel__1,
    hrdata__1,
    hresp__1,
    hreadyout__1,
    hrdata__2,
    hresp__2,
    hreadyout__2,
    hrdata__3,
    hresp__3,
    hreadyout__3
);

input hclk;
input hresetn;
output [63:0] hrdata;
output hresp;
output hready;
input hsel__default;
input [63:0] hrdata__default;
input hresp__default;
input hreadyout__default;
input hsel__0;
input [63:0] hrdata__0;
input hresp__0;
input hreadyout__0;
input hsel__1;
input [63:0] hrdata__1;
input hresp__1;
input hreadyout__1;
input [63:0] hrdata__2;
input hresp__2;
input hreadyout__2;
input [63:0] hrdata__3;
input hresp__3;
input hreadyout__3

logic hclk;
logic hresetn;
logic [63:0] hrdata;
logic hresp;
logic hready;
logic hsel__default;
logic [63:0] hrdata__default;
logic hresp__default;
logic hreadyout__default;
logic hsel__0;
logic [63:0] hrdata__0;
logic hresp__0;
logic hreadyout__0;
logic hsel__1;
logic [63:0] hrdata__1;
logic hresp__1;
logic hreadyout__1;
logic [63:0] hrdata__2;
logic hresp__2;
logic hreadyout__2;
logic [63:0] hrdata__3;
logic hresp__3;
logic hreadyout__3

logic [2:0] sel;
logic [2:0] sel__n;

localparam SEL__DEFAULT = 3'h0;
localparam SEL__0 = 3'h1;
localparam SEL__1 = 3'h2;
localparam SEL__2 = 3'h3;
localparam SEL__3 = 3'h4;

always_comb
begin
    case (sel)
        SEL__DEFAULT:
        begin
            hrdata = hrdata__default:
            hresp = hresp__default:
            hready = hreadyout__default:
        end
        SEL__0:
        begin
            hrdata = hrdata__0:
            hresp = hresp__0:
            hready = hreadyout__0:
        end
        SEL__1:
        begin
            hrdata = hrdata__1:
            hresp = hresp__1:
            hready = hreadyout__1:
        end
        SEL__2:
        begin
            hrdata = hrdata__2:
            hresp = hresp__2:
            hready = hreadyout__2:
        end
        SEL__3:
        begin
            hrdata = hrdata__3:
            hresp = hresp__3:
            hready = hreadyout__3:
        end
        default:
        begin
            hrdata = hrdata__default:
            hresp = hresp__default:
            hready = hreadyout__default:
        end
    endcase
end

always_comb
begin
    sel__n = hsel__3 ? SEL__3 : hsel__2 ? SEL__2 : hsel__1 ? SEL__1 : hsel__0 ? SEL__0 : SEL__DEFAULT;
end

//==============================
// d_flip_flop__sel
//==============================
d_flip_flop #(.WIDTH(3), .RESET_VALUE(STATE__IDLE)) d_flip_flop__sel
(
    .clk(clk),
    .rst(1'b0),
    .en(hready),
    .d(sel__n),
    .q(sel)
);

endmodule
