//==============================================
// l1_sram
//==============================================
module l1_sram
(
    input clk,
    input rst,
    input addr,
    input rw,
    input wr_data,
    output logic rd_data
);

    logic [565:0] data [11:6];

    assign rd_data = data[addr];

    always @(posedge clk) begin
        if (rst) begin
            data[{i}][565] <= 1'b0;
            data[{i}][565] <= 1'b0;
            data[{i}][565] <= 1'b0;
            data[{i}][565] <= 1'b0;
            data[{i}][565] <= 1'b0;
            data[{i}][565] <= 1'b0;
        end
        else begin
            if (rw) data[addr] <= wr_data;
        end
    end


endmodule