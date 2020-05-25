module ROM
#(
    parameter WORD_LENGTH = 16,
    parameter ADDRESS_LENGTH = 4,
    parameter MEMORY_DEPTH = 16
)
(
    input                       read_enable,
    input [ADDRESS_LENGTH-1:0]  address,
    output [WORD_LENGTH-1:0]    data
);
  
  reg [WORD_LENGTH-1:0] memory [0:MEMORY_DEPTH-1];
  
  assign data = (read_enable) ? memory[address] : 16'b0;
  
  initial begin
      memory[0]  = 16'b0010000000000000;
      memory[1]  = 16'b0001001011100100;
      memory[2]  = 16'b0000100111111011;
      memory[3]  = 16'b0000010100010001;
      memory[4]  = 16'b0000001010001011;
      memory[5]  = 16'b0000000101000101;
      memory[6]  = 16'b0000000010100010;
      memory[7]  = 16'b0000000001010001;
      memory[8]  = 16'b0000000000101000;
      memory[9]  = 16'b0000000000010100;
      memory[10] = 16'b0000000000001010;
      memory[11] = 16'b0000000000000101;
      memory[12] = 16'b0000000000000010;
      memory[13] = 16'b0000000000000001;
      memory[14] = 16'b0000000000000000;
      memory[15] = 16'b0000000000000000;
    end
    
endmodule 


