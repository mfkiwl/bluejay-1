//==============================================================
// interface__tx
//==============================================================
module interface__tx
(
    input clk,
    input rst,
    input valid,
    output logic ready,
    input [DATA_WIDTH-1:0] data,
    output logic if__valid,
    output logic [DATA_WIDTH-1:0] if__data,
    input if__credit
);
parameter MAX_CREDITS = 1;
parameter MAX_CREDITS__LOG2 = 0;
parameter DATA_WIDTH = 1;

logic [MAX_CREDITS__LOG2:0] credits;

assign ready = (credits != 0) & ~rst;

always_ff @(posedge clk) begin
    if (rst) credits <= MAX_CREDITS;
    else begin
        if ((valid & ready) & ~if__credit) credits <= credits - 1;
        if ((valid & ready) & if__credit) credits <= credits;
        if (~(valid & ready) & ~if__credit) credits <= credits;
        if (~(valid & ready) & if__credit) credits <= credits + 1;
    end
end

always_ff @(posedge clk) begin
    if (rst) if__valid <= 1'b0;
    else begin
        if (valid & ready) begin
            if__valid <= 1'b1;
            if__data <= data;
        end else begin
            if__valid <= 1'b0;
            if__data <= if__data;
        end
    end
end

endmodule

//==============================================================
// interface__rx
//==============================================================
module interface__rx
(
    input clk,
    input rst,
    output logic valid,
    input ready,
    output logic [DATA_WIDTH-1:0] data,
    input if__valid,
    input [DATA_WIDTH-1:0] if__data,
    output logic if__credit
);
parameter MAX_CREDITS = 1;
parameter MAX_CREDITS__LOG2 = 0;
parameter DATA_WIDTH = 1;

// Buffer. The buffer is empty when get == put.
logic [MAX_CREDITS__LOG2-1:0] buffer [DATA_WIDTH-1:0];
logic [MAX_CREDITS__LOG2-1:0] get;
logic [MAX_CREDITS__LOG2-1:0] put;

assign data = buffer[get];
assign valid = (get != put);

always_ff @(posedge clk) begin
    if (rst) if__credit <= 1'b0;
    else if__credit <= valid & ready;
end

always_ff @(posedge clk) begin
    if (rst) put <= 0;
    else put <= if__valid ? put + 1 : put;
end

always_ff @(posedge clk) begin
    if (rst) get <= 0;
    else get <= (valid & ready) ? get + 1 :get;
end

endmodule

