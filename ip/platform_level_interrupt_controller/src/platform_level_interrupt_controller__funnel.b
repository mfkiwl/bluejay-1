//==============================================
// platform_level_interrupt_controller__funnel
//==============================================
module platform_level_interrupt_controller__funnel
(
    input clk,
    input rst,
PYTHON
(
    for i in range(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__NUMBER_OF_INTERRUPT_SOURCES):
        print(f"input [9:0] id__{i}")
        print(f"input ip__{i}")
        print(f"input ie__{i}")
        print(f"input [31:0] priority__{i}")
)
    output logic [9:0] id,
    output logic ip,
    output logic ie,
    output logic [31:0] priority
);


PYTHON
(
    for i in range(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__NUMBER_OF_INTERRUPT_SOURCES):
        print(f"assign mux__{i}__id__a = mux__{i-1}__id__c;")
        print(f"assign mux__{i}__ip__a = mux__{i-1}__ip__c;")
        print(f"assign mux__{i}__ie__a = mux__{i-1}__ie__c;")
        print(f"assign mux__{i}__priority__a = mux__{i-1}__priority__c;")
        print(f"assign mux__{i}__id__b = id__{i+1};")
        print(f"assign mux__{i}__ip__b = ip__{i+1};")
        print(f"assign mux__{i}__ie__b = ie__{i+1};")
        print(f"assign mux__{i}__priority__b = priority__{i+1};")

    print(f"")
    print(f"assign id = mux__{i}__id__c;")
    print(f"assign ip = mux__{i}__ip__c;")
    print(f"assign ie = mux__{i}__ie__c;")
    print(f"assign pri = mux__{i}__priority__c;")
)

PYTHON
(
    for i in range(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__NUMBER_OF_INTERRUPT_SOURCES):
        print(f"//==============================")
        print(f"// mux__{i}")
        print(f"//==============================")
        print(f"platform_level_interrupt_controller__mux mux__{i}")
        print(f"(")
        print(f"    .clk(clk),")
        print(f"    .rst(rst),")
        print(f"    .id__a(mux__{i}__id__a),")
        print(f"    .ie__a(mux__{i}__ie__a_),")
        print(f"    .ip__a(ip__a__{i}),")
        print(f"    .priority__a(priority__a__{i}),")
        print(f"    .id__b(id__b__{i}),")
        print(f"    .ie__b(ie__b__{i}),")
        print(f"    .ip__b(ip__b__{i}),")
        print(f"    .priority__b(priority__b__{i}),")
        print(f"    .id__c(id__c__{i}),")
        print(f"    .ie__c(ie__c__{i}),")
        print(f"    .ip__c(ip__c__{i}),")
        print(f"    .priority__c(priority__c__{i})")
        print(f");")
        print(f"")
)

endmodule
