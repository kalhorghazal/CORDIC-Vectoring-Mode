module ROM
#(
    parameter WORD_LENGTH = 16,
    parameter ADDRESS_LENGTH = 4
)
(
    input [ADDRESS_LENGTH-1:0]    address,
    output reg [WORD_LENGTH-1:0]  data
);
  
  always @*
    case(address)
      4'b0000: data = 16'b0010000000000000;
      4'b0001: data = 16'b0001001011100100;
      4'b0010: data = 16'b0000100111111011;
      4'b0011: data = 16'b0000010100010001;
      4'b0100: data = 16'b0000001010001011;
      4'b0101: data = 16'b0000000101000101;
      4'b0110: data = 16'b0000000010100010;
      4'b0111: data = 16'b0000000001010001;
      4'b1000: data = 16'b0000000000101000;
      4'b1001: data = 16'b0000000000010100;
      4'b1010: data = 16'b0000000000001010;
      4'b1011: data = 16'b0000000000000101;
      4'b1100: data = 16'b0000000000000010;
      4'b1101: data = 16'b0000000000000001;
      4'b1110: data = 16'b0000000000000000;
      4'b1111: data = 16'b0000000000000000;
      default: data = 16'b0000000000000000;
    endcase
    
endmodule 