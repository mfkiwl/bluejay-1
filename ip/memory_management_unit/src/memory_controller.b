//==============================================
// memory_controller 
//==============================================
module memory_controller
(
    input clk,
    input rst,
    input rx__valid,
    output rx__credit,
    input [1 + XLEN + 40 - 1:0] rx__data,
    output tx__valid,
    input tx__credit,
    output [64:0] tx__data,
    output ena,
    output wea,
    output [11:0] addra, 
    output [63:0] dina,
    input [63:0] douta
);


//==============================
// tx 
//==============================
module tx
(
    .clk(clk),
    .rst(rst),
    .valid(),
    .ready(),
    .data(),
    .tx__valid(tx__valid),
    .tx__data(tx__data),
    .tx__credit(tx__credit)
);


logic [7:0] state;
logic [7:0] state__n;


wea = 

always_comb begin
    ena = 1'b0;
        
    case (state)

        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state__n = STATE__READY;
        end

        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            state__n = req__valid ? STATE__ACCEPT_REQ : STATE__READY;
        end

        //==============================
        // STATE__ACCEPT_REQ
        //==============================
        STATE__ACCEPT_REQ:
        begin
            req__ready = 1'b1;
            ena = 1'b1;
            state__n = STATE__PMA_CHECK;
        end

        //==============================
        // STATE__PMA_CHECK
        //==============================
        STATE__PMA_CHECK:
        begin
            state__n = STATE__;
        end



endmodule
