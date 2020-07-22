`timescale 1ns/1ns

`include "defines.v"

module cordic_test;

parameter clock_period = 2;

reg                            clk;
reg                            rst;
reg                            start;
wire                           done;
reg signed [`WORD_WIDTH-1:0]   x_in;
reg signed [`WORD_WIDTH-1:0]   y_in;
wire signed [`PHASE_WIDTH-1:0] z_out;

//generating clock for the test bench
initial
   begin
      clk = 0;
      forever clk = #(clock_period/2)  ~clk;
   end

//-----instance of interface module
interface
  interface_inst (
  .clk(clk),
  .rst(rst),
  .start(start),
  .done(done),
  .x_in(x_in),
  .y_in(y_in),
  .z_out(z_out)
)
;

initial
 begin
     x_in = 16'b10; // (2, 1) -> real_theta = 26.56 , result = 18.75
     y_in = 16'b1;
     start  = 1;
     rst = 0;
     # clock_period;
     rst = 1;
     start = 0;
     # (100*clock_period);
     x_in = 16'b11; // (3, 4) -> real_theta = 53.13 , result = 57.5
     y_in = 16'b100;
     start = 1;
     rst = 0;
     # clock_period;
     rst = 1;
     # (100*clock_period);
     x_in = 16'b100; // (4, 3) -> real_theta = 36.87 , result = 32.75
     y_in = 16'b11;
     start = 1;
     rst = 0;
     # clock_period;
     rst = 1;
     # (100*clock_period);
     x_in = 16'b1111111111111111; // (-1, -1)  -> real_theta = 225, result = 223.5
     y_in = 16'b1111111111111111;
     start = 1;
     rst = 0;
     # clock_period;
     rst = 1;
     # (100*clock_period);
     x_in = 16'b0000000000000001; // (1, -1) -> real_theta = 315, result = 313.5
     y_in = 16'b1111111111111111;
     start = 1;
     rst = 0;
     # clock_period;
     rst = 1;
     # (100*clock_period);
     x_in = 16'b0000000000000001; // (1, 1) -> real_theta = 45, result = 43.5
     y_in = 16'b0000000000000001;
     start = 1;
     rst = 0;
     # clock_period;
     rst = 1;
     # (100*clock_period);
     x_in = 16'b1111111111111111; // (-1, 1) -> real_theta = 135, result = 133.4
     y_in = 16'b0000000000000001;
     start = 1;
     rst = 0;
     # clock_period;
     rst = 1;
     # (100*clock_period);
     $stop;
  end
  
  initial begin
    $monitor("@%3tns: done = %0d, arctan(%0d/%0d) = %0d, fraction = %0b", 
      $time, done, y_in, x_in, z_out[15:7], z_out[6:0]);
  end
    
endmodule