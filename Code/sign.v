`timescale 1ns/1ns

module sign 
#(
  parameter NUM_WIDTH = 16
)
(
  input[NUM_WIDTH -1:0] ans,
  output reg sign_ans
);
always @* begin
  if (ans[NUM_WIDTH - 1] == 1'b1) begin
    sign_ans = 1'b1;
  end
  else begin
    sign_ans = 1'b0;
  end
end

endmodule 
