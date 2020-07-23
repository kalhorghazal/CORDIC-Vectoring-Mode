module Adder_test;
  
  parameter WORD_WIDTH = 16;
  
  reg signed [WORD_WIDTH-1:0]  A;
  reg signed [WORD_WIDTH-1:0]  B;
  wire signed [WORD_WIDTH-1:0] out;
  
  //-----instance of Adder module
  Adder 
  #(
    .WORD_WIDTH(WORD_WIDTH)
  ) Adder_inst (
    .A(A),
    .B(B),
    .out(out)
    );
  
  initial begin
    A = 16'd156;
    B = 16'd12;
    #200;
    A = 16'd148;
    B = 16'd45;
    #200;
    $stop;
  end
  
  initial begin
    $display("Adder WIDTH = %0d", WORD_WIDTH);
    $monitor("@%3tns: %0d + %0b = %0b", 
      $time, A, B, out);
    end
    
endmodule