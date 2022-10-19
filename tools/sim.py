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






#######
# Sim #
#######
class Sim():

    ############
    # __init__ #
    ############
    def __init__(self, testlist, sub):

        self.testlist = testlist
        self.sub = sub

        os = platform.system()
        if os == 'Darwin':
            self.path = '/Users/seankent/Documents/bluejay/' 
        elif os == 'Linux':
            self.path = '/home/seankent/bluejay/'
        else:
            self.path = '/mnt/c/Users/seanj/Documents/bluejay/'



    ########
    # make #
    ########
    def make(self):
        os.system('make -C ' + self.path + self.sub)


    ########
    # asim #
    ########
    def asim(self, test):
        # run the spike simulator
        stdout = os.popen('spike pk ' + self.path + self.sub + test).read()

        # return the value in a0
        return int(re.search('a0 [0-9a-f]+', stdout).group(0).split()[1], 16)


    
    #########
    # write #
    #########
    def write(self, path, filename, txt):
        # write txt to the file
        with open(path + filename, 'w') as file:
            file.write(txt)

        
            
    ############
    # run_asim #
    ############
    def run_asim(self):
        # run asim for each test in the testlist 
        for test in testlist:
            value = self.asim(test) 
            txt = '{:016x}\n'.format(value)
            self.write(self.path + self.sub + 'results/', test + '.aout', txt)

    #######
    # run #
    #######
    def run(self, tasks):
        if 'make' in tasks:
            self.make()        
        if 'asim' in tasks:
            self.run_asim() 
        if 'diff' in tasks: 
            results = self.run_diff() 
            self.display_results(results)  



#
#        tests = ['add', 'loop']
#
#        for test in tests:
#            vout = self.path + 'sim/basic/results/' + test + '.vout'
#            aout = self.path + 'sim/basic/results/' + test + '.aout'
#            if self.diff(vout, aout):
#                print('failed.')
#            else:
#                print('passed!')
#
        
    ########
    # diff #
    ########
    def diff(self, test):

        # vout file 
        vout = self.path + self.sub + 'results/' + test + '.vout' 
        # aout file
        aout = self.path + self.sub + 'results/' + test + '.aout' 

        if not os.path.exists(vout):
            print(f'[ERROR]: {vout} does not exist.')
            return False

        if not os.path.exists(aout):
            print(f'[ERROR]: {aout} does not exist.')
            return False
        
        
        return filecmp.cmp(vout, aout, shallow=False)


    ############
    # run_diff #
    ############
    def run_diff(self):
        results = {}
        for test in self.testlist:
            results[test] = self.diff(test) 

        return results 

    ###################
    # display_results #
    ###################
    def display_results(self, results):
        passed = 0
        
        for test in self.testlist:
            if results[test] == True:
                passed += 1
                print('passed!')
            else:
                print(f'failed... {test}')

            
        print(f'{passed}/{len(testlist)} passed.')



if __name__ == '__main__':
    testlist = ['addi', 'slti', 'sltiu', 'add']
    sub = 'sim/basic/'
    #tasks = ['diff']
    tasks = ['asim', 'diff']
    #tasks = ['make', 'asim', 'diff']
    sim = Sim(testlist, sub)
    sim.run(tasks)

