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

        
##############
# mem_to_coe #
##############
def mem_to_coe(filename):
     
    with open(filename, 'r') as file:
        
        
        txt = file.read() 
        txt = re.sub(' ', '', txt)

        txt__out = ''
        txt__out += 'memory_initialization_radix=16;\n'
        txt__out += 'memory_initialization_vector=\n'
    
        lines = re.split('\n', txt)[:-1]
       
        i = 0
        while i < len(lines):

            n = ''

            for j in range(i + 7, i - 1, -1):
                if j < len(lines):
                    n += lines[j] 
                else:
                    n += '00'
            txt__out += n

            if i + 8 < len(lines):
                txt__out += ',\n'
            else:
                txt__out += ';\n'

            i += 8 

        print(txt__out)

            #if i == len(lines) - 1:
            #    print(';')
            #else:
            #    print(',')


    #stdout = 'abcd'
    #match = re.search('^ *[0-9a-f]+: *[0-9a-f]+ *0 NOTYPE *GLOBAL DEFAULT *\d end_signature', stdout)
    #match = re.findall('ab', stdout)
    #txt = re.findall('[0-9]+: [0-9]+[ \t]+0 NOTYPE +GLOBAL DEFAULT    [0-9] ' + symbol, stdout)[0]

    #addr = re.split(' ', txt)[1]

    #print(addr)


if __name__ == '__main__':
 
    if len(sys.argv) == 2:
        filename = sys.argv[1]
        mem_to_coe(filename)

    else:
        print('[ERROR] invalid args.')
