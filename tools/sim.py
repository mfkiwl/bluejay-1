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

#######
# Sim #
#######
class Sim():

    ############
    # __init__ #
    ############
    def __init__(self):

        os = platform.system()
        if os == 'Darwin':
            self.path = '/Users/seankent/Documents/bluejay/'
        else:
            self.path = '/mnt/c/Users/seanj/Documents/bluejay/'


    #######
    # run #
    #######
    def run(self):
        tests = ['add', 'loop']

        for test in tests:
            vout = self.path + 'sim/basic/results/' + test + '.vout'
            aout = self.path + 'sim/basic/results/' + test + '.aout'
            if self.diff(vout, aout):
                print('failed.')
            else:
                print('passed!')

        

    ########
    # diff #
    ########
    def diff(self, filename__0, filename__1):
        # read file 0
        with open(filename__0, 'r') as file:
            txt__0 = file.read()

        # read file 1
        with open(filename__1, 'r') as file:
            txt__1 = file.read()
            
        # compare files
        if txt__0 != txt__1:
            return True
        else:
            return False


if __name__ == '__main__':
    sim = Sim()
    sim.run()

