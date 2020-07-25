`include "settings.h"  

module interface
(
  input                            clk, 
  input                            rst,
  input                            start,
  output                           done,
  input signed [`WORD_WIDTH-1:0]   x_in,
  input signed [`WORD_WIDTH-1:0]   y_in,
  output signed [`PHASE_WIDTH-1:0] z_out
);

  cordic cordic_inst (
   .clk(clk),
   .rst(rst),
   .x_in(x_in),
   .y_in(y_in),
   .z_out(z_out)
  );
  
  control_unit
  #(
   .ITERATION_WIDTH(`ITERATION_WIDTH),
   .ITERATIONS(`ITERATIONS)
  )
  control_unit_inst (
   .clk(clk),
   .rst(rst),
   .start(start),
   .done(done)
  );

endmodule
