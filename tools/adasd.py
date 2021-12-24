##########
# import #
##########
import re
import csv
import pandas as pd


filename = '../sim/t_0.csv'

def convert(filename):
    file = open(filename).read()
    info = []
    for line in re.split('\n', file):
        if line == '':
            continue
        info.append([])
        for token in re.split(',', line):
            value = int(re.sub('_', '', re.search('\'h[abcdef0-9_]+', token).group(0)[2:]), base = 16)
            width = int(re.search('[0-9]+\'h', token).group(0)[0:-2])
            info[-1].append({'width': width, 'value': value})
            #print(re.search('\'h[0-9_]+', token))
            #print(re.search('h[0-9_]+', token).group(0))
    print(info)

    filename = '../sim/t.txt'
    file = open(filename, 'w')
    for i in range(len(info)):
        line = ''
        for ele in info[i]:
            binary = format(ele['value'], f"0{ele['width']}b")
            line += binary
            line += '_'
            print(binary)
            # line += '{0:08b}'.format(x)
        line = line[:-1]
        line += '\n'
        file.write(line)


def format_test(filename):

    # create data frame
    df = pd.read_csv(filename)

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

    txt = ''
    for index, row in df.iterrows():
        for column in df.columns:
            value = string_to_int(row[column])
            txt += format(value, f'0{logic[column]}b')
        txt += '\n'

    # remove final '\n'
    txt = txt[:-1]
    
    # write txt to file
    with open('gen/tb_in.txt', 'w') as file:
        file.write(txt)


def string_to_int(string):
    string = re.sub('_', '', string)
    # check if token is a decimal number
    if bool(re.match('^-?[0-9]+$', string)):
        return int(string)
    # check if number has hex base
    elif bool(re.match('^0x[0-9a-f]+$', string)):
        return int(string, base = 16)
    # check if number has binary base
    elif bool(re.match('^0b[0-1]+$', string)):
        return int(string, base = 2)
        
    return None


format_test(filename)
