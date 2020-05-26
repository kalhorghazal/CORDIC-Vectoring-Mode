`timescale 1ns/1ns
module abs 
#(
  parameter num_width = 16
)
(
  input[num_width -1:0] ans,
  output reg[num_width -1:0] abs_ans
);

always @* begin
  if (ans[num_width - 1] == 1'b1) begin
    abs_ans = -ans;
  end
  else begin
    abs_ans = ans;
  end
end
  
endmodule    
    
// module abs_test
module abs_test();
parameter clock_period = 2.125;
parameter width = 16;

reg [width -1:0] in;
wire[width -1:0] out;

abs
#(
  .num_width(width)
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
    
