//==============================================
// rx
//==============================================
module rx
(
    input clk,
    input rst,
    output logic valid,
    input ready,
    output logic [WIDTH-1:0] data,
    input rx__valid,
    input [WIDTH-1:0] rx__data,
    output logic rx__credit
);

parameter WIDTH = 1;
parameter MAX_CREDITS = 1;
parameter MAX_CREDITS__LOG2 = 0;


// Buffer. The buffer is empty when get == put.
logic [WIDTH-1:0] buffer [MAX_CREDITS:0];
logic [MAX_CREDITS__LOG2:0] get;
logic [MAX_CREDITS__LOG2:0] put;

assign data = buffer[get];
assign valid = (get != put);

always_ff @(posedge clk) begin
    if (rst) begin
        rx__credit <= 1'b0;
    end
    else begin
        rx__credit <= valid & ready;
    end
end

always_ff @(posedge clk) begin
    if (rx__valid) begin
        buffer[put] = rx__data;
    end
end


always_ff @(posedge clk) begin
    if (rst) begin
        put <= 0;
    end
    else begin
        if (rx__valid) begin
            put <= (put == MAX_CREDITS) ? 0 : put + 1;
        end
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        get <= 0;
    end
    else begin
        if (valid & ready) begin
            get <= (get == MAX_CREDITS) ? 0: get + 1;
        end
    end
end

endmodule