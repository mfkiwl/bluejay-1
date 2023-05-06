//==============================================
// counter
//==============================================
module debouncer
#(parameter DEBOUNCE_COUNT = 0)
(
    input clk,
    input rst,
    input x,
    output logic x__clean 
);
    
logic [1:0] state;
logic [1:0] state__n;

logic [63:0] count;
logic [63:0] count__n;

localparam STATE__LOW = 2'h0;
localparam STATE__LOW_TO_HIGH = 2'h1;
localparam STATE__HIGH_TO_LOW = 2'h2;
localparam STATE__HIGH = 2'h3;

always_comb
begin
    case (state)

        //==============================
        // STATE__LOW
        //==============================
        STATE__LOW:
        begin
            x__clean = 1'b0;
            count__n = 64'h0;
            state__n = x ? STATE__LOW_TO_HIGH : STATE__LOW;
        end

        //==============================
        // STATE__LOW_TO_HIGH
        //==============================
        STATE__LOW_TO_HIGH:
        begin
            x__clean = 1'b0;
            count__n = count + 1;
            state__n = x ? (count == DEBOUNCE_COUNT) ? STATE__HIGH : STATE__LOW_TO_HIGH : STATE__LOW;
        end

        //==============================
        // STATE__HIGH_TO_LOW
        //==============================
        STATE__HIGH_TO_LOW:
        begin
            x__clean = 1'b1;
            count__n = count + 1;
            state__n = x ? STATE__HIGH : (count == DEBOUNCE_COUNT) ? STATE__LOW : STATE__HIGH_TO_LOW;
        end

        //==============================
        // STATE__HIGH
        //==============================
        STATE__HIGH:
        begin
            x__clean = 1'b1;
            count__n = 64'h0;
            state__n = x ? STATE__HIGH : STATE__HIGH_TO_LOW;
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

//==============================
// d_flip_flop__count
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__count
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(count__n),
    .q(count)
);

endmodule

