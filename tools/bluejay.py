##########
# import #
##########
from build import *

###########
# Bluejay #
###########
class Bluejay(Build):

    #########
    # build #
    #########
    def build(self):
        txt = self.txt
        txt = self.find_and_replace(txt)
        txt = self.eval_func(txt, 'LOG2', self.log2)
        txt = self.eval_func(txt, 'PYTHON', self.python)
        txt = self.fold_constants(txt)

        # get output file name
        filename = self.filename.replace('.b', '.sv')
        self.write(filename, txt)

if __name__ == '__main__':
    if len(sys.argv) == 2:
        filename = sys.argv[1]
        bluejay = Bluejay(filename)
        bluejay.build()
    else:
        print('[ERROR]')