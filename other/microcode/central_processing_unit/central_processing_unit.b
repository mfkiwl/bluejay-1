//==============================================================
// central_processing_unit
//==============================================================
module central_processing_unit
(
    input clk,
    input rst,
);


//==============================
// register_file__0
//==============================
register_file register_file__0
(
    .clk(clk),
    .rst(rst),
    .we(we),
    .rd_addr__0(rd_addr__0),
    .rd_data__0(rd_data__0),
    .rd_addr__1(rd_addr__1),
    .rd_data__1(rd_data__1),
    .wr_addr(wr_addr),
    .wr_data(wr_data)
);

always_comb begin
    case (state)
        //==============================
        // STATE__IF____PC__MEM_ADDR
        //==============================
        STATE__IF____PC__MEM_ADDR:
        begin
            state_n = STATE__IF____MEM_RD_DATA__IR;
        end

        //==============================
        // STATE__IF____MEM_RD_DATA__IR
        //==============================
        STATE__IF____MEM_RD_DATA__IR:
        begin
            state_n = STATE__ID;
        end

        //==============================
        // STATE__ID
        //==============================
        STATE__ID:
        begin
            state_n = STATE__ALU_REG_REG____RF_RD_DATA_0__ALU_DATA_0;
        end

        //==============================
        // STATE__ALU_REG_REG____RF_RD_DATA_0__ALU_DATA_0
        //==============================
        STATE__ALU_REG_REG____RF_RD_DATA_0__ALU_DATA_0:
        begin
            state_n = STATE__ALU_REG_REG____RF_RD_DATA_1__ALU_DATA_1;
        end

        //==============================
        // STATE__ALU_REG_REG____RF_RD_DATA_1__ALU_DATA_1
        //==============================
        STATE__ALU_REG_REG____RF_RD_DATA_1__ALU_DATA_1:
        begin
            state_n = STATE__ALU_REG_REG____ALU_DATA_2__RF_WR_DATA;
        end

        //==============================
        // STATE__ALU_REG_REG____ALU_DATA_2__RF_WR_DATA
        //==============================
        STATE__ALU_REG_REG____ALU_DATA_2__RF_WR_DATA:
        begin
            state_n = STATE__PC_PLUS_FOUR____PC__DATA_0;
        end

        //==============================
        // STATE__ALU_REG_IMM____RF_RD_DATA_0__ALU_DATA_0
        //==============================
        STATE__ALU_REG_IMM____RF_RD_DATA_0__ALU_DATA_0:
        begin
            state_n = STATE__ALU_REG_IMM____IMM__ALU_DATA_1;
        end

        //==============================
        // STATE__ALU_REG_IMM____IMM__ALU_DATA_1
        //==============================
        STATE__ALU_REG_IMM____IMM__ALU_DATA_1:
        begin
            state_n = STATE__ALU_REG_IMM____ALU_DATA_2__RF_WR_DATA;
        end

        //==============================
        // STATE__ALU_REG_IMM____ALU_DATA_2__RF_WR_DATA
        //==============================
        STATE__ALU_REG_IMM____ALU_DATA_2__RF_WR_DATA:
        begin
            state_n = STATE__PC_PLUS_FOUR____PC__DATA_0;
        end

        //==============================
        // STATE__BRANCH____RF_RD_DATA_0__ALU_DATA_0
        //==============================
        STATE__BRANCH____RF_RD_DATA_0__ALU_DATA_0:
        begin
            state_n = STATE__BRANCH____RF_RD_DATA_1__ALU_DATA_1;
        end

        //==============================
        // STATE__BRANCH____RF_RD_DATA_1__ALU_DATA_1
        //==============================
        STATE__BRANCH____RF_RD_DATA_1__ALU_DATA_1:
        begin
            state_n = STATE__BRANCH____COMPARE;
        end

        //==============================
        // STATE__BRANCH____COMPARE
        //==============================
        STATE__BRANCH____COMPARE:
        begin
            case ()
                CTRL_FLOW__BEQ: state_n = eq ? STATE__PC_PLUS_IMM____PC__ALU_DATA_0 : STATE__PC_PLUS_FOUR____PC__ALU_DATA_0;
                CTRL_FLOW__BNE: state_n = ne ? STATE__PC_PLUS_IMM____PC__ALU_DATA_0 : STATE__PC_PLUS_FOUR____PC__ALU_DATA_0;
                CTRL_FLOW__BLT: state_n = lt ? STATE__PC_PLUS_IMM____PC__ALU_DATA_0 : STATE__PC_PLUS_FOUR____PC__ALU_DATA_0;
                CTRL_FLOW__BLTU: state_n = ltu ? STATE__PC_PLUS_IMM____PC__ALU_DATA_0 : STATE__PC_PLUS_FOUR____PC__ALU_DATA_0;
                CTRL_FLOW__BGE: state_n = ge ? STATE__PC_PLUS_IMM____PC__ALU_DATA_0 : STATE__PC_PLUS_FOUR____PC__ALU_DATA_0;
                CTRL_FLOW__BGEU: state_n = geu ? STATE__PC_PLUS_IMM____PC__ALU_DATA_0 : STATE__PC_PLUS_FOUR____PC__ALU_DATA_0;
        end

        //==============================
        // STATE__JAL____PC__ALU_DATA_0
        //==============================
        STATE__JAL____PC__ALU_DATA_0:
        begin
            state_n = STATE__JAL____FOUR__ALU_DATA_1;
        end

        //==============================
        // STATE__JAL____FOUR__ALU_DATA_1
        //==============================
        STATE__JAL____FOUR__ALU_DATA_1:
        begin
            state_n = STATE__JAL____ALU_DATA_2__RF_WR_DATA;
        end

        //==============================
        // STATE__JAL____ALU_DATA_2__RF_WR_DATA
        //==============================
        STATE__JAL____ALU_DATA_2__RF_WR_DATA:
        begin
            state_n = STATE__PC_PLUS_IMM____PC__ALU_DATA_0;
        end

        //==============================
        // STATE__JALR____PC__ALU_DATA_0
        //==============================
        STATE__JALR____PC__ALU_DATA_0:
        begin
            state_n = STATE__JALR____FOUR__ALU_DATA_1;
        end

        //==============================
        // STATE__JALR____FOUR__ALU_DATA_1
        //==============================
        STATE__JALR____FOUR__ALU_DATA_1:
        begin
            state_n = STATE__JALR____ALU_DATA_2__PC_TEMP;
        end

        //==============================
        // STATE__JALR____ALU_DATA_2__PC_TEMP
        //==============================
        STATE__JALR____ALU_DATA_2__PC_TEMP:
        begin
            state_n = STATE__JALR____RF_RD_DATA_0__ALU_DATA_0;
        end

        //==============================
        // STATE__JALR____RF_RD_DATA_0__ALU_DATA_0
        //==============================
        STATE__JALR____RF_RD_DATA_0__ALU_DATA_0:
        begin
            state_n = STATE__JALR____IMM__ALU_DATA_1;
        end

        //==============================
        // STATE__JALR____IMM__ALU_DATA_1
        //==============================
        STATE__JALR____IMM__ALU_DATA_1:
        begin
            state_n = STATE__JALR____STATE__JALR____PC__RF_WR_DATA;
        end

        //==============================
        // STATE__JALR____PC__RF_WR_DATA
        //==============================
        STATE__JALR____PC__RF_WR_DATA:
        begin
            state_n = STATE__JALR____ALU_DATA_2__PC;
        end

        //==============================
        // STATE__JALR____ALU_DATA_2__PC
        //==============================
        STATE__JALR____ALU_DATA_2__PC:
        begin
            state_n = STATE__IF____PC__MEM_ADDR;
        end

        //==============================
        // STATE__PC_PLUS_FOUR____PC__ALU_DATA_0
        //==============================
        STATE__PC_PLUS_FOUR____PC__ALU_DATA_0:
        begin
            state_n = STATE__PC_PLUS_FOUR____FOUR__ALU_DATA_1;
        end

        //==============================
        // STATE__PC_PLUS_FOUR____FOUR__ALU_DATA_1
        //==============================
        STATE__PC_PLUS_FOUR____FOUR__ALU_DATA_1:
        begin
            state_n = STATE__PC_PLUS_FOUR____ALU_DATA_2__PC;
        end

        //==============================
        // STATE__PC_PLUS_FOUR____ALU_DATA_2__PC
        //==============================
        STATE__PC_PLUS_FOUR____ALU_DATA_2__PC:
        begin
            state_n = STATE__IF____PC__MEM_ADDR;
        end

        //==============================
        // STATE__PC_PLUS_IMM____PC__ALU_DATA_0
        //==============================
        STATE__PC_PLUS_IMM____PC__ALU_DATA_0:
        begin
            state_n = STATE__PC_PLUS_IMM____IMM__ALU_DATA_1;
        end

        //==============================
        // STATE__PC_PLUS_IMM____IMM__ALU_DATA_1
        //==============================
        STATE__PC_PLUS_IMM____IMM__ALU_DATA_1:
        begin
            state_n = STATE__PC_PLUS_IMM____ALU_DATA_2__PC;
        end

        //==============================
        // STATE__PC_PLUS_IMM____ALU_DATA_2__PC
        //==============================
        STATE__PC_PLUS_IMM____ALU_DATA_2__PC:
        begin
            state_n = STATE__IF____PC__MEM_ADDR;
        end
    endcase
end

always_ff @(posedge clk) begin
    if (rst) state <= STATE__IF____PC__MEM_ADDR;
    else state <= state_n;
end

endmodule
