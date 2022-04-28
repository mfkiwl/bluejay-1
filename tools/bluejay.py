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

###########
# Bluejay #
###########
class Bluejay:
    ############
    # __init__ #
    ############
    def __init__(self, txt, defines = {}):
        # the src rtl
        self.txt = txt 
        # initialize the system verilog (sv) file to an empty string
        self.sv = ''
        # dictionary with defines
        self.defines = defines

    #########
    # build #
    #########
    def build(self):
        txt = self.txt
        txt = self.find_and_replace(txt)
        # txt = self.eval_func(txt, 'LOG2', self.log2)
        txt = self.eval_func(txt, 'PYTHON', self.python)
        txt = self.fold_constants(txt)
        self.sv = txt

    #########
    # clean #
    #########
    def clean(self, string):
        # convert tabs to spaces
        string = re.sub('\t+', ' ', string)
        # replace multiple spaces with a single space
        string = re.sub(' +', ' ', string)
        # remove any spaces before the begining of the string
        string = re.sub('^ *', '', string)
        # remove any spaces before the end of the string
        string = re.sub(' $', '', string)
        return string

    #################
    # string_to_int #
    #################
    def string_to_int(self, string):
        # remove '_'
        string = re.sub('_', '', string)

        # check if string is a decimal number
        if bool(re.match('^-?[0-9]+$', string)):
            return int(string)
        # check if string is a hex number
        elif bool(re.match('^0x[0-9a-f]+$', string)):
            return int(string, base = 16)
        # check if string is a binary number
        elif bool(re.match('^0b[0-1]+$', string)):
            return int(string, base = 2)
        
        return None

    ####################
    # find_and_replace #
    ####################
    def find_and_replace(self, txt):
        # find and replace of key, value pairs
        for key, value in self.defines.items():
            txt = re.sub(r'\b' + key + r'\b', value, txt)
        return txt

    ####################
    # find_and_replace #
    ####################
    def fold_constants(self, txt):
        while True:
            # save a copy of txt at the start of each iteration
            temp = txt
            # search for an mathematical expression (constants only)
            match = re.search('[ \[\(]-?[0-9]+ *[-+\/*] *-?[0-9]+', txt)
            # return if there are no matches
            if match is None:
                return txt

            # get matched string
            string = match.group(0)[1:]

            # replace the expression with the simplified version
            txt = txt.replace(string, str(int(eval(string))))

            # if txt has not changed, return
            if txt == temp:
                return txt

    ##########
    # python #
    ##########
    def python(self, arg, indent):
        # create temporary .py file
        filename = 'build_abcdefg.py'
        with open(filename, 'w') as file:
            file.write(self.remove_indent(arg, indent))

        # run temporary .py file and capture the output
        stdout = os.popen('python3 ' + filename).read()

        # remove '\n' character from the end of the string (if there is one)
        if stdout[-1] == '\n':
            stdout = stdout[:-1]
        stdout = self.add_indent(stdout, indent)

        os.system('rm build_abcdefg.py')

        return stdout

    ########
    # log2 #
    ########
    def log2(self, arg, indent):
        arg = self.clean(arg)
        N = self.string_to_int(arg)
        return str(math.ceil(math.log2(N)))

    #############
    # eval_func #
    #############
    def eval_func(self, txt, name, func):
        while True:
            # search for name in txt
            match = re.search(name, txt)
            # exit loop if there are no matches
            if match is None:
                break

            # get the start index
            index = match.start()
            # get the function's parentheses
            parentheses = self.find_parentheses(txt, index)
            # get argument string
            arg = txt[parentheses[0] + 1:parentheses[1]]
            # get the indentation level
            indent = self.get_indent(txt, index)

            # get the string to replace the function
            string = func(arg, indent)

            # replace original string in txt
            txt = txt[:index] + string + txt[parentheses[1] + 1:]

        return txt

    ####################
    # find_parentheses #
    ####################
    def find_parentheses(self, txt, index):
        parentheses = [None, None]
        # search for the left parenthesis
        while index < len(txt):
            if txt[index] == '(':
                parentheses[0] = index
                break
            index += 1

        if parentheses[0] is None:
            return parentheses

        count = 0
        # search for matching right parenthesis
        while index < len(txt):
            if txt[index] == '(':
                count += 1
            if txt[index] == ')':
                count -= 1
            if count == 0:
                parentheses[1] = index
                break
            index += 1
        return parentheses

    ##############
    # get_indent #
    ##############
    def get_indent(self, txt, index):
        count = 0
        while index >= 0:
            if txt[index] == '\n':
                return count - 1
            count += 1
            index -= 1
        return count - 1

    #################
    # remove_indent #
    #################
    def remove_indent(self, string, indent):
        return re.sub('\n' + ' '*indent, '\n', string)

    ##############
    # add_indent #
    ##############
    def add_indent(self, string, indent):
        return re.sub('\n', '\n' + ' '*indent, string)



# if __name__ == '__main__':
# 
#     if len(sys.argv) == 2:
#         filename = sys.argv[1]
#         bluejay = Build(filename)
#         build.build()
#     else:
#         print('[ERROR]')
