##########
# import #
##########
import sys
sys.path.append("/home/seankent/bluejay/defs")
import math
import re
import ast
import os
import sys
import platform
import csv
from io import StringIO
from defs import defs

#defs = {
#"OP__NOP": "6'h0",
#"OP__LB": "6'h1",
#}


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
        #tokens = re.split(r'([:/ .,;\(\)\{\}\[\]\n+-=*])', txt)
        tokens = re.split(r'([:/ .,;\(\)\{\}\[\]\n+-])', txt)
        # remove empyt sting ('') from tokens
        tokens = list(filter(''.__ne__, tokens))
        return tokens

    ########
    # join #
    ########
    def join(self):
        return ''.join(self.tokens)

    ##############
    # substitute #
    ##############
    def substitute(self, token__0, token__1, idx__0, idx__1):
        """
        Parameters:
            token__0 (str): 
            token__1 (str): 
            idx__0 (int):
            idx__1 (int):
        """
        while idx__0 < idx__1:
            if self.tokens[idx__0] == token__0:
                self.tokens[idx__0] = token__1 
            idx__0 += 1

    ######################
    # macro_substitution #
    ######################
    def macro_substitution(self, defs):
        for token__0, token__1 in defs.items():
            self.substitute(token__0, token__1, 0, len(self.tokens))

    ##########
    # search #
    ##########
    def search(self, token__0, idx__0, idx__1):
        while idx__0 < idx__1:
            if self.tokens[idx__0] == token__0:
                return idx__0
            idx__0 += 1


    ##########
    # python #
    ##########
    def python(self):

        while True:
            # get index of 'PYTHON' tag
            idx__0 = self.search('PYTHON', 0, len(self.tokens))
    
            # if idx__0 is None exit the loop
            if idx__0 == None:
                break
            
            # get the index of the opening parenthesis, '('
            idx__1 = self.search('(', idx__0, len(self.tokens))
            # get the index of the closing parenthesis, ')'
            idx__2 = self.find_matching('(', ')', idx__1)

            # idx__3 will be the index of the first non-empty (not ' ' or '\n') token
            idx__3 = idx__1 + 1
            # idx__4 will be the index of the last '\n' before idx__3
            idx__4 = idx__1 + 1

            # iterate over the tokens between '(' and ')'
            while idx__3 < idx__2:
                if self.tokens[idx__3] == ' ':
                    idx__3 += 1
                elif self.tokens[idx__3] == '\n':
                    idx__4 = idx__3
                    idx__3 += 1
                else:
                    break

            # assemble the python code as a list of tokens
            tokens = []

            # iterate from the first non-empty token to the closing parenthesis and add each token to tokens
            # the initial indentation of the first non-empty token will be removed from each line 
            idx__5 = idx__3
            while idx__5 < idx__2:
                # add token to tokens
                tokens.append(self.tokens[idx__5])

                # remove indentation from each newline by incrementing idx__5
                if self.tokens[idx__5] == '\n': 
                    idx__6 = idx__5 + (idx__3 - idx__4) 
                    while idx__5 < idx__6:
                        idx__5 += 1
                        if self.tokens[idx__5] == '\n':
                            break
                else:
                    idx__5 += 1



            # write python code to a temporary file 
            filename = 'abcd.py'
            with open(filename, 'w') as file:
                file.write(''.join(tokens))

            # run the python code
            stdout = os.popen(f'python3 {filename}').read()

            os.system(f'rm {filename}')


            # run the python code
            #stdout = os.popen('python3 -c \"' + ''.join(tokens) + '\"').read()

            # tokentize the output of the code
            tokens = self.tokenize(stdout)

            # remove trailing '\n'
            if tokens[-1] == '\n': 
                tokens = tokens[:-1] 
            
            # replace the PYTHON call with the output of the code
            self.delete(idx__0, idx__2)
            self.splice(tokens, idx__0)


    ##########
    # splice #
    ##########
    def splice(self, tokens, idx__0):
        self.tokens = self.tokens[:idx__0] + tokens + self.tokens[idx__0:] 
        
    ##########
    # delete #
    ##########
    def delete(self, idx__0, idx__1):
        self.tokens = self.tokens[:idx__0] + self.tokens[idx__1 + 1:] 


    #################
    # find_matching #
    #################
    def find_matching(self, left, right, i):
        
        if self.tokens[i] != left: 
            print(f'[ERROR]: self.tokens[{i}] != {left}')
            return None

        count = 0
        for i in range(i, len(self.tokens)):
            if self.tokens[i] == left:
                count += 1
            if self.tokens[i] == right:
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
        self.python()


        

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
        #print(bluejay.tokens)
        #print(defs['CSR__MISA__WIRI__0__WIDTH'])

        with open(file__sv, 'w') as file:
            file.write(bluejay.join())


    else:
        print('[ERROR] Bluejay failed.')
