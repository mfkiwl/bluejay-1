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
from io import StringIO
import filecmp

        
########
# diff #
########
def get_symbol_addr(elf, symbol):
    stdout = os.popen('readelf -s ' + elf).read()

    #stdout = 'abcd'
    #match = re.search('^ *[0-9a-f]+: *[0-9a-f]+ *0 NOTYPE *GLOBAL DEFAULT *\d end_signature', stdout)
    #match = re.findall('ab', stdout)
    txt = re.findall('[0-9]+: [0-9]+[ \t]+0 NOTYPE  GLOBAL DEFAULT    [0-9] ' + symbol, stdout)[0]

    addr = re.split(' ', txt)[1]

    print(addr)


if __name__ == '__main__':
 
    if len(sys.argv) == 3:
        elf = sys.argv[1]
        symbol = sys.argv[2]
        get_symbol_addr(elf, symbol) 

    else:
        print('[ERROR] invalid args.')
