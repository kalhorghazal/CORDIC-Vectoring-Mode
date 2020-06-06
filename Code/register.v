`timescale 1ns/1ns

module register
#(
  parameter NUM_WIDTH = 16
)  
(
  input clk,
  input rst,
  input ld,
  input [NUM_WIDTH - 1:0] in,
  output reg [NUM_WIDTH -1:0]out
);
  
always @(posedge clk,negedge rst) begin
  if(!rst) begin
    out <= 0;
  end  
  else if(ld == 1) begin
    out <= in;
  end   
    else begin
      out <= out;
    end   
 end
       
endmodule




