`timescale 1ns/1ns

module sign_test;

parameter WORD_WIDTH = 16;
parameter clock_period = 2;

reg [WORD_WIDTH-1:0] in;
wire                 out;

//-----instance of sign module
sign
#(
  .WORD_WIDTH(WORD_WIDTH)
)
  sign_inst (
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
     # clock_period;
     in = 16'b0111_1111_1111_1111;
     # clock_period;
     in = 16'b1000_0000_0000_0000;
     # clock_period;
     in = 16'b0000_0000_0000_0000;
     # clock_period;
     in = 16'b1010_1010_1010_1010;
     # clock_period;
     in = 16'b0101_0101_1010_0101;
     # (5*clock_period);
     $stop;
  end
  
  initial begin
    $display("sign WIDTH = %0d", WORD_WIDTH);
    $monitor("@%3tns: sign(%0b) = %0b", $time, in, out);
  end
    
endmodule