`include "settings.h"  

module Adder
#(
    parameter WORD_WIDTH = `WORD_WIDTH
)
(
    input signed [WORD_WIDTH-1:0]  A,
    input signed [WORD_WIDTH-1:0]  B, 
    output signed [WORD_WIDTH-1:0] out
);
  
  reg signed [WORD_WIDTH-1:0] result;
  
  always@(*) begin
    result = A + B;     
  end
  
  assign out = result;
  
endmodule