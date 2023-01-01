//==============================================
// memory_controller 
//==============================================
module memory_controller
(
    output ena,
    output wea,
    output [7:0] wrbe,
    output [11:0] addra, 
    output [63:0] dina,
    input [63:0] douta
);


logic [7:0] state;
logic [7:0] state__n;


always_comb begin
    ena = 1'b0;
    wea = 1'b0;
    wrbe = 8'hff; 
        
    case (state)

        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            state__n = STATE__IDLE;
        end
endcase



endmodule
