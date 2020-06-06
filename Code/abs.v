`timescale 1ns/1ns
module abs 
#(
  parameter NUM_WIDTH = 16
)
(
  input[NUM_WIDTH -1:0] ans,
  output reg[NUM_WIDTH -1:0] abs_ans
);

always @* begin
  if (ans[NUM_WIDTH - 1] == 1'b1) begin
    abs_ans = -ans;
  end
  else begin
    abs_ans = ans;
  end
end
  
endmodule    
    
