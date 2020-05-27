`timescale 1ns/1ns
module mux_2_to_1_TB #(parameter n=16)();
  reg [n-1:0]IN1;
  reg [n-1:0]IN2;
  reg SEL;
  wire [n-1:0]OUT;
  
  mux_2_to_1 mux1(IN1,IN2,SEL,OUT);
  
  initial begin
    IN1=497;
    IN2=845;
    SEL=0;
    #200;
    SEL=1;
    #200;
    $stop;
  end
endmodule
  
