`timescale 1ns/1ns
module shift_right_2 #(parameter n=16)(in,out);
  input [n-1:0]in;
  output reg [n-1:0]out;
  
  always@(in)begin
    out=in>>2;
  end
endmodule
