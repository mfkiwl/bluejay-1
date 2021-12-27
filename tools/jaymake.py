##########
# import #
##########
from bluejay import *
from sim import *


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
            self.path = '/Users/seankent/Documents/bluejay'
        else:
            self.path = '/mnt/c/Users/seanj/Documents/bluejay/'


        self.src = self.path + 'src/'
        self.tb = self.path + 'tb/'
        self.sim = self.path + 'sim/'
        self.tools = self.path + 'tools/'
        self.vivado = self.path + 'vivado/'
        self.vivado_source = self.vivado + 'bluejay/bluejay.srcs/sources_1/new/'
        self.vivado_sim = self.vivado + 'bluejay/bluejay.srcs/sim_1/new/'

        self.do_not_enter = {'gen/', '__pycache__/'}

    #######
    # run #
    #######
    def run(self):
        self.make(self.src)
        self.make(self.tb)
        self.make(self.sim)



    ########
    # make #
    ########
    def make(self, path):
        print(path)
        # get a list of all files in the directory
        stream = os.popen('ls -p ' + path + ' | grep -v /')
        string = stream.read()[:-1]
        files = re.split('\n', string)

        for filename in files:
            # bluejay file
            if bool(re.search('.b$', filename)):
                # build bluejay file
                os.system('python3 ' + self.tools + 'bluejay.py ' + path + filename)

                # copy output file into vivado project
                if bool(re.search(self.src, path)):
                    os.system('cp ' + path + 'gen/' + filename.replace('.b', '.sv') + ' ' + self.vivado_source)
                if bool(re.search(self.tb, path)):
                    os.system('cp ' + path + 'gen/' + filename.replace('.b', '.sv') + ' ' + self.vivado_sim)
                    
            # test file (.csv file)
            if bool(re.search('.csv$', filename)):
                # build sim file
                os.system('python3 ' + self.tools + 'sim.py ' + path + filename)


        # get a list of all the sub directories
        stream = os.popen('ls -p ' + path + ' | grep /')
        string = stream.read()[:-1]
        dirs = re.split('\n', string)
        
        if dirs == ['']:
            return

        # recursively call make on sub directories (which are not in self.do_not_enter)
        for directory in dirs:
            if directory not in self.do_not_enter:
                self.make(path + directory)

jaymake = Jaymake()
jaymake.run()