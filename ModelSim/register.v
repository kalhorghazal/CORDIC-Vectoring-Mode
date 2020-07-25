`include "settings.h"  

 module register
#(
  parameter WORD_WIDTH = `WORD_WIDTH
)  
(
  input                               clk,
  input                               rst,
  input signed [WORD_WIDTH-1:0]      data_in,
  output reg signed [WORD_WIDTH-1:0] data_out
);
  
always @(posedge clk or negedge rst) begin
  if(~rst) begin
    data_out <= 0;
  end  
  else begin
    data_out <= data_in;
  end    
 end
       
endmodule