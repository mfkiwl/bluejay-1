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
def diff(path):

    stdout = os.popen('find ' + path + '* -name "*.aout"').read()[:-1]

    total = 0
    passed = 0
    for aout in stdout.split():
        vout = re.sub('aout', 'vout', aout)
        total += 1
        
        if filecmp.cmp(vout, aout, shallow=False):
            passed += 1
            print('pass!')
        else:
            print('fail.')
            print(f'    asim: {asim}')
            print(f'    vsim: {vsim}')

    print(f'{passed}/{total}')

if __name__ == '__main__':
 
    if len(sys.argv) == 2:
        path = sys.argv[1]
        diff(path)

    else:
        print('[ERROR] Diff failed.')
