##########
# import #
##########
import math
import re

#########
# clean #
#########
def clean(string):
	# remove comments
	string = re.sub('//.*', '', string)
	# convert tabs to spaces
	string = re.sub('\t+', ' ', string)
	# replace multiple spaces with a single space
	string = re.sub(' +', ' ', string)
	# remove any spaces before the begining of the string
	string = re.sub('^ *', '', string)
	# remove any spaces before the end of the string
	string = re.sub(' $', '', string)
	return string


##########
# header #
##########
def header(filename):
	txt = ''
	with open(filename, 'r') as file:
		txt += 'define =\n'
		txt += '{\n'
		for line in re.split('\n', file.read()):
			if line == '':
				continue
			line = clean(line)
			line = re.split(' ', line)
			key = line[1]
			value = line[2]
			txt += f'    {key}: "{value}",\n'
		txt += '}'

	filename = re.sub('.h', '.py', filename)
	with open(filename, 'w') as file:
		file.write(txt)
	

# header('../include/define.h')

#for i in range(5): print("hi")

for i in range(32): print(f"5'h{format(i, 'x')}: rd_data_0 = r_{i};")

########
# log2 #
########
def log2(match):
	n = int((match[5:-1]))
	return str(math.ceil(math.log2(n)))


####################
# find_and_replace #
####################
def find_and_replace(file, regex, func):
	matches = re.findall(regex, file)

	replace = {}
	for match in matches:
		if match not in replace:
			replace[match] = func(match)
			print(replace)

	for match in replace:
		file = file.replace(match, replace[match])

	return file
	




#############################
# bluejay_to_system_verilog #
#############################
def bluejay_to_system_verilog(filename):
	# open file
	file = open(filename).read()

	define = {'NUM__GENERAL_PURPOSE_REGISTERS': '32'}
	for key, value in define.items():
		regex = key
		func = lambda x: value
		file = find_and_replace(file, regex, func)

	regex = 'LOG2\([0-9]+\)'
	func = log2
	file = find_and_replace(file, regex, func)
	
	filename_sv = re.sub('b$', 'sv', filename)
	# open(filename_sv, 'w').write(file)

# bluejay_to_system_verilog('../src/register_file.b')
