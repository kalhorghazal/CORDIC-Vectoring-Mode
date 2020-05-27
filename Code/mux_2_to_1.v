`timescale 1ns/1ns
module mux_2_to_1 #(parameter n=16)(in1,in2,sel,out);
  input [n-1:0]in1;
  input [n-1:0]in2;
  input sel;
  output reg [n-1:0]out;
  
  always@(in1,in2,sel)begin
    out=sel?in2:in1;
  end
endmodule

