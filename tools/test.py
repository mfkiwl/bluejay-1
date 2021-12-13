##########
# import #
##########
import re

filename = '../sim/t_0.txt'

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

convert(filename)