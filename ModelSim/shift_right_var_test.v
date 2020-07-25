`include "settings.h"  

module shift_right_var_test;

  parameter WORD_WIDTH = `WORD_WIDTH;
  parameter SHIFT_WIDTH = `SHIFT_WIDTH;
  parameter clock_period = `CLOCK_PERIOD;
  
  reg signed [WORD_WIDTH-1:0]  data_in;
  reg [SHIFT_WIDTH-1:0]        shift_amount;
  wire signed [WORD_WIDTH-1:0] data_out;
  
  //-----instance of shift_right_var module
  shift_right_var 
  #(
    .WORD_WIDTH(WORD_WIDTH),
    .SHIFT_WIDTH(SHIFT_WIDTH)
  ) shift_right_var_inst(
    .data_in(data_in),
    .shift_amount(shift_amount),
    .data_out(data_out)
    );
  
  initial begin
    data_in = 597;
    shift_amount = 3;
    # clock_period;
    shift_amount = 1;
    # clock_period;
    data_in = 16;
    shift_amount = 2;
    # (5*clock_period);
    $stop;
  end
  
  initial begin
    $display("shifter WIDTH = %0d", WORD_WIDTH);
    $monitor("@%3tns: %0d >> %0d = %0d", 
      $time, data_in, shift_amount, data_out);
    end
    
endmodule

