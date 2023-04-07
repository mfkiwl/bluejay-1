
mtime = {
    'addr': 0x0,
    'width': 64,
}

mtimecmp = {
    'addr': 0x8,
    'width': 64,
}


machine_timer_registers = {
    'group': 'machine_timer_registers',
    'base': 0x10000,
    'registers': {
        'mtime': mtime,
        'mtimecmp': mtime,
    },
}

print(machine_timer_registers)


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


csr = {
    'group': 'csr',
    'base': 0x0,
    'registers': {
        'misa': misa,
    }
}

print(csr)
