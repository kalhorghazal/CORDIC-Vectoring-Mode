import cordic
import random

ITERATIONS = 16

if __name__ == '__main__':

	x_file = "x_values.txt"
	y_file = "y_values.txt"
	z_file = "python_phase.txt"

	x_values = open(x_file, "w")
	y_values = open(y_file, "w")
	z_values = open(z_file, "w")

	for i in range(100):

		x_in = random.randint(0,4095)
		y_in = random.randint(0,4095)
		z_out = cordic.vector_mode(x_in, y_in, ITERATIONS)
		z_str = "{:.7f}".format(z_out)  + '\n'

		x_values.write(str(x_in) + '\n')
		y_values.write(str(y_in) + '\n')
		z_values.write(z_str)

		print('arctan({}/{}) = {:.7f}'.format(y_in, x_in, z_out)) 

	x_values.close()
	y_values.close()
	z_values.close()