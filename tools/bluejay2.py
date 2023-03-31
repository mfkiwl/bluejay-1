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
    def __init__(self, txt):
        self.tokens = self.tokenize(txt)

    ############
    # tokenize #
    ############
    def tokenize(self, txt):
        # split txt into tokens
        tokens = re.split(r'([:/ .,;\(\)\{\}\[\]\n])', txt)
        # remove empyt sting ('') from tokens
        tokens = list(filter(''.__ne__, tokens))
        return tokens

    ########
    # join #
    ########
    def join(self):
        return ''.join(self.tokens)

    ###########
    # replace #
    ###########
    def replace(self, key, value):
        for i in range(len(self.tokens)):
            if self.tokens[i] == key:
                self.tokens[i] = value

    ######################
    # macro_substitution #
    ######################
    def macro_substitution(self, defs):
        for key, value in defs.items():
            self.replace(key, value)

    ##########
    # search #
    ##########
    def search(self, key, i = 0):
        for i in range(i, len(self.tokens)):
            if self.tokens[i] == key:
                return i
        
    ##########
    # python #
    ##########
    def python(self):
        i = self.search('PYTHON')
        j = self.search('(', i)
        k = self.find_matching('(', ')', j)
        print(''.join(self.tokens[j:k+1]))
        print(i, j, k)


        
    #################
    # find_matching #
    #################
    def find_matching(self, lhs, rhs, i):
        
        if self.tokens[i] != lhs: 
            print(f'[ERROR]: self.tokens[{i}] != {lhs}')
            return None

        count = 0
        for i in range(i, len(self.tokens)):
            if self.tokens[i] == lhs:
                count += 1
            if self.tokens[i] == rhs:
                count -= 1
            if count == 0:
               return i 

        print(f'[ERROR]: Match not found')
        return None


    #########
    # build #
    #########
    def build(self, defs = {}):
        self.macro_substitution(defs)
        i = self.search('PYTHON')
        self.python()
        print(i)


        

##    #########
##    # write #
##    #########
##    @staticmethod
##    def write(filename, txt):
##        with open(filename, 'w') as file:
##            file.write(txt)
##
##    ########
##    # read #
##    ########
##    @staticmethod
##    def read(filename):
##        with open(filename, 'r') as file:
##            return file.read()
##
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

        bluejay = Bluejay(txt)
        bluejay.build(defs)
        #bluejay.write(file__sv)
        print(bluejay.tokens)

        with open(file__sv, 'w') as file:
            file.write(bluejay.join())


    else:
        print('[ERROR] Bluejay failed.')
