`timescale 1ns/1ns

module ALU_test;
  
parameter WORD_LENGTH = 16;

reg                     ALU_operation;
reg [WORD_LENGTH-1:0]   A;
reg [WORD_LENGTH-1:0]   B;
wire [WORD_LENGTH-1:0]  AlU_out;

reg [8*4:1] operator;

//-----instance of ALU module
ALU
#(
   .WORD_LENGTH(WORD_LENGTH)
)
   ALU_inst (
      .ALU_operation(ALU_operation),
      .A(A),
      .B(B),
      .AlU_out(AlU_out)
);   

//applying inputs and monitoring the results
initial
   begin
     ALU_operation = 1'b0;
     A = {WORD_LENGTH{1'b0}}; 
     B = {WORD_LENGTH{1'b0}};
     operator = "+";
     #10
     ALU_operation = 1'b0;
     A = 16'd16;
     B = 16'd32;
     operator = "+";
     #10
     ALU_operation = 1'b0;
     A = 16'd21;
     B = 16'd18;
     operator = "+";
     #10
     ALU_operation = 1'b0;
     A = {WORD_LENGTH{1'b1}};
     B = 16'd1;
     operator = "+";
     #10
     ALU_operation = 1'b1;
     A = 16'd128;
     B = 16'd17;
     operator = "-";
     #10
     ALU_operation = 1'b1;
     A = 16'd64;
     B = 16'd24;
     operator = "-";
     #10
     ALU_operation = 1'b1;
     A = 16'd20;
     B = 16'd20;
     operator = "-";
     #10
     ALU_operation = 1'b1;
     A = 16'd72;
     B = 16'd25;
     operator = "-";
     #10
     ALU_operation = 1'b1;
     A = 16'd45;
     B = 16'd90;
     operator = "-";
     #20 $stop;
   end
   
   initial begin
    $display("ALU WIDTH = %0d", WORD_LENGTH);
    $monitor("@%3tns: %0d %0s %0d = %0d", 
      $time, A, operator, B, AlU_out);
    end
   
endmodule
