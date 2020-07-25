`include "settings.h"  

 module mux_4_to_1 
#(
  parameter WORD_WIDTH = `WORD_WIDTH
)
(
  input [1:0]                 sel,
  input [WORD_WIDTH-1:0]      in1,
  input [WORD_WIDTH-1:0]      in2,
  input [WORD_WIDTH-1:0]      in3,
  input [WORD_WIDTH-1:0]      in4,
  output reg [WORD_WIDTH-1:0] out
);
  
  always@(sel or in1 or in2 or in3 or in4) begin
    out = 0;
    case(sel)
      2'd0: out = in1;
      2'd1: out = in2;
      2'd2: out = in3;
      2'd3: out = in4;
      default: out = 0;
    endcase
  end
  
endmodule