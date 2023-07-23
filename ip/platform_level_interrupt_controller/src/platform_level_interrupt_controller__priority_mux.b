//==============================================
// platform_level_interrupt_controller__
//==============================================
module platform_level_interrupt_controller__priority_mux
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
