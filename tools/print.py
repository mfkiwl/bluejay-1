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

# for i in range(32): print(f"x_{i},", end='') ; print("hi;")
#for i in range(64): print(f"3'h{i:x}: c = {{{{{i}{[{64-i}]}}}, a[{64-i}:{i}]}};")

for i in range(32): print(f"5'h{i:x}: c = {{{32 + i}{{a[31]}}, a[31:{i}]}};")