import re
import sys

##########
# format #
##########
def format(txt):

    txt = clean(txt)
    array = []

    for line in re.split('\n', txt):
        if line == '':
            continue
        array.append(line[6:8])
        array.append(line[4:6])
        array.append(line[2:4])
        array.append(line[0:2])

    return '\n'.join(array) 

#########
# clean #
#########
def clean(string):
    # convert tabs to spaces
    string = re.sub('\t+', ' ', string)
    # replace multiple spaces with a single space
    string = re.sub(' +', ' ', string)
    # remove any spaces before the begining of the string
    string = re.sub('^ *', '', string)
    # remove any spaces before the end of the string
    string = re.sub(' $', '', string)
    return string


if __name__ == '__main__':

    if len(sys.argv) == 2:
        filename = sys.argv[1]

        with open(filename, 'r') as file:
            txt = format(file.read())
            print(txt)
    else:
        print('[ERROR]')

