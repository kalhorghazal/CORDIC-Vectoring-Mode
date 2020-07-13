module mux_3_to_1 
#(
  parameter WORD_LENGTH = 16
)
(
  input [1:0]                  sel,
  input [WORD_LENGTH-1:0]      in1,
  input [WORD_LENGTH-1:0]      in2,
  input [WORD_LENGTH-1:0]      in3,
  output reg [WORD_LENGTH-1:0] out
);
  
  always@(sel or in1 or in2 or in3) begin
    out = 0;
    case(sel)
      2'd0: out = in1;
      2'd1: out = in2;
      2'd2: out = in3;
      default: out = 0;
    endcase
  end
  
endmodule