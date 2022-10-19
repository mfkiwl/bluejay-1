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
# asim #
########
def asim(elf, aout):
    # run the spike simulator
    stdout = os.popen('spike pk ' + elf).read()

    # get the value of the a0 register
    txt = re.search('a0 [0-9a-f]+', stdout).group(0).split()[1]
    txt += '\n' 

    # write txt to the file
    with open(aout, 'w') as file:
        file.write(txt)


if __name__ == '__main__':
 
    if len(sys.argv) == 3:
        elf = sys.argv[1]
        aout = sys.argv[2]
        asim(elf, aout)

    else:
        print('[ERROR] Asim failed.')
