module mux_2_to_1 
#(
  parameter WORD_LENGTH = 16
)
(
  input                        sel,
  input [WORD_LENGTH-1:0]      in1,
  input [WORD_LENGTH-1:0]      in2,
  output reg [WORD_LENGTH-1:0] out
);
  
  always@(sel or in1 or in2) begin
    out = 0;
    case(sel)
      1'd0: out = in1;
      1'd1: out = in2;
      default: out = 0;
    endcase
  end
  
endmodule