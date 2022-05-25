//==============================================================
// l1_sram
//==============================================================
module l1_sram
(
    input clk,
    input rst,
    input [5:0] addr,
    input rw,
    input [565:0] wr_data,
    output logic [565:0] rd_data
);

    logic [565:0] data [5:0];

    assign rd_data = data[addr];

    always @(posedge clk) begin
        if (rst) begin
            data[0][565] <= 1'b0;
            data[1][565] <= 1'b0;
            data[2][565] <= 1'b0;
            data[3][565] <= 1'b0;
            data[4][565] <= 1'b0;
            data[5][565] <= 1'b0;
        end
        else begin
            if (rw) data[addr] <= wr_data;
        end
    end


endmodule