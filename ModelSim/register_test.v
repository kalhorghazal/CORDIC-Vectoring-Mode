`include "settings.h"  

module register_test;

  parameter WORD_WIDTH = `WORD_WIDTH;
  parameter clock_period = `CLOCK_PERIOD;

  reg                          clk;
  reg                          rst;
  reg signed [WORD_WIDTH-1:0]  data_in;
  wire signed [WORD_WIDTH-1:0] data_out;
  
  //-----instance of register module
  register 
  #(
  ) register_inst(
  .clk(clk),
  .rst(rst),
  .data_in(data_in),
  .data_out(data_out)
  );
  
  initial begin
    clk = 0;
    forever clk = #clock_period ~clk;
  end

  initial begin
    data_in = 16'd164;
    rst = 0;
    # clock_period;
    rst = 1;
    # clock_period;
    data_in = 16'd21;
    rst = 0;
    # clock_period;
    rst = 1;
    # (5*clock_period);
    $stop;
  end
  
  initial begin
    $display("register WIDTH = %0d", WORD_WIDTH);
    $monitor("@%3tns: data_in = %0d , data_out = %0d", 
      $time, data_in, data_out);
    end
    
endmodule