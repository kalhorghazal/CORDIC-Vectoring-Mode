`timescale 1ns/1ns
module inverter (in,out);
  
  input in;
  output reg out;
  
  always@(in)begin
    out=~in;
  end
endmodule
  