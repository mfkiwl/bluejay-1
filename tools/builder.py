import sys
sys.path.append("/Users/seankent/Documents/bluejay/defs")
import math
import copy

###########
# Builder #
###########
class Builder:
    ############
    # __init__ #
    ############
    def __init__(self, defs = {}):
        """
        Builder constructor. 
        
        Arguments:
            defs (dict): A hash of defines. 
        """
        self.defs = copy.deepcopy(defs)

    ########
    # read #
    ########
    def read(self, filename):
        """
        Reads from the specified file. 
        
        Arguments:
            filename (str): Name of file.
        """
        with open(filename, 'r') as file:
            return file.read()

    #########
    # write #
    #########
    def write(self, filename, txt):
        """
        Writes txt to the specified file. 
        
        Arguments:
            filename (str): Name of file.
            txt (str): String of text to be written.
        """
        with open(filename, 'w') as file:
            file.write(txt)

    ########
    # load #
    ########
    def load(self, filename):
        """
        Loads the specified "defs" file into self.defs.
        
        Arguments:
            filename (str): Name of file.
        """
        exec(open(filename).read(), None, {"defs": self.defs})

    #########
    # store #
    #########
    def store(self, filename, flavor = "sv"):
        """
        Runs self.build() and stores the result in the specified file.
        
        Arguments:
            filename (str): Name of file.
            flavor (str): The build flavor ("sv" for SystemVerilog and "c" for C/C++") 
        """
        self.write(filename, self.build(flavor))


    #########
    # build #
    #########
    def build(self, flavor = "sv"):
        """
        Returns a string of defines in the specified flavor.

        Arguments:
            flavor (str): The build flavor ("sv" for SystemVerilog and "c" for C/C++") 
        """
        txt = ""

        for key in self.defs:
            
            value = self.defs[key]["value"]

            # check if prefix is needed
            if ("prefix" in self.defs[key]) and (self.defs[key]["prefix"] != "none") and (flavor == "sv"):
                
                # check if value is given a a hexidecimal number
                if (len(self.defs[key]["value"]) >= 2) and (self.defs[key]["value"][:2] == "0x"):
                    value = self.defs[key]["prefix"] + "'h" + value[2:]
                # check if value is given a a binary number
                elif len(self.defs[key]["value"]) >= 2 and self.defs[key]["value"][:2] == "0b":
                    value = self.defs[key]["prefix"] + "'b" + value[2:]
                else:
                    value = self.defs[key]["prefix"] + "'d" + value

            if flavor == "sv":
                txt += f'defs["{key}"] = "{value}"\n'
            if flavor == "c":
                txt += f'#define {key} {value}\n'

        return txt


if __name__ == '__main__':
 
    #defs = {}
    #defs["XLEN"] = {"value": "64"}
    #defs["PC_RESET_VALUE"] = {"value": "0x80000000", "prefix": "64"}
    #defs["TEST__FIELD"] = {"value": "21:0"}

    if len(sys.argv) == 4:
        
        filename__in = sys.argv[1]
        filename__out = sys.argv[2]
        flavor = sys.argv[3]

        builder = Builder()
        builder.load(filename__in)
        builder.store(filename__out, flavor)

        #exec(open(filename__in).read())
        #for key in defs:
        #    if "prefix" in defs[key] and defs[key]["prefix"] != "none":
        #        if len(defs[key]["value"]) >= 2 and defs[key]["value"][:2] == "0x":
        #           txt += f'defs["{key}"] = "{defs[key]["prefix"]}\'h{defs[key]["value"][2:]}"\n'
        #        elif len(defs[key]["value"]) >= 2 and defs[key]["value"][:2] == "0b":
        #           txt += f'defs["{key}"] = "{defs[key]["prefix"]}\'b{defs[key]["value"][2:]}"\n'
        #        else:
        #           txt += f'defs["{key}"] = "{defs[key]["prefix"]}\'d{defs[key]["value"]}"\n'
        #    else: 
        #        txt += f'defs["{key}"] = "{defs[key]["value"]}"\n'
        #        
        #    #txt += f"#define {key} {defs['c'][key]}\n"
        #print("======================")
        #print(txt)

        #with open(filename, 'w') as file:
        #    file.write(txt)


    else:
        raise Exception(f'[ERROR] Invalid number of arguments provided.')
