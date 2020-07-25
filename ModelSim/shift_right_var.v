`include "settings.h"  

module shift_right_var 
#(
  parameter WORD_WIDTH = `WORD_WIDTH,
  parameter SHIFT_WIDTH = `SHIFT_WIDTH
)
(
  input signed [WORD_WIDTH-1:0]      data_in,
  input [SHIFT_WIDTH-1:0]            shift_amount,
  output reg signed [WORD_WIDTH-1:0] data_out 
);

 integer i;
  always @(*) begin
    data_out = data_in;
    for(i=0; i < shift_amount; i=i+1) begin
      data_out = (data_out >> 1) | (data_in[WORD_WIDTH-1] << (WORD_WIDTH-1));
    end
  end

endmodule 