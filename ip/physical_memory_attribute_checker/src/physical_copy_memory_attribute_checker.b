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

logic [3:0] state;
logic [3:0] state__n;


PYTHON
(
    states = [
        'STATE__IDLE',
        'STATE__MISALIGNED_ADDRESS',
    ]

    for i in range(len(states)):
        print(f"localparam {states[i]} = 8'h{i:x};") 
)


always_comb 
begin
    x__ready = 1'b0;
    x__resp = 1'b0;
    x__rd_data = {64{1'bx}};

    en = 8'h0;
                    
    case (state)
        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            casez (addr__x)
PYTHON
(
    for i in range(8):
        print(f"            MEMORY_MAP__REGION__{i}:")
        print(f"            begin")
        print(f"                state__n = x__cs ? STATE__REGION__{i}__PMA_CHECK : STATE__IDLE;")
        print(f"            end")
)
            default:
            begin
                state__n = x__cs ? STATE__ACCESS_FAULT : STATE__IDLE;
            end
            endcase
        end

        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
        end

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

endmodule
