//==============================================
// advanced_high_performance_bus__multiplexor
//==============================================
module advanced_high_performance_bus__multiplexor
(
    input hclk,
    input hresetn,
    output logic [63:0] hrdata,
    output logic hresp,
    output logic hready,
    input hsel__default,
    input [63:0] hrdata__default,
    input hresp__default,
    input hreadyout__default,
    input hsel__0,
    input [63:0] hrdata__0,
    input hresp__0,
    input hreadyout__0,
    input hsel__1,
    input [63:0] hrdata__1,
    input hresp__1,
    input hreadyout__1,
    input [63:0] hrdata__2,
    input hresp__2,
    input hreadyout__2,
    input [63:0] hrdata__3,
    input hresp__3,
    input hreadyout__3
);

logic [2:0] sel;
logic [2:0] sel__n;

parameter SEL__DEFAULT = 3'h0;
parameter SEL__0 = 3'h1;
parameter SEL__1 = 3'h2;
parameter SEL__2 = 3'h3;
parameter SEL__3 = 3'h4;

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
