##########
# import #
##########
import sys
import copy
import math
import re
import io
import contextlib


###########
# Bluejay #
###########
class Bluejay:
    ############
    # __init__ #
    ############
    def __init__(self, tokens = []):
        """
        Bluejay constructor. 
        
        Arguments:
            tokens (list): a list of tokens.
        """
        self.tokens = copy.deepcopy(tokens)

    ####################
    # init_from_string #
    ####################
    def init_from_string(txt):
        """
        Initializes self.tokens from an input string.
        
        Arguments:
            txt (str): Input string.
        """
        self.tokens = self.tokenize(txt)

    ########
    # load #
    ########
    def load(self, filename):
        """
        Loads the specified text file into self.tokens.
        
        Arguments:
            filename (str): Name of file.
        """
        self.tokens = self.tokenize(self.read(filename))

    #########
    # store #
    #########
    def store(self, filename):
        """
        Stores self.tokens into the specified file (as a string). 
        
        Arguments:
            filename (str): Name of file.
        """
        self.write(filename, self.join())

    ############
    # tokenize #
    ############
    def tokenize(self, txt):
        """
        Splits txt into a list of tokens.
        
        Arguments:
            txt (str): Input string.
        """
        # split txt into tokens
        tokens = re.split(r'([:/ .,;\(\)\{\}\[\]\n+-])', txt)
        # remove empyt sting ('') from tokens
        tokens = list(filter(''.__ne__, tokens))
        return tokens

    ########
    # join #
    ########
    def join(self, idx__0 = None, idx__1 = None):
        """
        Concatenates the tokens between idx__0 and idx__1 together to form a single string.
        
        Arguments:
            idx__0 (int): Start index.
            idx__1 (int): End index (exclusive).
        """
        idx__0, idx__1 = self.bound(idx__0, idx__1)
        return ''.join(self.tokens[idx__0:idx__1])

    #########
    # bound #
    #########
    def bound(self, idx__0, idx__1):
        """
        Ensures that idx__0 and idx__1 have values between 0 and len(self.tokens) and that idx__0 is less than or equal to idx__1. If idx__0 is None, its value will be set to 0. If idx__1 is None, its value will be set to len(self.tokens).
        
        Arguments:
            idx__0 (int): Start index.
            idx__1 (int): End index (exclusive).
        """
        if idx__0 is None:
            idx__0 = 0
        if idx__1 is None:
            idx__1 = len(self.tokens) 

        if idx__0 < 0:
            raise Exception(f'[ERROR] idx__0 ({idx__0}) < 0. idx__0 is out of range.')
        if idx__0 > len(self.tokens):
            raise Exception(f'[ERROR] idx__0 ({idx__0}) > len(self.tokens) ({len(self.tokens)}). idx__0 is out of range.')
        if idx__1 < 0:
            raise Exception(f'[ERROR] idx__1 ({idx__1}) < 0. idx__1 is out of range.')
        if idx__1 > len(self.tokens):
            raise Exception(f'[ERROR] idx__1 ({idx__1}) > len(self.tokens) ({len(self.tokens)}). idx__1 is out of range.')
        if idx__0 > idx__1:
            raise Exception(f'[ERROR] idx__0 ({idx__0}) > idx__1 ({idx__1}). idx__0 must be less than or equal to idx__1.')

        return idx__0, idx__1


    ##############
    # substitute #
    ##############
    def substitute(self, token__old, token__new, idx__0 = None, idx__1 = None):
        """
        Replaces all occurrences of token__old with token__new between idx__0 and idx__1.
        
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
    def macro_substitution(self, defs, idx__0 = None, idx__1 = None):
        """
        For each key/value pair in defs, replaces all occurrences of the 'key' token with 'value' token between idx__0 and ind__1.
        
        Arguments:
            defs (dict): A hash mapping each 'key' token to a corresponding 'value' token.
        """
        for key, value in defs.items():
            self.substitute(key, value, idx__0, idx__1)

    ##########
    # search #
    ##########
    def search(self, token, idx__0 = None, idx__1 = None):
        """
        Returns the index of the first occurence of token between idx__0 and idx__1.
        
        Arguments:
            token: The token to search for.
            idx__0 (int): Start index.
            idx__1 (int): End index (exclusive).
        """
        idx__0, idx__1 = self.bound(idx__0, idx__1)

        while idx__0 < idx__1:
            if self.tokens[idx__0] == token:
                break 
            idx__0 += 1

        return idx__0

    ###############
    # get_indent #
    ###############
    def get_indent(self, idx__0 = None):
        """
        Returns the indentation level of the first non-empty token (i.e. not ' ' or '\n'). If there are no newline tokens prior to the first non-empty token, the indentation level is given as the the number of spaces from idx__0 to the first non-empty token.
        
        Arguments:
            idx__0 (int): Start index.
        """
        idx__0, idx__1 = self.bound(idx__0, len(self.tokens))

        idx__newline = idx__0 - 1

        while idx__0 < idx__1:
            if self.tokens[idx__0] != ' ' and self.tokens[idx__0] != '\n':
                break

            if self.tokens[idx__0] == '\n':
                idx__newline = idx__0

            idx__0 += 1

        return idx__0 - idx__newline - 1


    #################
    # remove_indent #
    #################
    def remove_indent(self, N, idx__0 = None, idx__1 = None):
        """
        Removes N spaces from the beginning of each newline between idx__0 and idx__1.
        
        Arguments:
            N (int): Number of spaces to remove from each newline.
            idx__0 (int): Start index.
            idx__1 (int): End index (exclusive).
        """
        idx__0, idx__1 = self.bound(idx__0, idx__1)

        # save the initial value of idx__0, it will be needed later
        idx__0__init = idx__0

        tokens = []

        n = 0
        while idx__0 < idx__1:
            if n < N:
                if self.tokens[idx__0] != ' ' and self.tokens[idx__0] != '\n': 
                    raise Exception(f'[ERROR] A non-empty token cannot be removed as indentation')
            else:
                tokens.append(self.tokens[idx__0])

            if self.tokens[idx__0] == '\n': 
                n = 0
            else:
                n += 1

            idx__0 += 1

        self.replace(tokens, idx__0__init, idx__1)

    ##############
    # add_indent #
    ##############
    def add_indent(self, N, idx__0 = None, idx__1 = None):
        """
        Adds N spaces to the beginning of each newline between idx__0 and idx__1.
        
        Arguments:
            N (int): Number of spaces to add to each newline.
            idx__0 (int): Start index.
            idx__1 (int): End index (exclusive).
        """
        idx__0, idx__1 = self.bound(idx__0, idx__1)

        # save the initial value of idx__0, it will be needed later
        idx__0__init = idx__0

        tokens = [' ']*N

        while idx__0 < idx__1:
            tokens.append(self.tokens[idx__0])

            if self.tokens[idx__0] == '\n': 
                tokens.extend([' ']*N)

            idx__0 += 1

        self.replace(tokens, idx__0__init, idx__1)
            
    ########
    # exec #
    ########
    def exec(self, txt):
        """
        This function dynamically executes Python code, passed in as a string, and returns the stdout produced by the code's execution.
        
        Arguments:
            txt (str): A string containing Python code.
        """
        f = io.StringIO()
        with contextlib.redirect_stdout(f):
            exec(txt)

        return f.getvalue() 

    ########
    # read #
    ########
    def read(self, filename):
        """
        Reads from the specified file. 
        
        Arguments:
            filename (str): Name of file.
        """
        with open(filename, 'r') as file:
            return file.read()

    #########
    # write #
    #########
    def write(self, filename, txt):
        """
        Writes txt to the specified file. 
        
        Arguments:
            filename (str): Name of file.
            txt (str): String of text to be written.
        """
        with open(filename, 'w') as file:
            file.write(txt)
        
    ########
    # copy #
    ########
    def copy(self, idx__0 = None, idx__1 = None):
        """
        Returns a new Bluejay instance with the tokens between idx__0 and idx__1.
        
        Arguments:
            idx__0 (int): Start index.
            idx__1 (int): End index (exclusive).
        """
        idx__0, idx__1 = self.bound(idx__0, idx__1)
        return Bluejay(self.tokens[idx__0:idx__1])

    ###################
    # get_parentheses #
    ###################
    def get_parentheses(self, idx__func):
        """
        Returns the indices of the opening and closing parentheses of a function call. 
        
        Arguments:
            idx__func (int): Index of the function call token.
        """
        # search for the opening parenthesis
        idx__open = idx__func + 1
        while idx__open < len(self.tokens):
            if self.tokens[idx__open] == '(':
                break
            
            # make sure there are no non-empty tokens between the function call token and the opening parenthesis
            if self.tokens[idx__open] != '\n' and self.tokens[idx__open] != ' ':
                raise Exception(f'[ERROR] The first non-empty token after the function name must be an opening parenthesis.')

            idx__open += 1

        # if idx__open equals len(self.tokens) then no opening parenthesis was found 
        if idx__open == len(self.tokens):
            raise Exception(f'[ERROR] No opening parenthesis found.')

        # search for the closing parenthesis
        idx__close = self.match('(', ')', idx__open)

        return idx__open, idx__close
        

    ##########
    # python #
    ##########
    def python(self):

        while True:
            # get index of 'PYTHON' tag
            idx__PYTHON = self.search('PYTHON')
            # if idx__PYTHON equals len(self.tokens) then no match was found, exit the loop
            if idx__PYTHON == len(self.tokens):
                break

            idx__open, idx__close = self.get_parentheses(idx__PYTHON) 


            # create a new Bluejay instance containing the PYTHON call's argument
            jay = self.copy(idx__open + 1, idx__close)
            # remove any unnecessary indentation as this will result in an IndentationError when the code is executed
            jay.remove_indent(jay.get_indent())
    

            stdout = self.exec(jay.join())
            
            # tokentize the output of the code
            tokens = self.tokenize(stdout)
        

            # remove trailing '\n'
            if tokens[-1] == '\n': 
                tokens = tokens[:-1] 

            # replace the PYTHON(*) call with the output of the code
            self.replace(tokens, idx__PYTHON, idx__close + 1)


    ##########
    # insert #
    ##########
    def insert(self, tokens, idx__0):
        """
        Inserts tokens into self.tokens at idx__0.
        
        Arguments:
            tokens (list): List of tokens.
            idx__0 (int): Start index.
            idx__1 (int): End index (exclusive).
        """
        self.tokens = self.tokens[:idx__0] + copy.deepcopy(tokens) + self.tokens[idx__0:] 
        
    ##########
    # delete #
    ##########
    def delete(self, idx__0 = None, idx__1 = None):
        """
        Deletes all tokens between idx__0 and idx__1. 
        
        Arguments:
            idx__0 (int): Start index.
            idx__1 (int): End index (exclusive).
        """
        idx__0, idx__1 = self.bound(idx__0, idx__1)
        self.tokens = self.tokens[:idx__0] + self.tokens[idx__1:] 

    ###########
    # replace #
    ###########
    def replace(self, tokens, idx__0 = None, idx__1 = None):
        """
        Replaces the tokens between idx__0 and idx__1 with the provided tokens.
        
        Arguments:
            tokens (list): List of tokens.
            idx__0 (int): Start index.
            idx__1 (int): End index (exclusive).
        """
        idx__0, idx__1 = self.bound(idx__0, idx__1)
        self.delete(idx__0, idx__1)
        self.insert(tokens, idx__0)


    #########
    # match #
    #########
    def match(self, token__open, token__close, idx__0):
        """
        Returns the index of the matching token. idx__0 is the index of the opending token to be matched. 
        
        Arguments:
            token__open (str): Opening token (e.g. '(', '[', '{').
            token__close (str): Opening token (e.g. '(', '[', '{').
            idx__0 (int): Index of the opening token to be matched.
        """
        
        if self.tokens[idx__0] != token__open: 
            raise Exception(f'[ERROR] self.tokens[{idx__0}] ({self.tokens[{idx__0}]}) != token__open {token__open}. self.token[idx__0] must be equal to token__open.')

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
            raise Exception(f'[ERROR] count ({count}) != 0. No matching token__close was found.')

        return idx__0 


    #########
    # build #
    #########
    def build(self, defs = {}):
        """
        Runs a number of methods to modify self.tokens. These include methods to perform:
            - Macro Substitution
            - Evaluating embedded Python code
        
        Arguments:
            defs (dict): A hash mapping each 'key' token to a corresponding 'value' token.
        """
        self.macro_substitution(defs)
        self.python()
        self.macro_substitution(defs)


if __name__ == '__main__':

    if len(sys.argv) == 4:
        filename__b = sys.argv[1]
        filename__sv = sys.argv[2]
        filename__defs = sys.argv[3]
    
        # load defines
        defs = {}
        exec(open(filename__defs).read(), None, {"defs": defs})

        jay = Bluejay()
        jay.load(filename__b)
        jay.build(defs)
        jay.store(filename__sv)

    else:
        raise Exception(f'[ERROR] Invalid number of arguments provided.')
