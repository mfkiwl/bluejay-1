//==============================================
// platform_level_interrupt_controller__cmlcmpl
//==============================================
module platform_level_interrupt_controller__clmcmpl
(
    input clk,
    input rst,
    input [9:0] id,
    output logic [31:0] cmlcmpl 
);

logic [PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CLMCMPL__ID__WIDTH-1:0] clmcmpl;

assign clmcmpl[PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CLMCMPL__ID__FIELD] = clmcmpl__id;

assign clmcmpl__id = {22'h0, id}; 

endmodule
