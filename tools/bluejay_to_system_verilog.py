##########
# import #
##########
import math
import re



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

bluejay_to_system_verilog('../src/register_file.b')
