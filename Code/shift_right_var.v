module shift_right_var
#(
    parameter WORD_LENGTH = 16,
    parameter SHIFT_LENGTH = 4
)
(
    input [WORD_LENGTH-1:0]      data_in,
    input [SHIFT_LENGTH-1:0]     shift_amount,
    output reg [WORD_LENGTH-1:0] data_out
); 
  
  always@(data_in, shift_amount)
  begin
    data_out = data_in >> shift_amount;
  end
  
endmodule 