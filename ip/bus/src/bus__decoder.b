//==============================================
// bus 
//==============================================
module bus 
(
    input clk,
    input rst,
PYTHON
(
    for i in range(8):
        print(f"    output logic cs__{i},")
        print(f"    output logic we__{i},")
        print(f"    output logic [39:0] addr__{i},")
        print(f"    output logic [1:0] size__{i},")
        print(f"    output logic [63:0] wr_data__{i},")
        print(f"    input ready__{i},")
        print(f"    input resp__{i},")
        print(f"    input [63:0] rd_data__{i},")
        print(f"    input [7:0] pma__{i},")
)
    input cs,
    input we,
    input [63:0] addr,
    input [1:0] size,
    input [63:0] wr_data,
    output logic ready,
    output logic resp,
    output logic [63:0] rd_data
);

logic [5:0] state;
logic [5:0] state__n;


PYTHON
(
    states = [
        'STATE__DECODE',
        'STATE__ACCESS_FAULT',
        'STATE__MISALIGNED_ADDRESS',
    ]

    for i in range(8):
        states.append(f"STATE__REGION__{i}__PMA_CHECK")
        states.append(f"STATE__REGION__{i}__REQ")

    for i in range(len(states)):
        print(f"localparam {states[i]} = 8'h{i:x};") 
)


always_comb
begin
    ready = 1'b0;
    resp = 1'b0;
    rd_data = ERRORCODE__ACCESS_FAULT;
PYTHON
(
    for i in range(8):
        print(f"    cs__{i} = 1'b0;")
)

    case (state)
        //==============================
        // STATE__DECODE
        //==============================
        STATE__DECODE:
        begin
            casez (addr)
PYTHON
(
    for i in range(8):
        print(f"            MEMORY_MAP__REGION__{i}:")
        print(f"            begin")
        print(f"                state__n = cs ? STATE__REGION__{i}__PMA_CHECK : STATE__DECODE;")
        print(f"            end")
)
            default:
            begin
                state__n = STATE__ACCESS_FAULT;
            end
            endcase
        end

PYTHON
(
    for i in range(8):
        print(f"        //==============================")
        print(f"        // STATE__REGION__{i}__PMA_CHECK")
        print(f"        //==============================")
        print(f"        STATE__REGION__{i}__PMA_CHECK:")
        print(f"        begin")
        print(f"            case (size)")
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
        print(f"            endcase")
        print(f"        end")
        print(f"")
        print(f"        //==============================")
        print(f"        // STATE__REGION__{i}__REQ")
        print(f"        //==============================")
        print(f"        STATE__REGION__{i}__REQ:")
        print(f"        begin")
        print(f"            cs__{i} = 1'b1;")
        print(f"            ready = ready__{i};")
        print(f"            resp = resp__{i};")
        print(f"            rd_data = rd_data__{i};")
        print(f"            state__n = ready__{i} ? STATE__DECODE : STATE__REGION__{i}__REQ;")
        print(f"        end")
        print(f"")
)
            
        //==============================
        // STATE__ACCESS_FAULT
        //==============================
        STATE__ACCESS_FAULT:
        begin
            ready = 1'b1;
            resp = 1'b1;
            rd_data = ERRORCODE__ACCESS_FAULT;
            state__n = STATE__DECODE;
        end

        //==============================
        // STATE__MISALIGNED_ADDRESS
        //==============================
        STATE__MISALIGNED_ADDRESS:
        begin
            ready = 1'b1;
            resp = 1'b1;
            rd_data = ERRORCODE__MISALIGNED_ADDRESS;
            state__n = STATE__DECODE;
        end
    endcase
end


PYTHON
(
    for i in range(8):
        print(f"assign we__{i} = we;")
        print(f"assign addr__{i} = addr;")
        print(f"assign size__{i} = size;")
        print(f"assign wr_data__{i} = wr_data;")
)


endmodule

