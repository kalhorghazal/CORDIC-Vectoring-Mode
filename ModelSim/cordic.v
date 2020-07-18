`include "defines.v"  

module cordic 
(
  input clk,
  input rst,

  input signed [`WORD_WIDTH-1:0]  x_in,
  input signed [`WORD_WIDTH-1:0]  y_in,
 
  output signed [`PHASE_WIDTH-1:0] z_out
);
 
/*
   arctan table in degree U(9,7) format 16 bits 
*/
function [`PHASE_WIDTH-1:0] arctangent;
  input [3:0] i;
  begin
    case (i)
    0 : arctangent = 16'b000101101_0000000; // phase = 45.000000
    1 : arctangent = 16'b000010110_1000000; // phase = 22.500000
    2 : arctangent = 16'b000001011_0100000; // phase = 11.250000
    3 : arctangent = 16'b000000101_1010000; // phase = 5.6250000
    4 : arctangent = 16'b000000010_1101000; // phase = 2.8125000
    5 : arctangent = 16'b000000001_0110100; // phase = 1.4062500
    6 : arctangent = 16'b000000000_1010011; // phase = 0.7031250
    7 : arctangent = 16'b000000000_0101100; // phase = 0.3515620
    8 : arctangent = 16'b000000000_0010110; // phase = 0.1757810
    9 : arctangent = 16'b000000000_0001011; // phase = 0.0878910
    10: arctangent = 16'b000000000_0000101; // phase = 0.0439450
    11: arctangent = 16'b000000000_0000010; // phase = 0.0219730
    12: arctangent = 16'b000000000_0000001; // phase = 0.0109860
    13: arctangent = 16'b000000000_0000000; // phase = 0.0054930
    14: arctangent = 16'b000000000_0000000; // phase = 0.0027470
    15: arctangent = 16'b000000000_0000000; // phase = 0.0013730
    default: arctangent = 16'b000000000_0000000; // phase = 0
    endcase
  end
endfunction
 
  wire signed [`WORD_WIDTH-1:0] x [`ITERATIONS-1:0];
  wire signed [`WORD_WIDTH-1:0] y [`ITERATIONS-1:0];
  wire signed [`PHASE_WIDTH-1:0] z [`ITERATIONS-1:0];
  
  wire signed [`PHASE_WIDTH-1:0] offset;
  
  abs
  #(
   .WORD_WIDTH(`WORD_WIDTH)
  )
  abs_inst_x (
   .ans(x_in),
   .abs_ans(x[0])
  ); 
  
  abs
  #(
   .WORD_WIDTH(`WORD_WIDTH)
  )
  abs_inst_y (
   .ans(y_in),
   .abs_ans(y[0])
  ); 
  
  mux_4_to_1
  #(
   .WORD_WIDTH(`PHASE_WIDTH)
  )
  mux_4_to_1_inst (
   .sel({x_in[`WORD_WIDTH-1], y_in[`WORD_WIDTH-1]}),
   .in1(`FIRST_QUADRANT),
   .in2(`THIRD_QUADRANT),
   .in3(`SECOND_QUADRANT),
   .in4(`THIRD_QUADRANT),
   .out(offset)
  ); 
  
  Adder
  #(
   .WORD_WIDTH(`PHASE_WIDTH)
  )
  Adder_inst (
   .A(z[`ITERATIONS-1]),
   .B(offset),
   .AlU_out(z_out)
  );
  
  assign z[0] = 0;

genvar i;
generate 
  for(i=0; i < `ITERATIONS-1; i=i+1) begin
    rotator 
    #(
      .ITERATION(i),
      .PHASE(arctangent(i))
    )
    rotator_inst (
      .clk(clk), 
      .rst(rst), 
      .x_in(x[i]), 
      .y_in(y[i]), 
      .z_in(z[i]), 
      .x_out(x[i+1]), 
      .y_out(y[i+1]), 
      .z_out(z[i+1])
    );
  end 
endgenerate

endmodule