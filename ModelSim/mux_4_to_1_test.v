`timescale 1ns/1ns

module mux_4_to_1_test;

parameter WORD_WIDTH = 16;
parameter clock_period = 4;

reg [1:0]             sel;
reg [WORD_WIDTH-1:0]  in1;
reg [WORD_WIDTH-1:0]  in2;
reg [WORD_WIDTH-1:0]  in3;
reg [WORD_WIDTH-1:0]  in4;
wire [WORD_WIDTH-1:0] out;

//-----instance of mux_4_to_1 module
mux_4_to_1
#(
  .WORD_WIDTH(WORD_WIDTH)
)
  mux_4_to_1_inst (
  .sel(sel),
  .in1(in1),
  .in2(in2),
  .in3(in3),
  .in4(in4),
  .out(out)
)
;

initial
 begin
     in1 = 16'b0000_1111_0101_0000;
     in2 = 16'b1111_1111_0101_0000;
     in3 = 16'b1010_1010_1010_1010;
     in4 = 16'b0111_1111_1111_1111;
     sel = 2'd0;
     # clock_period;
     sel = 2'd1;
     # clock_period;
     sel = 2'd2;
     # clock_period;
     sel = 2'd3;
     # clock_period;
     sel = 2'd0;
     # (5*clock_period);
     $stop;
  end
  
  initial begin
    $display("mux WIDTH = %0d", WORD_WIDTH);
    $monitor("@%3tns: sel = %0d -> out = %0b", $time, sel, out);
  end
    
endmodule