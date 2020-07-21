import math

def ROM_lookup(iteration):
    return math.degrees(math.atan(2**(-1*iteration)))

def vector_mode(x, y, z, iterations):
    a = 1.2075;   # = 1/K
    
    x_val_list = []
    y_val_list = []
    z_val_list = []
    iterations_list = []

    i = 0;                  # Keeps count on number of iterations
    
    current_x = x         # Value of X on ith iteration 
    current_y = y         # Value of Y on ith iteration
    current_z = z         # Value of Z on ith iteration
    
    di = 0

        
    flag = 0
    
    if (iterations > 0):
        while (i < iterations):
            di = -1*math.copysign(1, current_y);#*current_x);
            next_x = current_x - current_y * (2**(-1*i))
            next_y = current_y + di * current_x * 2**(-1*i)
            next_z = current_z - di * ROM_lookup(i)
            
            current_x = next_x
            current_y = next_y
            current_z = next_z

            x_val_list.append(current_x)
            y_val_list.append(current_y)
            z_val_list.append(current_z)
            
            iterations_list.append(i)

            i = i+1

    return {'z':z_val_list }

    #return { 'x':x_val_list, 'y':y_val_list, 'z':z_val_list, 'iteration':iterations_list }


print(vector_mode(1, 2, 0, 16))