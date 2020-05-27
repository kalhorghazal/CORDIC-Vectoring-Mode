`timescale 1ns/1ns
module inverter #(parameter n=16)(in,out);
  
  input [n-1:0]in;
  output reg [n-1:0]out;
  
  always@(in)begin
    out=~in+1;
  end
endmodule
  