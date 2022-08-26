//==============================================================
// l1_sram
//==============================================================
module l1_sram
(
    input clk,
    input rst,
    input [5:0] addr,
    input rw,
    input [L1_CACHE__SRAM__FIELD] wr_data,
    output logic [L1_CACHE__SRAM__FIELD] rd_data
);

    logic [L1_CACHE__SRAM__FIELD] data [5:0];

    assign rd_data = data[addr];

    always @(posedge clk) begin
        if (rst) begin
            PYTHON(for i in range(L1_CACHE__INDEX__WIDTH): print(f"data[{i}][L1_CACHE__SRAM__VALID__FIELD] <= 1'b0;"))
        end
        else begin
            if (rw) data[addr] <= wr_data;
        end
    end


endmodule