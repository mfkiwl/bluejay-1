# for i in range(32):
# 	print(f"5'h{hex(i)[2:]} rs1_data = x_{i}")

for i in range(32):
	print(f"            5'h{hex(i)[2:]}: x_{i} <= we ? rd_data : x_{i};")