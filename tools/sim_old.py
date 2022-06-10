##########
# import #
##########
from build import *

#######
# Sim #
#######
class Sim(Build):

    #########
    # build #
    #########
    def build(self):
        txt = self.txt
        txt = self.find_and_replace(txt)
        txt = self.fold_constants(txt)

        # create data frame
        df = pd.read_csv(StringIO(txt))

        # create a dictionary maping column names to their bit length
        logic = {}
        for column in df.columns:
            match = re.search('\[[0-9]+:[0-9]+\]', column)
            # if match is None, the bit width is 1
            if match is None:
                logic[column] = 1
            # else, extract the bit width from the [msb:lsb] indicies
            else:
                # extract the msb
                msb = int(match.group(0)[1:-1].split(':')[0])
                # extract the lsb
                lsb = int(match.group(0)[1:-1].split(':')[1])
                # calculate the bit width
                logic[column] = msb - lsb + 1

        # create output file
        txt = ''
        # iterate over rows, columns of the df
        for index, row in df.iterrows():
            for column in df.columns:
                value = self.string_to_int(row[column])
                # convert value into a binary number of length logic[column]
                if value is None:
                    txt += 'x'*logic[column]
                else:
                    txt += format(value, f'0{logic[column]}b')
            txt += '\n'

        # remove final '\n'
        txt = txt[:-1]
        
        # get output file name
        filename = self.filename.replace('.csv', '.txt')
        self.write(filename, txt)

if __name__ == '__main__':
    if len(sys.argv) == 2:
        filename = sys.argv[1]
        sim = Sim(filename)
        sim.build()
    else:
        print('[ERROR]')
