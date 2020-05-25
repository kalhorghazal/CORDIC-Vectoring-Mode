`timescale 1ns/1ns

module shift_right_var_test;
  
parameter WORD_LENGTH = 16;
parameter SHIFT_LENGTH = 5;

reg [WORD_LENGTH-1:0]   data_in;
reg [SHIFT_LENGTH-1:0]  shift_amount;
wire [WORD_LENGTH-1:0]  data_out;

//-----instance of shift_right_var module
shift_right_var
#(
   .WORD_LENGTH(WORD_LENGTH),
   .SHIFT_LENGTH(SHIFT_LENGTH)
)
   shift_right_var_inst (
      .data_in(data_in),
      .shift_amount(shift_amount),
      .data_out(data_out)
);   

//applying inputs and monitoring the results
initial
   begin
     data_in = {WORD_LENGTH{1'b0}}; 
     shift_amount = {SHIFT_LENGTH{1'b0}};
     #10
     data_in = 16'd16;
     shift_amount = 5'd2;
     #10
     data_in = 16'd32;
     shift_amount = 5'd3;
     #10
     data_in = 16'd128;
     shift_amount = 5'd1;
     #10
     data_in = 16'd400;
     shift_amount = 5'd4;
     #10
     data_in = 16'd16;
     shift_amount = 5'd2;
     #10
     data_in = 16'd56;
     shift_amount = 5'd5;
     #10
     data_in = 16'd1378;
     shift_amount = 5'd6;
     #10
     data_in = 16'd1999;
     shift_amount = 5'd9;
     #20 $stop;
   end
   
   initial begin
    $display("WORD LENGTH = %0d", WORD_LENGTH);
    $monitor("@%3tns: %0d >> %0d = %0d", 
      $time, data_in, shift_amount, data_out);
    end
   
endmodule

