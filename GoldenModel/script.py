import cordic
import random

ITERATIONS = 16
TEST_CASES = 100

def binary_string(val):
	ans = (val if val>0 else val+(1<<16))
	ans = "{0:016b}".format(ans)
	return ans

if __name__ == '__main__':

	x_file = "../ModelSim/x_values.txt"
	y_file = "../ModelSim/y_values.txt"
	z_file = "python_phase.txt"

	x_values = open(x_file, "w")
	y_values = open(y_file, "w")
	z_values = open(z_file, "w")

	for i in range(TEST_CASES):

		x_in = random.randint(-32768, 32767)
		y_in = random.randint(-32768, 32767)
		z_out = cordic.vector_mode(x_in, y_in, ITERATIONS)
		z_str = "{:.6f}".format(z_out)

		x_values.write(binary_string(x_in) + '\n')
		y_values.write(binary_string(y_in) + '\n')
		z_values.write(z_str + '\n')

		print('arctan({}/{}) = {:.6f}'.format(y_in, x_in, z_out)) 

	x_values.close()
	y_values.close()
	z_values.close()