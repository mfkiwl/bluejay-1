//==============================================
// counter
//==============================================
module debouncer
(
    input logic clk,
    input logic rst,
    input logic in,
    output logic out
);
    

parameter DEBOUNCE_COUNT = 20'd1_000_000;
parameter DEBOUNCE_COUNT__LOG2 = 20;


logic [DEBOUNCE_COUNT__LOG2:0] count;
logic in_prev;


always_ff @(posedge clk) begin
    in_prev <= in;
end
    

always_ff @(posedge clk) begin
    out <= (count == DEBOUNCE_COUNT) ? in_prev : out;
end
    

always_ff @(posedge clk) begin
    if (rst) begin
        count <= 0;
    else begin
        if (in == in_prev) begin
            count <= (count == DEBOUNCE_COUNT) ?  DEBOUNCE_COUNT : count + 1;
        end
        else begin
            count <= 0;
        end
    end
end

endmodule

