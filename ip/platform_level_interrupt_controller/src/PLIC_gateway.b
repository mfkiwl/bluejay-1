//==============================================
// PLIC_gateway 
//==============================================
module PLIC_gateway 
(
    clk,
    rst,
    signal,
    ir
);

input clk;
input rst;
input signal;
output ir;

logic clk;
logic rst;
logic signal;
logic ir;
logic [1:0] state;
logic [1:0] state__n;

localparam STATE__READY = 2'h0;
localparam STATE__REQUEST_INTERRUPT = 2'h1;
localparam STATE__WAIT = 2'h2;

always_comb
begin
    state__n = state;
    case (state)

        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            state__n = signal ? STATE__REQUEST_INTERRUPT : STATE__READY;
        end

        //==============================
        // STATE__REQUEST_INTERRUPT
        //==============================
        STATE__REQUEST_INTERRUPT:
        begin
            ir = 1'b1;
            state__n = STATE__WAIT;
        end
        
        //==============================
        // STATE__WAIT
        //==============================
        STATE__WAIT:
        begin
            state__n = complete ? STATE__READY : STATE__WAIT;
        end

    endcase
end

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(2), .RESET_VALUE(STATE__READY)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state),
)

endmodule
