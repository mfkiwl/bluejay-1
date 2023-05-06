//==============================================
// edge_detector
//==============================================
module edge_detector
(
    input clk,
    input rst,
    input x,
    output logic x__edge 
);

logic [1:0] state;
logic [1:0] state__n;

localparam STATE__LOW = 2'h0;
localparam STATE__EDGE = 2'h1;
localparam STATE__HIGH = 2'h2;

always_comb
begin
    case (state)

        //==============================
        // STATE__LOW
        //==============================
        STATE__LOW:
        begin
            x__edge = 1'b0;
            state__n = x ? STATE__EDGE : STATE__LOW;
        end

        //==============================
        // STATE__EDGE
        //==============================
        STATE__EDGE:
        begin
            x__edge = 1'b1;
            state__n = x ? STATE__HIGH : STATE__LOW;
        end

        //==============================
        // STATE__HIGH
        //==============================
        STATE__HIGH:
        begin
            x__edge = 1'b0;
            state__n = x ? STATE__HIGH : STATE__LOW;
        end

    endcase
end

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(2), .RESET_VALUE(STATE__LOW)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

    
endmodule
