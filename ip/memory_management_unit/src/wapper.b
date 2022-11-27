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



always_comb begin
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
            state__n = cpu_to_mem__valid ? STATE__ACCEPT_REQ : STATE__READY;
        end

        //==============================
        // STATE__ACCEPT_REQ
        //==============================
        STATE__ACCEPT_REQ:
        begin
            cpu_to_mem__ready = 1'b1;
            we__n = cpu_to_mem__we;
            addr__n = cpu_to_mem__addr; 
            dtype__n = cpu_to_mem__dtype;
            wr_data__n = cpu_to_mem__data;
            state__n = STATE__PMA_CHECK;
        end

    endcase
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

