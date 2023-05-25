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

N = 32 
ix = np.arange(N)
signal = np.sin(2*np.pi*ix/float(N))

for i in range(len(signal)):
    signal[i] = int((signal[i] + 1) * 1000)

print(signal)
