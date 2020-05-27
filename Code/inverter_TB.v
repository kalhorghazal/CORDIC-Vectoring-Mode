`timescale 1ns/1ns
module inverter_TB #(parameter n=16) ();
  
  reg [n-1:0]IN;
  wire [n-1:0]OUT;
  
  inverter inv1(IN,OUT);
  
  initial begin
    IN=365;
    #200;
    IN=256;
    #200;
    IN=32767;
    #200;
    $stop;
  end 
endmodule
  
