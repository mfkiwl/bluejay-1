//==============================================
// platform_level_interrupt_controller__thrsh 
//==============================================
module platform_level_interrupt_controller__thrsh
(
    input clk,
    input rst,
    input en,
    input [31:0] wr_data,
    output logic [31:0] thrsh 
);

logic [PLATFORM_LEVEL_INTERRUPT_CONTROLLER__THRSH__THRSH__WIDTH-1:0] thrsh__thrsh;

assign thrsh[PLATFORM_LEVEL_INTERRUPT_CONTROLLER__THRSH__THRSH__FIELD] = thrsh__thrsh;

assign thrsh__thrsh = PLATFORM_LEVEL_INTERRUPT_CONTROLLER__THRSH__THRSH__VALUE; 

endmodule
