
mtime = {
    'addr': 0x0,
    'width': 64,
}

mtimecmp = {
    'addr': 0x8,
    'width': 64,
}


machine_timer_registers = {
    'region': 'machine_timer_registers',
    'base': 0x10000,
    'registers': {
        'mtime': mtime,
        'mtimecmp': mtime,
    },
}

#print(machine_timer_registers)


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



csr = {
    'region': 'csr',
    'base': 0x0,
    'registers': {
        'misa': misa,
        'mvendorid': mvendorid,
    }
}

#print(csr)


class Register:
    ############
    # __init__ #
    ############
    def __init__(self, addr, width, fields):
        self.addr = addr
        self.fields = {'extensions': {'lsb', }}


class Field:

    ############
    # __init__ #
    ############
    def __init__(self, lsb, msb, values):
        self.lsb = lsb
        self.msb = msb
        self.values = values

    #########
    # width #
    #########
    def width(self):
        return self.msb - self.lsb + 1


class Region:

    ############
    # __init__ #
    ############
    def __init__(self, region):
        self.region = region 







def mmio(x):
    defs = {}
    #print(x['region'].upper() + '__BASE_ADDR' + ' ' + str(x['base']))
    defs[x['region'].upper() + '__BASE_ADDR'] = x['base']
    for reg in x['registers']:
        print(reg)

    print(defs)

mmio(csr)

#field = Field('extensions', 0, 25, {'I': 0x100})
#print(field.width())

