//==============================================
// platform_level_interrupt_controller__priority_mux
//==============================================
module platform_level_interrupt_controller__priority_mux
(
    clk,
    rst,
    id__a,
    ie__a,
    ip__a,
    priority__a,
    id__b,
    ie__b,
    ip__b,
    priority__b,
    id__c,
    ie__c,
    ip__c,
    priority__c
);

input clk;
input rst;
input [9:0] id__a;
input ie__a;
input ip__a;
input [31:0] priority__a;
input [9:0] id__b;
input ie__b;
input ip__b;
input [31:0] priority__b;
output [9:0] id__c;
output ie__c;
output ip__c;
output [31:0] priority__c;

logic clk;
logic rst;
logic [9:0] id__a;
logic ie__a;
logic ip__a;
logic [31:0] priority__a;
logic [9:0] id__b;
logic ie__b;
logic ip__b;
logic [31:0] priority__b;
logic [9:0] id__c;
logic ie__c;
logic ip__c;
logic [31:0] priority__c;


always_comb
begin
    if (({32{ip__b}} & {32{ie__b}} & priority__b[31:0]) > ({32{ip__a}} & {32{ie__a}} & priority__a[31:0]))
    begin
        id__c = id__b;
        ie__c = ie__b;
        ip__c = ip__b;
        priority__c = priority__b;
    end
    else
    begin
        id__c = id__a;
        ie__c = ie__a;
        ip__c = ip__a;
        priority__c = priority__a;
    end
end

endmodule
