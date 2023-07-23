//==============================================
// physical_memory_attribute_checker
//==============================================
module physical_memory_attribute_checker
(
    input cs,
    input we,
    input [63:0] addr,
    input [1:0] size,
    input [63:0] wr_data,
    output logic ready,
    output logic resp,
    output logic [63:0] rd_data
);


always_comb
begin
    case (size)
        SIZE__BYTE:
        begin
            case (pma__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD])
                1'b1:
                begin
                    resp = 1'b0; 
                    rd_data = 
                end
                default:
                begin
                    resp = 1'b1;
                    rd_data = ERRORCODE__ACCESS_FAULT;
                end
            endcase

            resp = (pma__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] == 1'b0) | 
            error = 1'b1;            
        end
        SIZE__HALF_WORD:
        begin
            error = (addr[0] != 1'b0);            
        end
        SIZE__WORD:
        begin
            error = (addr[1:0] != 2'h0);            
        end
        SIZE__DOUBLE_WORD:
        begin
            error = (addr[2:0] != 3'h0);            
        end
    endcase
end



always_comb
begin
    case (addr)
        REGION__0:
        begin
             
        end
    endcase
    case (size)
        SIZE__BYTE:
        begin
            
        end
    
    endcase
end
        print(f"        STATE__REGION__{i}__PMA_CHECK:")
        print(f"        begin")
        print(f"            case (size__x)")
        print(f"                SIZE__BYTE:")
        print(f"                begin")
        print(f"                    state__n = (pma__{i}[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__{i}__REQ;")
        print(f"                end")
        print(f"                SIZE__HALF_WORD:")
        print(f"                begin")
        print(f"                    state__n = (pma__{i}[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__{i}[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__{i}__REQ;")
        print(f"                end")
        print(f"                SIZE__WORD:")
        print(f"                begin")
        print(f"                    state__n = (pma__{i}[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__{i}[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__{i}__REQ;")
        print(f"                end")
        print(f"                SIZE__DOUBLE_WORD:")
        print(f"                begin")
        print(f"                    state__n = (pma__{i}[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__{i}[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__{i}__REQ;")
        print(f"                end")
        //==============================
        // STATE__ACCESS_FAULT
        //==============================
        STATE__ACCESS_FAULT:
        begin
            ready = 1'b1;
            resp = 1'b1;
            rd_data = ERRORCODE__ACCESS_FAULT;
            state__n = STATE__READY;
        end

        //==============================
        // STATE__MISALIGNED_ADDRESS
        //==============================
        STATE__MISALIGNED_ADDRESS:
        begin
            ready = 1'b1;
            resp = 1'b1;
            rd_data = ERRORCODE__MISALIGNED_ADDRESS;
            state__n = STATE__READY;
        end

endmodule
