`timescale 1ns/1ns

module reg_test();
parameter clock_period = 2.125;
parameter width = 16;

reg [width -1:0] in;
reg clk, rst, ld;
wire[width -1:0] out;

register
#(
  .NUM_WIDTH(width)
)
  REG(
  .clk(clk),
  .rst(rst),
  .ld(ld),
  .in(in),
  .out(out)
)
;
initial
   begin
      clk = 0;
      forever clk = #(clock_period/2)  ~clk;
   end
   
initial
 begin
     rst = 1'b0;
     ld = 1'b0;
     # clock_period;
     rst = 1'b1; 
     in = 16'b0000_1111_0101_0000;
     # clock_period;
     ld = 1'b1;
     #clock_period;
     ld = 1'b0;
     in = 16'b1111_1111_0101_0000;  
     #clock_period;
     ld = 1'b1;
     # (5*clock_period);

     $stop;
  end
  
endmodule
    

