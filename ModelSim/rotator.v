`include "defines.v"   
 
module rotator 
#(
  parameter [3:0] ITERATION = 4'd0,
  parameter signed [`PHASE_WIDTH-1:0] PHASE = 0
)
(
  input                            clk,
  input                            rst,
  
  input signed [`WORD_WIDTH-1:0]   x_in,
  input signed [`WORD_WIDTH-1:0]   y_in,
  input signed [`PHASE_WIDTH-1:0]  z_in,
  
  output signed [`WORD_WIDTH-1:0]  x_out,
  output signed [`WORD_WIDTH-1:0]  y_out,
  output signed [`PHASE_WIDTH-1:0] z_out
);

  wire signed [`WORD_WIDTH-1:0] shift_out_x;
  wire signed [`WORD_WIDTH-1:0] shift_out_y;
  
  wire signed [`WORD_WIDTH-1:0] ALU_out_x;
  wire signed [`WORD_WIDTH-1:0] ALU_out_y;
  wire signed [`PHASE_WIDTH-1:0] ALU_out_z;
  
  sign
  #(
   .WORD_WIDTH(`WORD_WIDTH)
  )
  sign_inst (
   .ans(y_in),
   .sign_ans(sign_out_y)
  );
  
  ALU
  #(
   .WORD_WIDTH(`WORD_WIDTH)
  )
  ALU_inst_x (
   .ALU_operation(sign_out_y),
   .A(x_in),
   .B(shift_out_y),
   .AlU_out(ALU_out_x)
  ); 
  
  ALU
  #(
   .WORD_WIDTH(`WORD_WIDTH)
  )
  ALU_inst_y (
   .ALU_operation(~sign_out_y),
   .A(y_in),
   .B(shift_out_x),
   .AlU_out(ALU_out_y)
  );
  
  ALU
  #(
   .WORD_WIDTH(`PHASE_WIDTH)
  )
  ALU_inst_z (
   .ALU_operation(sign_out_y),
   .A(z_in),
   .B(PHASE),
   .AlU_out(ALU_out_z)
  );
  
  register
  #(
   .WORD_WIDTH(`WORD_WIDTH)
  )
  register_inst_x (
   .clk(clk),
   .rst(rst),
   .data_in(ALU_out_x),
   .data_out(x_out)
  ); 
  
  register
  #(
   .WORD_WIDTH(`WORD_WIDTH)
  )
  register_inst_y (
   .clk(clk),
   .rst(rst),
   .data_in(ALU_out_y),
   .data_out(y_out)
  );
  
  register
  #(
   .WORD_WIDTH(`PHASE_WIDTH)
  )
  register_inst_z (
   .clk(clk),
   .rst(rst),
   .data_in(ALU_out_z),
   .data_out(z_out)
  );
  
  shift_right_var 
  #(
    .WORD_WIDTH(`WORD_WIDTH),
    .SHIFT_WIDTH(`ITERATION_WIDTH)
  )
  shift_right_var_inst_x (
    .data_in(x_in), 
    .shift_amount(ITERATION), 
    .data_out(shift_out_x)
  );
  
  shift_right_var 
  #(
    .WORD_WIDTH(`WORD_WIDTH),
    .SHIFT_WIDTH(`ITERATION_WIDTH)
  )
  shift_right_var_inst_y (
    .data_in(y_in), 
    .shift_amount(ITERATION), 
    .data_out(shift_out_y)
  );
  
endmodule