//==============================================
// pulse_width_modulator
//==============================================
module pulse_width_modulator 
(
    input clk,
    input rst,
    input cs,
    input we,
    input [3:0] addr,
    input [63:0] wr_data,
    output logic [63:0] rd_data,
    output logic pwm 
);


logic [3:0] state;
logic [3:0] state__n;

logic [65:0] x;
logic [65:0] x__n;
logic [65:0] x__high;
logic [65:0] x__high__n;
logic [65:0] x__low;
logic [65:0] x__low__n;
logic en__x;


// Period Register 
logic [63:0] period;
logic we__period;
logic en__period;

// Duty Register 
logic [63:0] duty;
logic we__duty;
logic en__duty;

always_comb
begin
    we__period = 1'b0;
    we__duty = 1'b0;
            
    case (addr)
        PULSE_WIDTH_MODULATOR__PERIOD:
        begin
            rd_data = period;
            we__period = we;
        end
        PULSE_WIDTH_MODULATOR__DUTY:
        begin
            rd_data = duty;
            we__duty = we;
        end
    endcase
end


assign x__high__n = (duty > period) ? 0 : duty << 2;
assign x__low__n = (duty > period) ? 0 : (period - duty) << 2;


localparam STATE__RESET = 4'h0;
localparam STATE__HIGH__0 = 4'h1;
localparam STATE__HIGH__1 = 4'h2;
localparam STATE__HIGH__2 = 4'h3;
localparam STATE__HIGH__3 = 4'h4;
localparam STATE__HIGH__4 = 4'h5;
localparam STATE__LOW__0 = 4'h6;
localparam STATE__LOW__1 = 4'h7;
localparam STATE__LOW__2 = 4'h8;

always_comb
begin

    case (state)
        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            pwm = 1'b0;
            x__n = 0;
            en__x = 1'b1;
            state__n = (x__low == 0) & (x__high == 0) ? STATE__RESET : (x__low == 0) ? STATE__HIGH__0 : STATE__LOW__0; 
        end

        //==============================
        // STATE__HIGH__0
        //==============================
        STATE__HIGH__0:
        begin
            pwm = 1'b1;
            x__n = x + 1;
            en__x = 1'b0;
            state__n = (x == (x__high - 4)) ? STATE__HIGH__1 : STATE__HIGH__0;
        end

        //==============================
        // STATE__HIGH__1
        //==============================
        STATE__HIGH__1:
        begin
            pwm = 1'b1;
            x__n = x + 1;
            en__x = 1'b0;
            state__n = (x__low == 0) ? STATE__HIGH__3 : STATE__HIGH__2; 
        end

        //==============================
        // STATE__HIGH__2
        //==============================
        STATE__HIGH__2:
        begin
            pwm = 1'b1;
            x__n = x + 1;
            en__x = 1'b0;
            state__n = STATE__HIGH__4; 
        end

        //==============================
        // STATE__HIGH__3
        //==============================
        STATE__HIGH__3:
        begin
            pwm = 1'b1;
            x__n = x + 1;
            en__x = 1'b1;
            state__n = STATE__HIGH__4; 
        end

        //==============================
        // STATE__HIGH__4
        //==============================
        STATE__HIGH__4:
        begin
            pwm = 1'b1;
            x__n = 0;
            en__x = 1'b0;
            state__n = (x__low == 0) & (x__high == 0) ? STATE__RESET : (x__low == 0) ? STATE__HIGH__0 : STATE__LOW__0; 
        end

        //==============================
        // STATE__LOW__0
        //==============================
        STATE__LOW__0:
        begin
            pwm = 1'b0;
            x__n = x + 1;
            en__x = 1'b0;
            state__n = (x == (x__low - 3)) ? STATE__LOW__1 : STATE__LOW__0;
        end

        //==============================
        // STATE__LOW__1
        //==============================
        STATE__LOW__1:
        begin
            pwm = 1'b0;
            x__n = x + 1;
            en__x = 1'b1;
            state__n = STATE__LOW__2; 
        end

        //==============================
        // STATE__LOW__2
        //==============================
        STATE__LOW__2:
        begin
            pwm = 1'b0;
            x__n = 0;
            en__x = 1'b0;
            state__n = (x__low == 0) & (x__high == 0) ? STATE__RESET : (x__high == 0) ? STATE__LOW__0 : STATE__HIGH__0; 
        end

    endcase
end


assign en__period = cs & we__period;

//==============================
// d_flip_flop__period
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__period
(
    .clk(clk),
    .rst(rst),
    .en(en__period),
    .d(wr_data),
    .q(period)
);

assign en__duty = cs & we__duty;

//==============================
// d_flip_flop__duty
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__duty
(
    .clk(clk),
    .rst(rst),
    .en(en__duty),
    .d(wr_data),
    .q(duty)
);

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(4), .RESET_VALUE(STATE__RESET)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

//==============================
// d_flip_flop__x
//==============================
d_flip_flop #(.WIDTH(66), .RESET_VALUE(66'h0)) d_flip_flop__x
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(x__n),
    .q(x)
);

//==============================
// d_flip_flop__x__high
//==============================
d_flip_flop #(.WIDTH(66), .RESET_VALUE(66'h0)) d_flip_flop__x__high
(
    .clk(clk),
    .rst(rst),
    .en(en__x),
    .d(x__high__n),
    .q(x__high)
);

//==============================
// d_flip_flop__x__low
//==============================
d_flip_flop #(.WIDTH(66), .RESET_VALUE(66'h0)) d_flip_flop__x__low
(
    .clk(clk),
    .rst(rst),
    .en(en__x),
    .d(x__low__n),
    .q(x__low)
);





endmodule
