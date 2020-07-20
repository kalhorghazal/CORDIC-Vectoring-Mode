module register_test
  #(
    parameter WORD_WIDTH = 16,
    parameter CLK_PERIOD = 10
  )
  (
  );
  
  reg                               CLK;
  reg                               RST;
  reg signed [WORD_WIDTH-1:0]      DATA_IN;
  wire signed [WORD_WIDTH-1:0] DATA_OUT;
  
  register REG(.clk(CLK),.rst(RST),.data_in(DATA_IN),.data_out(DATA_OUT));
  
  initial begin
    CLK=0;
    forever CLK=#CLK_PERIOD ~CLK;
  end

  initial begin
    RST=0;
    DATA_IN=164;
    #200;
    RST=1;
    #200;
    $stop;
  end
  
  
    
endmodule

