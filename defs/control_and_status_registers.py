########
# misa #
########
misa = {
    'addr': 0x301,
    'width': 64,
    'fields': {
        'extensions': {
            'lsb': 0,
            'msb': 25,
            'values': {
                'I': 0x100,
            },
        },
        'wiri__0': {
            'lsb': 26,
            'msb': 61,
            'values': {
                'value': 0x0,
            },
        },
        'base': {
            'lsb': 62,
            'msb': 63,
            'values': {
               'rv64': 0x2, 
            },
        },
    },
}

#############
# mvendorid #
#############
mvendorid = {
    'addr': 0xf11,
    'width': 64,
    'fields': {
        'vendor': {
            'lsb': 0,
            'msb': 63,
            'values': {
                'value': 0x0, 
            },
        },
    },
}


control_and_status_registers = {
    'group': 'csr',
    'base_addr': 0x0,
    'size': 0x1000,
    'registers': {
        'misa': misa,
        'mvendorid': mvendorid,
    },
}


spec = control_and_status_registers
