`timescale 1ns/1ns
module inverter_TB ();
  
  reg IN;
  wire OUT;
  
  inverter inv1(IN,OUT);
  
  initial begin
    IN=0;
    #200;
    IN=1;
    #200;
    $stop;
  end 
endmodule
  
