##########
# import #
##########
from build import *
from sim import *

files = {
    'register_file.b',
    'arithmetic_logic_unit.b',
}


###########
# Jaymake #
###########
class Jaymake:
    ############
    # __init__ #
    ############
    def __init__(self):

        os = platform.system()
        if os == 'Darwin':
            self.bluejay = '/Users/seankent/Documents/bluejay/'
        else:
            self.bluejay = '/mnt/c/Users/seanj/Documents/bluejay/'

    #######
    # run #
    #######
    def run(self):
        self.build(self.bluejay + 'src/')
        self.build(self.bluejay + 'tb/')
        self.sim(self.bluejay + 'sim/')
        self.update()

    #######
    # sim #
    #######
    def sim(self, path):
        print('SIM ' + path)
        # create a list of all the .csv files in the tree
        stdout = os.popen('find ' + path + '* -name *.csv').read()
        files = re.split('\n', stdout[:-1])
        
        # iterate over the .csv files
        for file_csv in files:
            # get filename
            filename = re.search('[A-z0-9_]*\.csv$', file_csv).group(0)

            # name of generated .txt file
            file_txt = re.sub(filename, 'gen/' + filename.replace('.csv', '.txt'), file_csv)
            
            # search for .txt file
            stdout = os.popen('find ' + file_txt).read()

            # build .txt file if it does not exist or if the .csv file has been modified
            if (stdout[:-1] != file_txt) or (os.stat(file_csv).st_mtime > os.stat(file_txt).st_mtime):
                print('...' + filename)
                sim = Sim(file_csv)
                sim.build()

    #########
    # build #
    #########
    def build(self, path):
        print('BUILD ' + path)
        # create a list of all the .b files in the tree
        stdout = os.popen('find ' + path + '* -name *.b').read()
        files = re.split('\n', stdout[:-1])
        
        # iterate over the .b files
        for file_b in files:
            # get filename
            filename = re.search('[A-z0-9_]*\.b$', file_b).group(0)

            # name of generated .sv file
            file_sv = re.sub(filename, 'gen/' + filename.replace('.b', '.sv'), file_b)
            
            # search for .sv file
            stdout = os.popen('find ' + file_sv).read()

            # build .sv file if it does not exist or if the .b file has been modified
            if (stdout[:-1] != file_sv) or (os.stat(file_b).st_mtime > os.stat(file_sv).st_mtime):
                print('...' + filename)
                build = Build(file_b)
                build.build()

    ##########
    # update #
    ##########
    def update(self):
        print('UPDATE')
        # source files
        os.system('cp ' + self.bluejay + 'src/central_processing_unit/gen/register_file.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.bluejay + 'src/central_processing_unit/gen/central_processing_unit.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.bluejay + 'src/central_processing_unit/gen/decoder.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.bluejay + 'src/central_processing_unit/gen/arithmetic_logic_unit.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.bluejay + 'src/cache/gen/l1_cache.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.bluejay + 'src/cache/gen/l1_sram.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.bluejay + 'src/memory/gen/memory.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.bluejay + 'src/gen/top.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        # testbench files
        os.system('cp ' + self.bluejay + 'tb/central_processing_unit/gen/register_file_tb.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sim_1/new/')
        os.system('cp ' + self.bluejay + 'tb/central_processing_unit/gen/central_processing_unit_tb.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sim_1/new/')
        os.system('cp ' + self.bluejay + 'tb/central_processing_unit/gen/arithmetic_logic_unit_tb.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sim_1/new/')
        os.system('cp ' + self.bluejay + 'tb/gen/top_tb.sv ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sim_1/new/')


    # def update(self):
    #     print('UPDATE')
    #     # create a list of all the .sv files in the src/ directory
    #     stdout = os.popen('find ' + self.bluejay + 'src/* -name *.sv').read()
    #     src = re.split('\n', stdout[:-1])

    #     # create a list of all the .sv files in the tb/ directory
    #     stdout = os.popen('find ' + self.bluejay + 'tb/* -name *.sv').read()
    #     tb = re.split('\n', stdout[:-1])

    #     for filename in src:
    #         # copy file into vivado project
    #         os.system('cp ' + filename + ' ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sources_1/new/')

    #     for filename in tb:
    #         # copy file into vivado project
    #         os.system('cp ' + filename + ' ' + self.bluejay + 'vivado/bluejay/bluejay.srcs/sim_1/new/')

jaymake = Jaymake()
jaymake.run()