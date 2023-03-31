defs = {
    "CSR": {
        "MISA": {
            "addr": 0x301,
            "fields": {
               "EXTENSION": {
                    'lsb': 0,
                    'msb': 25,
                    'values': {
                    }
               }
            }
        }

    }
}


misa = {
    'addr': 0x301,
    'field': {
        'extensions': {
            'lsb': 0,
            'msb': 25,
            'value': {
                'i': 0x100,
            },
        },
        'base': {
            'lsb': 62,
            'msb': 63,
            'value': {
                'rv64': 0x2,
            },
        },
    },
}




{
'CSR__MISA': 0x301,
'CSR__MISA': 0x301,

#define CSR__MISA 0x301
#define CSR__MISA__EXTENSIONS__LSB 0 
#define CSR__MISA__EXTENSIONS__MSB 25 
#define CSR__MISA__EXTENSIONS__WIDTH 26 
#define CSR__MISA__EXTENSIONS__FIELD 25:0
#define CSR__MISA__EXTENSIONS__I 0x100 




csr = {
    'misa': {
        'addr': 0x301,
        'fields':
    }
}


interrupt_source_priority = {
    'addr': 0x0,
    'field': {
        'extensions': {
            'lsb': 0,
            'msb': 25,
            'value': {
                'i': 0x100,
            },
        },
        'base': {
            'lsb': 62,
            'msb': 63,
            'value': {
                'rv64': 0x2,
            },
        },
    },
}


{
    'interrupt_source_priority' = interrupt_source_priority,
}

{
    0x0: 'interrupt_source_priority',
}



#define PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR 40'b0000_0000_1001__0000_0000_0000_0000_0000_0000_0000
#define PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_SOURCE_PRIORITY__0 26'h0_00_00_00
#define PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_SOURCE_PRIORITY__1 26'h0_00_00_04
#define PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_PENDING_BITS__0_TO_31 26'h0_00_10_00
#define PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_ENABLE_BITS__0_TO_31__CONTEXT__0 26'h0_00_20_00
#define PLATFORM_LEVEL_INTERRUPT_CONTROLLER__PRIORITY_THRESHOLD__CONTEXT__0 26'h20_00_00
#define PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_CLAIM_COMPLETE__CONTEXT__0 26'h20_00_04


{
"OP__NOP": "6'h0",
"OP__LB": "6'h1",
}

#define OP__NOP 6'h0
#define OP__LB 6'h1
#define OP__LH 6'h2
#define OP__LW 6'h3
#define OP__LD 6'h4
#define OP__LBU 6'h5
#define OP__LHU 6'h6
#define OP__LWU 6'h7
#define OP__FENCE 6'h8
#define OP__FENCE_I 6'h9
#define OP__ADDI 6'ha
#define OP__SLLI 6'hb
#define OP__SLTI 6'hc



#define CSR__MISA 12'h301
#define CSR__MISA__EXTENSIONS__FIELD 25:0
#define CSR__MISA__EXTENSIONS__WIDTH 26 
#define CSR__MISA__EXTENSIONS__I 26'h0_00_01_00
#define CSR__MISA__WIRI__0__FIELD 61:26
#define CSR__MISA__WIRI__0__WIDTH 36 
#define CSR__MISA__WIRI__0__VALUE 36'h0
#define CSR__MISA__BASE__FIELD 63:62
#define CSR__MISA__BASE__WIDTH 2
#define CSR__MISA__BASE__RV64 2'h2
