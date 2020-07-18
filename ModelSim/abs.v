 module abs 
#(
  parameter WORD_WIDTH = 16
)
(
  input [WORD_WIDTH-1:0]      ans,
  output reg [WORD_WIDTH-1:0] abs_ans
);

always@(*) begin
  if (ans[WORD_WIDTH-1] == 1'b1) begin
    abs_ans = -ans;
  end
  else begin
    abs_ans = ans;
  end
end
  
endmodule 