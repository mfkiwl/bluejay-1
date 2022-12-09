//==============================================
// memory_management_unit 
//==============================================
module memory_management_unit
(
    input clk,
    input rst,
    output logic [] addr;
    output logic ce__0;
    output logic ce__1;
);




logic [3:0] state;
logic [3:0] state__n;

always_comb
begin
    casez (addr)
        MEMORY_MAP__R0:
        begin
            pma__addr = 4'b0;
        end
        MEMORY_MAP__R1:
        begin
            state__n = we ? STATE__R1__WRITE__0 : STATE__R1__READ__0;
        end
    endcase
end





always_comb 
begin
    state__n = state;
        
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
            state__n = cpu_to_mem__valid ? STATE__DECODE : STATE__READY;
        end

        //==============================
        // STATE__DECODE
        //==============================
        STATE__DECODE:
        begin
            casez (addr)
                MEMORY_MAP__R0:
                begin
                    state__n = STATE__MM__0__0;
                end
                MEMORY_MAP__R1:
                begin
                    state__n = we ? STATE__R1__WRITE__0 : STATE__R1__READ__0;
                end
            endcase
        end

        //==============================
        // STATE__M
        //==============================
        STATE__M:
        begin
            ce__0 = 1'b1;    
            state__n = 
        end

    endcase
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__RESET;
    end
    else begin
        state <= state__n;
    end
end

always__ff @(posedge clk)
begin
    if (cpu_to_mem__valid)
    begin
        we <= cpu_to_mem__we;
        addr <= cpu_to_mem__addr;
        dtype <= cpu_to_mem__dtype;
        data <= cpu_to_mem__data;
    end
end



always_ff @(posedge clk) begin
    we <= we__n;
end

always_ff @(posedge clk) begin
    addr <= addr__n;
end

always_ff @(posedge clk) begin
    dtype <= dtype__n;
end

always_ff @(posedge clk) begin
    wr_data <= wr_data__n;
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__RESET;
    end
    else begin
        state <= state__n;
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        port__0 <= 8'h0;
    end
    else begin
        port__0 <= port__0__n;
    end
end


endmodule

