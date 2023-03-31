##########
# import #
##########
import math
import re
import ast
import os
import sys
import platform
import csv


defs = {
"OP__NOP": "6'h0",
"OP__LB": "6'h1",
}




###########
# Bluejay #
###########
class Bluejay:
    ############
    # __init__ #
    ############
    def __init__(self, defs):
        self.defs = defs 

    #########
    # build #
    #########
    def build(self, txt):
        for key, value in self.defs.items():
            txt = re.sub(r'\b' + key + r'\b', value, txt)
        return txt

        

if __name__ == '__main__':
 
    if len(sys.argv) == 3:
        file__b = sys.argv[1]
        file__sv = sys.argv[2]

        if platform.system() == 'Darwin':
            path = '/Users/seankent/Documents/bluejay/'
        elif platform.system() == 'Linux':
            path = '/home/seankent/bluejay/'
        else:
            path = '/mnt/c/Users/seanj/Documents/bluejay/'

        with open(file__b, 'r') as file:
            txt = file.read()

        with open(path + 'include/include.txt', 'r') as file:
            defines = define_to_dict(file.read())

        bluejay = Bluejay(txt, defines)
        bluejay.build()

        with open(file__sv, 'w') as file:
            file.write(bluejay.sv)


    else:
        print('[ERROR] Bluejay failed.')
