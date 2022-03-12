# for i in range(32):
# 	print(f"5'h{hex(i)[2:]} rs1_data = x_{i}")

# for i in range(32):
# 	print(f"            5'h{hex(i)[2:]}: x_{i} <= we ? rd_data : x_{i

# for i in range(4):
# 	for j in range(140):
# 		print("0", end = '')
# 	print('')

import re

x = 'mnt/c/Users/seanj/Documents/bluejay/src/central_processing_unit/t.b'
y =re.sub('(.|[/])*[/]', '', x)
print(y)

for i in range(32): print(f"x_{i},", end='') ; print("hi;")