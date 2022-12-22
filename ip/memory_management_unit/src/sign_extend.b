//==============================================
// sign_extend 
//==============================================
module sign_extend 
(
    input clk,
    input rst,
    input [2:0] dtype,
    input [63:0] data,
    input [63:0] data_extended,
);
    input clk,
    input rst,
always_comb begin
    case (request__dtype)
        DTYPE__DOUBLE_WORD:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__DOUBLE_WORD; 
        end
        DTYPE__WORD:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__WORD; 
        end
        DTYPE__WORD_UNSIGNED:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__WORD; 
        end
        DTYPE__HALF_WORD:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__HALF_WORD; 
        end
        DTYPE__HALF_WORD_UNSIGNED:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__HALF_WORD; 
        end
        DTYPE__BYTE:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__BYTE; 
        end
        DTYPE__BYTE_UNSIGNED:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__BYTE; 
        end
    endcase
end

endmodule
