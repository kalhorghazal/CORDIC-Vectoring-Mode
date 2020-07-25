`include "settings.h"  

module ALU
#(
    parameter WORD_WIDTH = `WORD_WIDTH
)
(
    input [1:0]                     ALU_operation, 
    input signed [WORD_WIDTH-1:0]   A,
    input signed [WORD_WIDTH-1:0]   B, 
    output signed [WORD_WIDTH-1:0]  AlU_out
);
  
  parameter ADD = 2'd0; 
  parameter SUB = 2'd1; 
  parameter NOP = 2'd2; 
  
  reg signed [WORD_WIDTH-1:0] result;
  
  always@(A, B, ALU_operation)
  begin
    result = A;
    case(ALU_operation)
      ADD : begin 
        result = A + B;      
      end
      SUB : begin 
        result = A + ~B + 1; 
      end 
      NOP : begin 
        result = A; 
      end
      default : begin 
        result = A;     
      end
    endcase
  end
  
  assign AlU_out = result;
  
endmodule 