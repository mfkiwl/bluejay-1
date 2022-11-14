//==============================================
// binary_to_seven_segment
//==============================================
module binary_to_seven_segment
(
    input logic clk,
    input logic rst,
    input logic [3:0] n,
    output logic ca, 
    output logic cb, 
    output logic cc, 
    output logic cd, 
    output logic ce, 
    output logic cf, 
    output logic cg
);

always_comb begin
    case (n)
        4'h0: 
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b011_1111;
        end
        4'h1:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b000_0110;
        end
        4'h2:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b101_1011;
        end
        4'h3:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b100_1111;
        end
        4'h4:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b110_0110;
        end
        4'h5:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b110_1101;
        end
        4'h6:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b111_1101;
        end
        4'h7:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b000_0111;
        end
        4'h8:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b111_1111;
        end
        4'h9:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b110_1111;
        end
        4'ha:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b111_0111;
        end
        4'hb:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b111_1100;
        end
        4'hc:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b011_1001;
        end
        4'hd:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b101_1110;
        end
        4'he:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b111_1001;
        end
        4'hf:
        begin
            {cg, cf, ce, cd, cc, cb, ca} <= ~7'b111_0001;
        end
    endcase
end

endmodule
