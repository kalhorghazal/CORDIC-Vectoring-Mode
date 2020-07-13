module phase_register
#(
  parameter WORD_LENGTH = 16
)  
(
  input                        clk,
  input                        rst,
  input                        clear,
  input                        load,
  input [WORD_LENGTH-1:0]      in,
  output reg [WORD_LENGTH-1:0] out
);
  
always @(posedge clk or negedge rst) begin
  if(~rst) begin
    out <= 0;
  end  
  else if(clear) begin
    out <= 0;
  end
  else if(load) begin
    out <= in;
  end   
  else begin
    out <= out;
  end   
 end
       
endmodule