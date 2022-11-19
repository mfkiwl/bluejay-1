//==============================================
// platform_level_interrupt_controller_core
//==============================================
module platform_level_interrupt_controller_core
(
    input clk,
    input rst,
);




//==============================
// 
//==============================
PLIC_mux context__0__mux__0 
(
    .clk(clk),
    .rst(rst),
    .id__a(id__0),
    .ie__a(context__0__ie__0),
    .ip__a(ip__0),
    .priority__a(priority__0),
    .id__b(id__1),
    .ie__b(context__0__ie__1),
    .ip__b(ip__1),
    .priority__b(priority__1),
    .id__c(context__0__mux__0__id),
    .ie__c(context__0__mux__0__ie),
    .ip__c(context__0__mux__0__ip),
    .priority__c(context__0__mux__0__priority)
);


assign context__0__id = context__0__mux__0__id;
assign context__0__eip = (context__0__mux__0__priority > context__0__threshold);




endmodule

