//==============================================
// jay__minstret
//==============================================
module jay__minstret
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] minstret,
    input instret
);

localparam STATE__IDLE = 1'b0;
localparam STATE__WRITE_OCCURED = 1'b1;

logic [64-1:0] minstret__minstret;
logic [64-1:0] minstret__minstret__n;

logic state;
logic state__n;

assign minstret[63:0] = minstret__minstret;

assign minstret__minstret__n = en ? wr_data[63:0] : instret & (state != STATE__WRITE_OCCURED) ? minstret__minstret + 1 : minstret__minstret;

//==============================
// d_flip_flop__minstret__minstret
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__minstret__minstret
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(minstret__minstret__n),
    .q(minstret__minstret)
);


always_comb
begin
    case (state)
        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            state__n = instret ? STATE__IDLE : en ? STATE__WRITE_OCCURED : STATE__IDLE;
        end

        //==============================
        // STATE__WRITE_OCCURED
        //==============================
        STATE__WRITE_OCCURED:
        begin
            state__n = instret ? STATE__IDLE : STATE__WRITE_OCCURED;
        end
    endcase
end

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(STATE__IDLE)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

endmodule
