`timescale 1ns/1ns

module sign 
#(
  parameter num_width = 16
)
(
  input[num_width -1:0] ans,
  output reg sign_ans
);
always @* begin
  if (ans[num_width - 1] == 1'b1) begin
    sign_ans = 1'b1;
  end
  else begin
    sign_ans = 1'b0;
  end
end

endmodule 

// module sign_test
module sign_test();
parameter clock_period = 2.125;
parameter width = 16;

reg [width -1:0] in;
wire out;

sign
#(
  .num_width(width)
)
  SIGN(
  .ans(in),
  .sign_ans(out)
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
    


