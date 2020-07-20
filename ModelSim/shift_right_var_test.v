module shift_right_var_test
  #(
  parameter WORD_WIDTH = 16,
  parameter SHIFT_WIDTH = 4
  );
  
  reg signed [WORD_WIDTH-1:0]      DATA_IN;
  reg [SHIFT_WIDTH-1:0]            SHIFT_AMOUNT;
  wire signed [WORD_WIDTH-1:0] DATA_OUT;
  
  shift_right_var SHIFT(.data_in(DATA_IN),.shift_amount(SHIFT_AMOUNT),.data_out(DATA_OUT));
  
  initial begin
    DATA_IN=597;
    SHIFT_AMOUNT=3;
    #200;
    SHIFT_AMOUNT=1;
    #200;
    DATA_IN=16;
    SHIFT_AMOUNT=2;
    #200;
    $stop;
  end
endmodule

