`timescale 1ns/1ns
module shift_right_2_TB #(parameter n=16)();
  
  reg [n-1:0]IN;
  wire [n-1:0]OUT;
  
  shift_right_2 shift1(IN,OUT);
  
  initial begin
    IN=57;
    #200;
    IN=136;
    #200;
    $stop;
  end
endmodule
