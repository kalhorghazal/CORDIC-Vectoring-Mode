`include "settings.h" 

module ALU_test;
  
  parameter WORD_WIDTH = `WORD_WIDTH;
  parameter clock_period = `CLOCK_PERIOD;
  
  parameter ADD = 2'd0; 
  parameter SUB = 2'd1;
  parameter NOP = 2'd2;
  
  reg [1:0]                     ALU_operation;
  reg signed [WORD_WIDTH-1:0]   A;
  reg signed [WORD_WIDTH-1:0]   B;
  wire signed [WORD_WIDTH-1:0]  ALU_out;
  
  reg [8*4:1] operator;
  
  //-----instance of ALU module
  ALU 
  #(
    .WORD_WIDTH(WORD_WIDTH)
  ) ALU_inst (
    .ALU_operation(ALU_operation),
    .A(A),
    .B(B),
    .ALU_out(ALU_out)
    );
  
  initial begin
     ALU_operation = ADD;
     A = {WORD_WIDTH{1'b0}}; 
     B = {WORD_WIDTH{1'b0}};
     operator = "+";
     # clock_period;
     ALU_operation = ADD;
     A = 16'd16;
     B = 16'd32;
     operator = "+";
     # clock_period;
     ALU_operation = ADD;
     A = 16'd21;
     B = 16'd18;
     operator = "+";
     # clock_period;
     ALU_operation = NOP;
     A = {WORD_WIDTH{1'b1}};
     B = 16'd1;
     operator = "?";
     # clock_period;
     ALU_operation = NOP;
     A = 16'd128;
     B = 16'd17;
     operator = "?";
     # clock_period;
     ALU_operation = NOP;
     A = 16'd64;
     B = 16'd24;
     operator = "?";
     # clock_period;
     ALU_operation = SUB;
     A = 16'd20;
     B = 16'd20;
     operator = "-";
     # clock_period;
     ALU_operation = SUB;
     A = 16'd72;
     B = 16'd25;
     operator = "-";
     # clock_period;
     ALU_operation = SUB;
     A = 16'd45;
     B = 16'd90;
     operator = "-";
     # (5*clock_period); 
     $stop;
  end
  
  initial begin
    $display("ALU WIDTH = %0d", WORD_WIDTH);
    $monitor("@%3tns: %0d %0s %0b = %0b", 
      $time, A, operator, B, AlU_out);
    end
  
endmodule