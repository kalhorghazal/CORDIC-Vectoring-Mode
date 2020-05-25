`timescale 1ns/1ns

module ROM_test;
  
parameter WORD_LENGTH = 16;
parameter ADDRESS_LENGTH = 4;
parameter MEMORY_DEPTH = 16;

reg                      read_enable;
reg [ADDRESS_LENGTH-1:0] address;
wire [WORD_LENGTH-1:0]   data;

//-----instance of ROM module
ROM
#(
   .WORD_LENGTH(WORD_LENGTH),
   .ADDRESS_LENGTH(ADDRESS_LENGTH),
   .MEMORY_DEPTH(MEMORY_DEPTH)
)
   ROM_inst (
      .read_enable(read_enable),
      .address(address),
      .data(data)
);   

//applying inputs and monitoring the results
initial
   begin
     read_enable = 1'b0;
     address = {ADDRESS_LENGTH{1'b0}}; 
     #10
     read_enable = 1'b1;
     address = 4'd4;
     #10
     address = 4'd5;
     #10
     address = 4'd9;
     #10
     address = 4'd12;
     #10
     address = 4'd10;
     #10
     address = 4'd3;
     #10
     address = 4'd2;
     #10
     address = 4'd11;
     #20 $stop;
   end
   
   initial begin
    $display("WORD LENGTH = %0d ADDRESS_LENGTH = %0d", 
      WORD_LENGTH, ADDRESS_LENGTH);
    $monitor("@%3tns: ROM[%0d] = %0d", 
      $time, address, data);
    end

endmodule