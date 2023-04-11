import sys
import math

class Builder:
    ############
    # __init__ #
    ############
    def __init__(self, spec):
        self.spec = spec
        self.defs__sv = {}
        self.defs__c = {}


    ########
    # log2 #
    ########
    def log2(self, value):
        if value == 0:
            return 0
        else:
            return int(math.log2(value))

    #############
    # sv_format #
    #############
    def sv_format(self, value, width):
        if self.log2(value) > width:
            raise Exception(f'[ERROR] The value {value} is greater than the maximum value which can be represeted with {width} bits.')
            
        if width == 1:
            return f"{width}'b{bin(value)[2:]}" 
        else:
            return f"{width}'h{hex(value)[2:]}" 


    #########
    # build #
    #########
    def build(self):
        group = self.spec["group"]
        base_addr = self.spec["base_addr"]
        size = self.spec["size"]

        # <group>__BASE_ADDR 
        self.defs__sv[group.upper() + "__" + "BASE_ADDR"] = self.sv_format(base_addr, self.log2(size))
        self.defs__c[group.upper() + "__" + "BASE_ADDR"] = hex(base_addr) 

        for reg in self.spec["registers"]:
            reg__addr = self.spec["registers"][reg]["addr"]

            # <group>__<reg>__ADDR
            self.defs__sv[group.upper() + "__" + reg.upper() + "__" + "ADDR"] = self.sv_format(reg__addr, self.log2(size))
            self.defs__c[group.upper() + "__" + reg.upper() + "__" + "ADDR"] = hex(reg__addr) 


            for field in self.spec["registers"][reg]["fields"]:
                field__lsb = self.spec['registers'][reg]["fields"][field]["lsb"]   
                field__msb = self.spec['registers'][reg]["fields"][field]["msb"]
                field__width = field__msb - field__lsb + 1

                # <group>__<reg>__<field>__WIDTH
                self.defs__sv[group.upper() + "__" + reg.upper() + "__" + field.upper() + "__" + "WIDTH"] = str(field__width)
                self.defs__c[group.upper() + "__" + reg.upper() + "__" + field.upper() + "__" + "WIDTH"] = str(field__width) 

                # <group>__<reg>__<field>__FIELD
                self.defs__sv[group.upper() + "__" + reg.upper() + "__" + field.upper() + "__" + "FIELD"] = str(field__msb) + ":" + str(field__lsb) 


                for value in self.spec["registers"][reg]["fields"][field]["values"]:
                    value__value = self.spec['registers'][reg]["fields"][field]["values"][value]
                    
                    # <group>__<reg>__<field>__<value>
                    self.defs__sv[group.upper() + "__" + reg.upper() + "__" + field.upper() + "__" + value.upper()] = self.sv_format(value__value, field__width) 
                    self.defs__c[group.upper() + "__" + reg.upper() + "__" + field.upper() + "__" + value.upper()] = hex(value__value)



def format(key, value):
    return f"defs['{key}']: {value}\n" 


if __name__ == '__main__':
 
    if len(sys.argv) == 3:


        filename = sys.argv[1]
        filename__py = sys.argv[2]


        with open(filename, 'r') as file:
            exec(file.read())  

        
        txt = ''

        builder = Builder(spec)
        builder.build()
        print(builder.defs__sv)

        #key = spec["region"].upper() + "__BASE_ADDR"
        #value = str(int(math.log2(spec["width"]/8))) + "'h" + hex(spec["base"])[2:]
        #txt += format(key, value) 
        #print(key)
        #print(value)
        #print(txt) 

            #for reg in x['registers']:


    else:
        raise Exception(f'[ERROR]')
