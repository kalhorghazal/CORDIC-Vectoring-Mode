`timescale 1ns/1ns

module ROM_test;

parameter clock_period = 10;  

parameter WORD_LENGTH = 16;
parameter ADDRESS_LENGTH = 4;

reg [ADDRESS_LENGTH-1:0] address;
wire [WORD_LENGTH-1:0]   data;

//-----instance of ROM module
ROM
#(
   .WORD_LENGTH(WORD_LENGTH),
   .ADDRESS_LENGTH(ADDRESS_LENGTH)
)
   ROM_inst (
      .address(address),
      .data(data)
);   

//applying inputs and monitoring the results
initial
   begin
     address = {ADDRESS_LENGTH{1'b0}}; 
     # clock_period
     address = 4'd4;
     # clock_period
     address = 4'd5;
     # clock_period
     address = 4'd9;
     # clock_period
     address = 4'd12;
     # clock_period
     address = 4'd10;
     # clock_period
     address = 4'd3;
     # clock_period
     address = 4'd2;
     # clock_period
     address = 4'd11;
     # (2*clock_period) $stop;
   end
   
   initial begin
    $display("WORD LENGTH = %0d ADDRESS_LENGTH = %0d", 
      WORD_LENGTH, ADDRESS_LENGTH);
    $monitor("@%3tns: ROM[%0d] = %0d", 
      $time, address, data);
    end

endmodule