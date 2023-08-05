//==============================================
// platform_level_interrupt_controller__mux
//==============================================
module platform_level_interrupt_controller__mux
(
    input clk,
    input rst,
    input [9:0] id__a,
    input ie__a,
    input ip__a,
    input [31:0] priority__a,
    input [9:0] id__b,
    input ie__b,
    input ip__b,
    input [31:0] priority__b,
    output logic [9:0] id__c,
    output logic ie__c,
    output logic ip__c,
    output logic [31:0] priority__c
);

logic sel;
logic [31:0] a;
logic [31:0] b;

localparam SEL__A = 1'b0;
localparam SEL__B = 1'b1;

assign a = {32{ip__a}} & {32{ie__a}} & priority__b;
assign b = {32{ip__b}} & {32{ie__b}} & priority__b;

assign sel = a > b ? SEL__A : b > a ? SEL__B : id__a > id__b : SEL__B : SEL__A;

always_comb
begin
    case (sel)
        SEL__A:
        begin
            id__c = id__a;
            ip__c = ip__a;
            ie__c = ie__a;
            priority__c = priority__a;
        end
        SEL__B:
        begin
            id__c = id__b;
            ip__c = ip__b;
            ie__c = ie__b;
            priority__c = priority__b;
        end
    endcase
end

endmodule


