import math

def ROM_lookup(iteration):
    return math.degrees(math.atan(2**(-1*iteration)))

def vector_mode(x, y, iterations):
    
    x_val_list = []
    y_val_list = []
    z_val_list = []
    iterations_list = []

    i = 0;                # Keeps count on number of iterations
    
    current_x = abs(x)         # Value of X on ith iteration 
    current_y = abs(y)         # Value of Y on ith iteration
    current_z = 0
    
    if (iterations > 0):
        while (i < iterations):
            if (current_y > 0):
                next_x = current_x + current_y * (2**(-1*i))
                next_y = current_y - current_x * 2**(-1*i)
                next_z = current_z + ROM_lookup(i)
            else if (current_y == 0):
                next_x = current_x
                next_y = current_y
                next_z = current_z
            else:
                next_x = current_x - current_y * (2**(-1*i))
                next_y = current_y + current_x * 2**(-1*i)
                next_z = current_z - ROM_lookup(i)

            current_x = next_x
            current_y = next_y
            current_z = next_z

            x_val_list.append(current_x)
            y_val_list.append(current_y)
            z_val_list.append(current_z)
            
            iterations_list.append(i)

            i = i+1

    if (x < 0 and y < 0):
        current_z += 180

    if (x < 0 and y > 0):
        current_z += 90

    if (x > 0 and y < 0):
        current_z += 270

    return current_z