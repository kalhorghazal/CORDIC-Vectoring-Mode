module shift_right_var
#(
    parameter WORD_LENGTH = 16,
    parameter SHIFT_LENGTH = 5
)
(
    input [WORD_LENGTH-1:0]   data_in,
    input [SHIFT_LENGTH-1:0]  shift_amount,
    output [WORD_LENGTH-1:0]  data_out
);
  
  reg [WORD_LENGTH-1:0] result;
  
  always@(data_in, shift_amount)
  begin
    result = data_in >> shift_amount;
  end
  
  assign data_out = result;
  
endmodule 

