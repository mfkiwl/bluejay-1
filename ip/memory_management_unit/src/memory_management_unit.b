//==============================================
// memory_management_unit 
//==============================================
module memory_management_unit
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

logic we__x;
logic [39:0] addr__x;
logic [1:0] size__x;
logic [63:0] wr_data__x;
logic ready__x;
logic resp__x;
logic [63:0] rd_data__x__n;
logic [63:0] rd_data__x;

logic en__we__x;
logic en__addr__x;
logic en__size__x;
logic en__wr_data__x;
logic en__rd_data__x;

PYTHON
(
    states = [
        'STATE__RESET',
        'STATE__READY',
        'STATE__DECODE',
        'STATE__RESP',
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
PYTHON
(
    for i in range(8):
        print(f"    cs__{i} = 1'b0;")
)
    en__we__x = 1'b0;
    en__addr__x = 1'b0; 
    en__size__x = 1'b0; 
    en__wr_data__x = 1'b0; 
    en__rd_data__x = 1'b0; 
    ready = 1'b0;
    rd_data = rd_data__x;
    rd_data__x__n = rd_data__x;

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
            en__we__x = 1'b1;
            en__addr__x = 1'b1; 
            en__size__x = 1'b1; 
            en__wr_data__x = 1'b1; 
            state__n = cs ? STATE__DECODE : STATE__READY;
        end

        //==============================
        // STATE__DECODE
        //==============================
        STATE__DECODE:
        begin
            casez (addr__x)
PYTHON
(
    for i in range(8):
        print(f"            MEMORY_MAP__REGION__{i}:")
        print(f"            begin")
        print(f"                state__n = STATE__REGION__{i}__PMA_CHECK;")
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
        print(f"            endcase")
        print(f"        end")
        print(f"")
        print(f"        //==============================")
        print(f"        // STATE__REGION__{i}__REQ")
        print(f"        //==============================")
        print(f"        STATE__REGION__{i}__REQ:")
        print(f"        begin")
        print(f"            cs__{i} = 1'b1;")
        print(f"            en__rd_data__x = ready__{i};")
        print(f"            rd_data__x__n = rd_data__{i};")
        print(f"            state__n = ready__{i} ? STATE__RESP : STATE__REGION__{i}__REQ;")
        print(f"        end")
        print(f"")
)
            
        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            ready = 1'b1;
            resp = 1'b0;
            rd_data = rd_data__x;
            state__n = STATE__READY; 
        end

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
    endcase
end


PYTHON
(
    for i in range(8):
        print(f"assign we__{i} = we__x;")
        print(f"assign addr__{i} = addr__x;")
        print(f"assign size__{i} = size__x;")
        print(f"assign wr_data__{i} = wr_data__x;")
)


//==============================
// d_flip_flop__we__x
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__we__x
(
    .clk(clk),
    .rst(rst),
    .en(en__we__x),
    .d(we),
    .q(we__x)
);

//==============================
// d_flip_flop__addr__x
//==============================
d_flip_flop #(.WIDTH(40)) d_flip_flop__addr__x
(
    .clk(clk),
    .rst(rst),
    .en(en__addr__x),
    .d(addr[39:0]),
    .q(addr__x)
);

//==============================
// d_flip_flop__size__x
//==============================
d_flip_flop #(.WIDTH(2)) d_flip_flop__size__x
(
    .clk(clk),
    .rst(rst),
    .en(en__size__x),
    .d(size),
    .q(size__x)
);

//==============================
// d_flip_flop__wr_data__x
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__wr_data__x
(
    .clk(clk),
    .rst(rst),
    .en(en__wr_data__x),
    .d(wr_data),
    .q(wr_data__x)
);

//==============================
// d_flip_flop__rd_data__x
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__rd_data__x
(
    .clk(clk),
    .rst(rst),
    .en(en__rd_data__x),
    .d(rd_data__x__n),
    .q(rd_data__x)
);

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(6), .RESET_VALUE(STATE__RESET)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);


endmodule

