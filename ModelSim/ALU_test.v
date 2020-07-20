module ALU_test
  #(
    parameter WORD_WIDTH = 16
  )
  (
  );
  
  parameter ADD = 1'd0; 
  parameter SUB = 1'd1;
  
  reg                           ALU_OPERATION;
  reg signed [WORD_WIDTH-1:0]   a;
  reg signed [WORD_WIDTH-1:0]   b;
  wire signed [WORD_WIDTH-1:0]  ALU_OUT;
  
  ALU op(.ALU_operation(ALU_OPERATION),.A(a),.B(b),.AlU_out(ALU_OUT));
  
  initial begin
    a=15;
    b=4;
    ALU_OPERATION=SUB;
    #200;
    a=487;
    b=49;
    ALU_OPERATION=ADD;
    #200;
    $stop;
  end
endmodule
    


