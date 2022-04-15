##########
# import #
##########
from bluejay import *
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
            self.path = '/Users/seankent/Documents/bluejay/'
        else:
            self.path = '/mnt/c/Users/seanj/Documents/bluejay/'

        with open(self.path + '/include/include.txt', 'r') as file:
            # load define dictionary
            self.define = self.define_to_dict(file.read())


    #######
    # run #
    #######
    def run(self):
        files = self.search(self.path + 'src/')
        for filename in files:
            self.build(filename)

        files = self.search(self.path + 'tb/')
        for filename in files:
            self.build(filename)
            
        self.update()

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

    ##################
    # define_to_dict #
    ###################
    def define_to_dict(self, txt):
        define = {}
        for line in re.split('\n', txt):
            line = self.clean(line)

            if line == '':
                continue

            tokens = re.split(' ', line)
            key, value = tokens[1], tokens[2]
            define[key] = value

        return define 

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
    def build(self, filename):

        if not self.file_needs_update(filename):
            return

        print('BUILD... ' +  filename)
        with open(filename, 'r') as file:
            # read file
            txt = file.read()
            # create Bluejay object 
            bluejay = Bluejay(txt, self.define)
            # build system verilog file
            bluejay.build()

            name = re.sub('(.|[/])*[/]', '', filename)
            # get file path 
            path = re.sub(name + '$', '', filename)

            # make gen/ directory
            os.makedirs(path + 'gen/', exist_ok=True)
           
            print(path)
            # write system verilog file to the gen/ directory 
            self.write(path + 'gen/' + name.replace('.b', '.sv'), bluejay.sv)
            


    #########
    # write #
    #########
    def write(self, filename, txt):
        # write txt to the file
        with open(filename, 'w') as file:
            file.write(txt)

    ##########
    # search #
    ##########
    def search(self, path):
        # create a list of all the .b files in the tree
        stdout = os.popen('find ' + path + '* -name *.b').read()
        return re.split('\n', stdout[:-1])
      
    #####################
    # file_needs_update #
    #####################
    def file_needs_update(self, filename):
        name = re.sub('(.|[/])*[/]', '', filename)
        path = re.sub(name + '$', '', filename)

        # name of generated .sv file
        filename_gen = path + 'gen/' + name.replace('.b', '.sv')
            
        # search for .sv file
        stdout = os.popen('find ' + filename_gen).read()

        # build .sv file if it does not exist or if the .b file has been modified
        if (stdout[:-1] != filename_gen) or (os.stat(filename).st_mtime > os.stat(filename_gen).st_mtime):
            return True
        else:
            return False

    ##########
    # update #
    ##########
    def update(self):
        print('UPDATE')
        # source files
        os.system('cp ' + self.path + 'src/central_processing_unit/gen/register_file.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.path + 'src/central_processing_unit/gen/central_processing_unit.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.path + 'src/central_processing_unit/gen/decoder.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.path + 'src/central_processing_unit/gen/arithmetic_logic_unit.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.path + 'src/cache/gen/l1_cache.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.path + 'src/cache/gen/l1_sram.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.path + 'src/memory/gen/memory.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        os.system('cp ' + self.path + 'src/gen/top.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
        # testbench files
        os.system('cp ' + self.path + 'tb/central_processing_unit/gen/register_file_tb.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sim_1/new/')
        os.system('cp ' + self.path + 'tb/central_processing_unit/gen/central_processing_unit_tb.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sim_1/new/')
        os.system('cp ' + self.path + 'tb/central_processing_unit/gen/arithmetic_logic_unit_tb.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sim_1/new/')
        os.system('cp ' + self.path + 'tb/gen/top_tb.sv ' + self.path + 'vivado/bluejay/bluejay.srcs/sim_1/new/')


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
