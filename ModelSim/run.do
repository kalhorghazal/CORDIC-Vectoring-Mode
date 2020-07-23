vsim -gui work.cordic_test

add wave -position insertpoint  \
sim:/cordic_test/clk \
sim:/cordic_test/rst \
sim:/cordic_test/start \
sim:/cordic_test/done \
sim:/cordic_test/x_in \
sim:/cordic_test/y_in \
sim:/cordic_test/z_out

run 20400 ns