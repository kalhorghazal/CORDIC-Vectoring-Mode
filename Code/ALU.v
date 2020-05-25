module ALU
#(
    parameter WORD_LENGTH = 16
)
(
    input                     ALU_operation, 
    input [WORD_LENGTH-1:0]   A,
    input [WORD_LENGTH-1:0]   B, 
    output [WORD_LENGTH-1:0]  AlU_out
);
  
  parameter ADD = 1'd0; 
  parameter SUB = 1'd1; 
  
  reg [WORD_LENGTH-1:0] result;
  
  always@(A, B, ALU_operation)
  begin
    result = {WORD_LENGTH{1'b0}};
    case(ALU_operation)
      ADD : begin 
        result = A + B;      
      end
      SUB : begin 
        result = A + ~B + 1; 
      end 
      default : begin 
        result = {WORD_LENGTH{1'b0}};     
      end
    endcase
  end
  
  assign AlU_out = result;
  
endmodule 
