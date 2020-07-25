`include "settings.h"  

module sign 
#(
  parameter WORD_WIDTH = `WORD_WIDTH
)
(
  input signed [WORD_WIDTH-1:0] ans,
  output reg [1:0]              sign_ans
);
always @(*) begin
  if (ans > 0) begin
    sign_ans = 2'd0;
  end
  else if (ans == 0) begin
    sign_ans = 2'd2;
  end
  else 
    sign_ans = 2'd1;
end

endmodule 