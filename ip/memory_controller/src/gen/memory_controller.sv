//==============================================
// memory_controller 
//==============================================
module memory_controller
(
    input clk,
    input rst,
    input cs,
    input we,
    input [14:0] addr,
    input [1:0] size,
    input [63:0] wr_data,
    output logic ready,
    output logic [63:0] rd_data,
    output logic ena,
    output logic [7:0] wea,
    output logic [11:0] addra, 
    output logic [63:0] dina,
    input [63:0] douta
);


logic [2:0] state;
logic [2:0] state__n;

localparam STATE__IDLE = 3'h0;
localparam STATE__WRITE = 3'h1;
localparam STATE__READ__0 = 3'h2;
localparam STATE__READ__1 = 3'h3;
localparam STATE__READ__2 = 3'h4;


assign addra = addr[14:3];
assign dina = wr_data;

always_comb
begin
    ena = 1'b0;
    wea = 8'b0000_0000; 
    ready = 1'b0;
    rd_data = douta;
        
    case (state)
        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            state__n = (cs & we) ? STATE__WRITE : (cs & ~we) ? STATE__READ__0 : STATE__IDLE; 
        end

        //==============================
        // STATE__WRITE
        //==============================
        STATE__WRITE:
        begin
            ena = 1'b1;
            wea = (size == 2'h0) ? (8'b0000_0001 << addr[2:0]) : (size == 2'h1) ? (8'b0000_0011 << addr[1:0]) : (size == 2'h2) ? (8'b0000_1111 << addr[0]) : 8'b1111_1111;
            ready = 1'b1;
            state__n = STATE__IDLE; 
        end

        //==============================
        // STATE__READ__0
        //==============================
        STATE__READ__0:
        begin
            ena = 1'b1;
            state__n = STATE__READ__1; 
        end

        //==============================
        // STATE__READ__1
        //==============================
        STATE__READ__1:
        begin
            ena = 1'b1;
            state__n = STATE__READ__2; 
        end

        //==============================
        // STATE__READ__2
        //==============================
        STATE__READ__2:
        begin
            ena = 1'b1;
            ready = 1'b1;
            rd_data = (douta >> {addr[2:0],3'b000}); 
            state__n = STATE__IDLE; 
        end
    endcase
end

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(3), .RESET_VALUE(STATE__IDLE)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

endmodule
