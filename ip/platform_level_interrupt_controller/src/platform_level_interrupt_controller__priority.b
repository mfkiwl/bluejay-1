//==============================================
// platform_level_interrupt_controller__priority 
//==============================================
module platform_level_interrupt_controller__priority
(
    input clk,
    input rst,
    input en,
    input [31:0] wr_data,
    output logic [31:0] priority 
);

logic [PLATFORM_LEVEL_INTERRUPT_CONTROLLER__PRIORITY__PRIORITY__WIDTH-1:0] priority__priority;

assign priority[PLATFORM_LEVEL_INTERRUPT_CONTROLLER__PRIORITY__PRIORITY__FIELD] = priority__priority;

assign priority__priority = PLATFORM_LEVEL_INTERRUPT_CONTROLLER__PRIORITY__PRIORITY__VALUE;

endmodule
