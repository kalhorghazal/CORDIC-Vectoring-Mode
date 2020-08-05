import math

python_file = 'GoldenModel/python_phase.txt'
verilog_file = 'ModelSim/verilog_phase.txt'

counter = 0
rmse = 0

with open(python_file) as file1, open(verilog_file) as file2:
    for expected, actual in zip(file1, file2):
    	phase1 = float(expected)
    	phase2 = float(actual)
    	rmse += (phase1 - phase2)**2
    	counter += 1

rmse = math.sqrt(rmse/counter)

print("RMSE =", rmse)
print("Precision =", (360-rmse)*100/360, "%")