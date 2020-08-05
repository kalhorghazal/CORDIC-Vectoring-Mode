# Pipeline CORDIC Algorithm in Vectoring Mode
**CORDIC** (COordinate Rotation DIgital Computer) is an iterative algorithm for the
calculation of the rotation of a two-dimensional vector, in linear, circular and hyperbolic coordinate
systems, using only add and shift operations. Its current application are in the field of digital signal
processing, image processing, filtering, matrix algebra, etc.. It consists of two operating modes, the rotation mode
(RM) and the vectoring mode (VM). In the rotation mode a vector (X, Y) is rotated by an angle θ to
obtain a new vector (X’ , Y’). In the vectoring mode, the length R and the angle α towards the x-axis
of a vector (X, Y) are computed. For this purpose, the vector is rotated towards the x-axis so that the
y-component approaches to zero. The sum of all angle rotations is equal to the value of α, while the
value of the x-component corresponds to the length R of the vector (X, Y).