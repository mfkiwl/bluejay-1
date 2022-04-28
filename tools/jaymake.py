##########
# import #
##########
from bluejay import *
#from sim import *


###########
# Jaymake #
###########
class Jaymake:
    ############
    # __init__ #
    ############
    def __init__(self, files):

        self.files = files

        os = platform.system()
        if os == 'Darwin':
            self.path = '/Users/seankent/Documents/bluejay/'
        else:
            self.path = '/mnt/c/Users/seanj/Documents/bluejay/'

        with open(self.path + 'include/include.txt', 'r') as file:
            # load define dictionary
            self.defines = self.define_to_dict(file.read())


    #######
    # run #
    #######
    def run(self):
        # build files
        for ele in self.files:
            path = ele['path']
            filename = ele['filename']
            self.build(self.path + path, filename)

        # update vivado
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
    # def sim(self, path):
    #     print('SIM ' + path)
    #     # create a list of all the .csv files in the tree
    #     stdout = os.popen('find ' + path + '* -name *.csv').read()
    #     files = re.split('\n', stdout[:-1])
        
    #     # iterate over the .csv files
    #     for file_csv in files:
    #         # get filename
    #         filename = re.search('[A-z0-9_]*\.csv$', file_csv).group(0)

    #         # name of generated .txt file
    #         file_txt = re.sub(filename, 'gen/' + filename.replace('.csv', '.txt'), file_csv)
            
    #         # search for .txt file
    #         stdout = os.popen('find ' + file_txt).read()

    #         # build .txt file if it does not exist or if the .csv file has been modified
    #         if (stdout[:-1] != file_txt) or (os.stat(file_csv).st_mtime > os.stat(file_txt).st_mtime):
    #             print('...' + filename)
    #             sim = Sim(file_csv)
    #             sim.build()

    #########
    # build #
    #########
    def build(self, path, filename):

        if not self.file_needs_update(path, filename):
            return

        print('Build: ' +  filename)

        with open(path + filename, 'r') as file:
            # read file
            txt = file.read()
            # create Bluejay object 
            bluejay = Bluejay(txt, self.defines)
            # build system verilog file
            bluejay.build()

            # make gen/ directory
            os.makedirs(path + 'gen/', exist_ok=True)
           
            # write system verilog file to the gen/ directory 
            self.write(path + 'gen/', filename.replace('.b', '.sv'), bluejay.sv)
            


    #########
    # write #
    #########
    def write(self, path, filename, txt):
        # write txt to the file
        with open(path + filename, 'w') as file:
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
    def file_needs_update(self, path, filename):

        # search for .sv file
        stdout = os.popen('find ' + path + 'gen/' + filename.replace('.b', '.sv')).read()

        # build .sv file if it does not exist or if the .b file has been modified
        if (stdout[:-1] != path + 'gen/' + filename.replace('.b', '.sv')) or (os.stat(path + filename).st_mtime > os.stat(path + 'gen/' + filename.replace('.b', '.sv')).st_mtime):
            return True
        else:
            return False

    ##########
    # update #
    ##########
    def update(self):

        for ele in self.files:
            path = ele['path']
            filename = ele['filename']
            self.build(self.path + path, filename)

            if (path[0:3] == 'src'):
                os.system('cp ' + self.path + path + 'gen/' +  filename.replace('.b', '.sv') + ' ' + self.path + 'vivado/bluejay/bluejay.srcs/sources_1/new/')
            elif (path[0:2] == 'tb'):
                os.system('cp ' + self.path + path + 'gen/' +  filename.replace('.b', '.sv') + ' ' + self.path + 'vivado/bluejay/bluejay.srcs/sim_1/new/')


if __name__ == '__main__':
    
    files = [
        {'path': 'src/', 'filename': 'top.b'},
        {'path': 'src/central_processing_unit/', 'filename': 'register_file.b'},
        {'path': 'src/central_processing_unit/', 'filename': 'arithmetic_logic_unit.b'},
        {'path': 'src/central_processing_unit/', 'filename': 'decoder.b'},
        {'path': 'src/central_processing_unit/', 'filename': 'comparator.b'},
        {'path': 'src/central_processing_unit/', 'filename': 'central_processing_unit.b'},
        {'path': 'src/cache/', 'filename': 'memory.b'},
        {'path': 'src/cache/', 'filename': 'l1.b'},
        {'path': 'tb/', 'filename': 'top_tb.b'},
    ]

    jaymake = Jaymake(files)
    jaymake.run()
