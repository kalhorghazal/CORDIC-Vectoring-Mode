`timescale 1ns/1ns

module register
#(
  parameter num_width = 16
)  
(
  input clk,
  input rst,
  input ld,
  input [num_width - 1:0] in,
  output reg [num_width -1:0]out
);
  
always @(posedge clk,negedge rst) begin
  if(!rst) begin
    out <= 0;
  end  
  else if(ld == 1) begin
    out <= in;
  end   
    else begin
      out <= out;
    end   
 end
       
endmodule

// module abs_test
module reg_test();
parameter clock_period = 2.125;
parameter width = 16;

reg [width -1:0] in;
reg clk, rst, ld;
wire[width -1:0] out;

register
#(
  .num_width(width)
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
    



