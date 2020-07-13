module sign 
#(
  parameter WORD_LENGTH = 16
)
(
  input [WORD_LENGTH-1:0] ans,
  output reg              sign_ans
);
always @* begin
  if (ans[WORD_LENGTH-1] == 1'b1) begin
    sign_ans = 1'b1;
  end
  else begin
    sign_ans = 1'b0;
  end
end

endmodule 