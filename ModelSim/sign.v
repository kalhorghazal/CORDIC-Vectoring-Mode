module sign 
#(
  parameter WORD_WIDTH = 16
)
(
  input signed [WORD_WIDTH-1:0] ans,
  output reg                     sign_ans
);
always @* begin
  if (ans[WORD_WIDTH-1] == 1'b1) begin
    sign_ans = 1'b1;
  end
  else begin
    sign_ans = 1'b0;
  end
end

endmodule 