//==============================================
// tx
//==============================================
module tx
(
    input clk,
    input rst,
    input valid,
    output logic ready,
    input [WIDTH-1:0] data,
    output logic tx__valid,
    output logic [WIDTH-1:0] tx__data,
    input tx__credit
);

parameter WIDTH = 1;
parameter MAX_CREDITS = 1;
parameter MAX_CREDITS__LOG2 = 0;


logic [MAX_CREDITS__LOG2:0] credits;

assign ready = (credits != 0) & ~rst;

always_ff @(posedge clk) begin
    if (rst) credits <= MAX_CREDITS;
    else begin
        if (valid & ready) begin
            if (tx__credit) begin
                credits <= credits;
            end 
            else begin
                credits <= credits - 1;
            end
        end
        else begin
            if (tx__credit) begin
                credits <= credits + 1;
            end
            else begin
                credits <= credits;
            end
        end
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        tx__valid <= 1'b0;
    end
    else begin
        if (valid & ready) begin
            tx__valid <= 1'b1;
            tx__data <= data;
        end else begin
            tx__valid <= 1'b0;
            tx__data <= tx__data;
        end
    end
end

endmodule



