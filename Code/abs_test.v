`timescale 1ns/1ns

module abs_test();
parameter clock_period = 2.125;
parameter width = 16;

reg [width -1:0] in;
wire[width -1:0] out;

abs
#(
  .NUM_WIDTH(width)
)
  ABS(
  .ans(in),
  .abs_ans(out)
)
;

initial
 begin
     in = 16'b0000_1111_0101_0000;
     # clock_period;
     in = 16'b1111_1111_0101_0000;  
     # clock_period;
     in = 16'b1111_1111_1111_1111;  
     # (5*clock_period);
     $stop;
  end
  
endmodule
    

