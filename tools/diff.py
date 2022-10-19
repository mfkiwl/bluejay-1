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
def diff(f0, f1):
    if filecmp.cmp(f0, f1, shallow=False):
        print('pass!')
    else:
        print('fail.')

if __name__ == '__main__':
 
    if len(sys.argv) == 3:
        f0 = sys.argv[1]
        f1 = sys.argv[2]
        diff(f0, f1)

    else:
        print('[ERROR] invalid args.')
