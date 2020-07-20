module Adder_test
  #(
  parameter WORD_WIDTH = 16
  )
  (
  );
  
  reg signed [WORD_WIDTH-1:0]  a;
  reg signed [WORD_WIDTH-1:0]  b;
  wire signed [WORD_WIDTH-1:0]  OUT;
  
  Adder Add(.A(a),.B(b),.out(OUT));
  
  initial begin
    a=156;
    b=12;
    #200;
    a=148;
    b=45;
    #200;
    $stop;
  end
endmodule
    


