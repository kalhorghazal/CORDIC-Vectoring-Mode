module inverter 
#(
  parameter WORD_LENGTH = 16
)
(
  input [WORD_LENGTH-1:0]      in,
  output reg [WORD_LENGTH-1:0] out
);

  always @(*) begin
    out = -in;
  end

endmodule 