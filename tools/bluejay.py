##########
# import #
##########
import sys
sys.path.append("/home/seankent/bluejay/defs")
import copy
import math
import re
import ast
import os
import sys
import platform
import csv
from io import StringIO
from contextlib import redirect_stdout
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
    def __init__(self, tokens):
        self.tokens = copy.deepcopy(tokens)

    ###############
    # from_string #
    ###############
    @classmethod
    def from_string(cls, txt):
        return cls(Bluejay.tokenize(txt))

    ############
    # tokenize #
    ############
    @staticmethod
    def tokenize(txt):
        # split txt into tokens
        tokens = re.split(r'([:/ .,;\(\)\{\}\[\]\n+-])', txt)
        # remove empyt sting ('') from tokens
        tokens = list(filter(''.__ne__, tokens))
        return tokens

    ########
    # join #
    ########
    def join(self, idx__0 = None, idx__1 = None):
        idx__0, idx__1 = self.bound(idx__0, idx__1)
        return ''.join(self.tokens[idx__0:idx__1])

    #########
    # bound #
    #########
    def bound(self, idx__0, idx__1):
        if idx__0 is None:
            idx__0 = 0
        if idx__1 is None:
            idx__1 = len(self.tokens) 

        if idx__0 < 0:
            raise Execption(f'[ERROR] idx__0 ({idx__0}) < 0. idx__0 is out of range.')
        if idx__0 > len(self.tokens):
            raise Execption(f'[ERROR] idx__0 ({idx__0}) > len(self.tokens) ({len(self.tokens)}). idx__0 is out of range.')
        if idx__1 < 0:
            raise Execption(f'[ERROR] idx__1 ({idx__1}) < 0. idx__1 is out of range.')
        if idx__1 > len(self.tokens):
            raise Execption(f'[ERROR] idx__1 ({idx__1}) > len(self.tokens) ({len(self.tokens)}). idx__1 is out of range.')
        if idx__0 > idx__1:
            raise Execption(f'[ERROR] idx__0 ({idx__0}) > idx__1 ({idx__1}). idx__0 must be less than or equal to idx__1.')

        return idx__0, idx__1


    ##############
    # substitute #
    ##############
    def substitute(self, token__old, token__new, idx__0 = None, idx__1 = None):
        """
        Arguments:
            token__old (str): The token to search for.
            token__new (str): The token to replace the old value with.
            idx__0 (int): Start index.
            idx__1 (int): End index (exclusive).
        """
        idx__0, idx__1 = self.bound(idx__0, idx__1)

        while idx__0 < idx__1:
            if self.tokens[idx__0] == token__old:
                self.tokens[idx__0] = token__new 
            idx__0 += 1

    ######################
    # macro_substitution #
    ######################
    def macro_substitution(self, defs):
        for key, value in defs.items():
            self.substitute(key, value, 0, len(self.tokens))

    ##########
    # search #
    ##########
    def search(self, token, idx__0 = None, idx__1 = None):
        idx__0, idx__1 = self.bound(idx__0, idx__1)

        while idx__0 < idx__1:
            if self.tokens[idx__0] == token:
                break 
            idx__0 += 1

        return idx__0


    ###############
    # get_indent #
    ###############
    def get_indent(self, idx__0 = None, idx__1 = None):
        idx__0, idx__1 = self.bound(idx__0, idx__1)

        # find the indentation level of the first non-empty token
        idx__2 = idx__0
        while idx__0 < idx__1:
            if self.tokens[idx__0] == ' ':
                idx__0 += 1
            elif self.tokens[idx__0] == '\n':
                idx__0 += 1
                idx__2 = idx__0
            else:
                break
        return idx__0 - idx__2


    #################
    # remove_indent #
    #################
    def remove_indent(self, N, idx__0 = None, idx__1 = None):
        idx__0, idx__1 = self.bound(idx__0, idx__1)

        tokens = []
        idx__2 = min(idx__0 + N, self.search('\n', idx__0, idx__1))
        while idx__2 < idx__1:
            tokens.append(self.tokens[idx__2])

            if self.tokens[idx__2] == '\n': 
                idx__2 = min(idx__2 + N + 1, self.search('\n', idx__2 + 1, idx__1)) 
            else:
                idx__2 += 1

        self.replace(tokens, idx__0, idx__1)

    ##############
    # add_indent #
    ##############
    def add_indent(self, N, idx__0 = None, idx__1 = None):
        idx__0, idx__1 = self.bound(idx__0, idx__1)

        tokens = [' '] * N
        idx__2 = idx__0
        while idx__2 < idx__1:
            tokens.append(self.tokens[idx__2])

            if self.tokens[idx__2] == '\n': 
                tokens.extend([' ']*N)

            idx__2 += 1

        self.replace(tokens, idx__0, idx__1)
            
    ########
    # exec #
    ########
    def exec(self, txt):
        f = StringIO()
        with redirect_stdout(f):
            exec(txt)

        return f.getvalue() 


    ########
    # read #
    ########
    def read(self, filename):
        with open(filename, 'r') as file:
            return file.read()

    #########
    # write #
    #########
    def write(self, filename, txt):
        with open(filename, 'w') as file:
            file.write(txt)
        

    ##########
    # python #
    ##########
    def python(self):

        while True:
            # get index of 'PYTHON' tag
            idx__PYTHON = self.search('PYTHON')
            # if idx__PYTHON == len(self.tokens) (no match was found), exit the loop
            if idx__PYTHON == len(self.tokens):
                break

            # get the index of the opening parenthesis, '('
            idx__open = self.search('(', idx__PYTHON + 1)
            # get the index of the closing parenthesis, ')'
            idx__close = self.match('(', ')', idx__open)


            # create Bluejay object with the PYTHON(*)'s argument
            bluejay = Bluejay(self.tokens[idx__open + 1:idx__close])

            # remove any unnecessary indentation as this will result in an IndentationError when the code is executed
            bluejay.remove_indent(bluejay.get_indent())

    
            stdout = self.exec(bluejay.join())
            
            # tokentize the output of the code
            tokens = self.tokenize(stdout)
        

            # remove trailing '\n'
            if tokens[-1] == '\n': 
                tokens = tokens[:-1] 

            # replace the PYTHON(*) call with the output of the code
            self.replace(tokens, idx__PYTHON, idx__close + 1)


    ##########
    # splice #
    ##########
    def splice(self, tokens, idx__0):
        self.tokens = self.tokens[:idx__0] + copy.deepcopy(tokens) + self.tokens[idx__0:] 
        
    ##########
    # delete #
    ##########
    def delete(self, idx__0 = None, idx__1 = None):
        idx__0, idx__1 = self.bound(idx__0, idx__1)
        self.tokens = self.tokens[:idx__0] + self.tokens[idx__1:] 

    ###########
    # replace #
    ###########
    def replace(self, tokens, idx__0 = None, idx__1 = None):
        idx__0, idx__1 = self.bound(idx__0, idx__1)
        self.delete(idx__0, idx__1)
        self.splice(tokens, idx__0)


    #########
    # match #
    #########
    def match(self, token__open, token__close, idx__0):
        
        if self.tokens[idx__0] != token__open: 
            raise Execption(f'[ERROR] self.tokens[{idx__0}] ({self.tokens[{idx__0}]}) != token__open {token__open}. self.token[idx__0] must be equal to token__open.')

        count = 0
        while idx__0 < len(self.tokens):
            if self.tokens[idx__0] == token__open:
                count += 1
            if self.tokens[idx__0] == token__close:
                count -= 1

            if count == 0:
                break

            idx__0 += 1

        if count != 0:
            raise Execption(f'[ERROR] count ({count}) != 0. No matching token__close was found.')

        return idx__0 


    #########
    # build #
    #########
    def build(self, defs = {}):
        self.macro_substitution(defs)
        self.python()


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

        bluejay = Bluejay.from_string(txt)
        bluejay.build(defs)
        #bluejay.write(file__sv)
        print(bluejay.tokens)
        #print(defs['CSR__MISA__WIRI__0__WIDTH'])

        with open(file__sv, 'w') as file:
            file.write(bluejay.join())


    else:
        print('[ERROR] Bluejay failed.')
