# for i in range(32):
# 	print(f"5'h{hex(i)[2:]} rs1_data = x_{i}")

# for i in range(32):
# 	print(f"            5'h{hex(i)[2:]}: x_{i} <= we ? rd_data : x_{i

# for i in range(4):
# 	for j in range(140):
# 		print("0", end = '')
# 	print('')

import re
import math 
import numpy as np

x = [1, 2, 4]
y = [1, 2, 4]

#print(x == y)
#print(y[:0] + y[1 + 1:])
#
#print(y[5])


#for i in range(32):
#    print(math.sin(math.pi
#
#N = 32 
#ix = np.arange(N)
#signal = np.sin(2*np.pi*ix/float(N))
#
#for i in range(len(signal)):
#    signal[i] = int((signal[i] + 1) * 128/2)
#
#print("{")
#for sample in signal:
#    print(f"{sample}, ",end="")
#print("}")

#for i in range(16):
#    print(f'{i:x}')

top = "/Users/seankent/Documents/bluejay"


modules = {"jay": {"b": f"{top}/ip/jay/src/", "sv": f"{top}/ip/jay/src/gen/", "defs": f"{top}/defs/gen/defs.py"}}

print(modules)



