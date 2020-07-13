module data_path
#(
  parameter WORD_LENGTH = 16,
  parameter ITERATION_WIDTH = 4
)
(
  input                       clk,
  input                       rst,          
  input                       load_x,
  input                       load_y,
  input                       load_z,
  input                       load_d,
  input                       load_d0,
  input [1:0]                 sel_x,
  input [1:0]                 sel_y,
  input [1:0]                 sel_z,
  input                       clear_z,
  input [WORD_LENGTH-1:0]     x_in, 
  input [WORD_LENGTH-1:0]     y_in, 
  input [ITERATION_WIDTH-1:0] iteration_counter,
  output [WORD_LENGTH-1:0]    z_out
);

  wire reg_out_d0;
  wire reg_out_d;
  wire sign_out_y;
  wire inverted_d;
  wire inverted_d0;
  
  wire [WORD_LENGTH-1:0] reg_out_x;
  wire [WORD_LENGTH-1:0] reg_out_y;
  wire [WORD_LENGTH-1:0] reg_out_z;
  
  wire [WORD_LENGTH-1:0] abs_out_y;
  
  wire [WORD_LENGTH-1:0] ROM_out;
  
  wire [WORD_LENGTH-1:0] mult_out;
  
  wire [WORD_LENGTH-1:0] inverted_x;
  
  wire [WORD_LENGTH-1:0] mux_out_x;
  wire [WORD_LENGTH-1:0] mux_out_y;
  wire [WORD_LENGTH-1:0] mux_out_z;
  
  wire [WORD_LENGTH-1:0] mux_2to1_out_z;
  wire [WORD_LENGTH-1:0] mux_2to1_out_y;
  
  wire [WORD_LENGTH-1:0] ALU_out_x;
  wire [WORD_LENGTH-1:0] ALU_out_y;
  wire [WORD_LENGTH-1:0] ALU_out_z;
  
  wire [WORD_LENGTH-1:0] shift_out_x;
  wire [WORD_LENGTH-1:0] shift_out_y;
  
  inverter
  #(
   .WORD_LENGTH(1)
  )
  inverter_inst_d (
   .in(reg_out_d),
   .out(inverted_d)
  );
  
  inverter
  #(
   .WORD_LENGTH(1)
  )
  inverter_inst_d0 (
   .in(reg_out_d0),
   .out(inverted_d0)
  );
  
  inverter
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  inverter_inst_x (
   .in(reg_out_x),
   .out(inverted_x)
  );
  
  sign
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  sign_inst (
   .ans(reg_out_y),
   .sign_ans(sign_out_y)
  );
  
  abs
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  abs_inst (
   .ans(reg_out_y),
   .abs_ans(abs_out_y)
  ); 
  
  mux_2_to_1
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  mux_2_to_1_inst_y (
   .sel(inverted_d0),
   .in1(inverted_x), 
   .in2(reg_out_x), 
   .out(mux_2to1_out_y)
  );
  
  mux_2_to_1
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  mux_2_to_1_inst_z (
   .sel(reg_out_d0),
   .in1(16'b000000000_1000000), // 0.5
   .in2(16'b111111111_1000000), // -0.5
   .out(mux_2to1_out_z)
  ); 
  
  mux_3_to_1
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  mux_3_to_1_inst_x (
   .sel(sel_x),
   .in1(x_in),
   .in2(abs_out_y),
   .in3(ALU_out_x),
   .out(mux_out_x)
  ); 
  
  mux_3_to_1
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  mux_3_to_1_inst_y (
   .sel(sel_y),
   .in1(y_in),
   .in2(mux_2to1_out_y),
   .in3(ALU_out_y),
   .out(mux_out_y)
  ); 
  
  mux_3_to_1
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  mux_3_to_1_inst_z (
   .sel(sel_z),
   .in1(mux_2to1_out_z),
   .in2(ALU_out_z),
   .in3(mult_out),
   .out(mux_out_z)
  ); 
  
  register
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  register_inst_x (
   .clk(clk),
   .rst(rst),
   .load(load_x),
   .in(mux_out_x),
   .out(reg_out_x)
  ); 
  
  register
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  register_inst_y (
   .clk(clk),
   .rst(rst),
   .load(load_y),
   .in(mux_out_y),
   .out(reg_out_y)
  ); 
  
  phase_register
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  phase_register_inst_z (
   .clk(clk),
   .rst(rst),
   .clear(clear_z),
   .load(load_z),
   .in(mux_out_z),
   .out(reg_out_z)
  ); 
  
  register
  #(
   .WORD_LENGTH(1)
  )
  register_inst_d0 (
   .clk(clk),
   .rst(rst),
   .load(load_d0),
   .in(sign_out_y),
   .out(reg_out_d0)
  ); 
  
  register
  #(
   .WORD_LENGTH(1)
  )
  register_inst_d (
   .clk(clk),
   .rst(rst),
   .load(load_d),
   .in(sign_out_y),
   .out(reg_out_d)
  ); 

  ALU
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  ALU_inst_x (
   .ALU_operation(inverted_d),
   .A(reg_out_x),
   .B(shift_out_y),
   .AlU_out(ALU_out_x)
  );   
  
  ALU
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  ALU_inst_y (
   .ALU_operation(reg_out_d),
   .A(reg_out_y),
   .B(shift_out_x),
   .AlU_out(ALU_out_y)
  ); 
  
  ALU
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  ALU_inst_z (
   .ALU_operation(inverted_d0),
   .A(reg_out_z),
   .B(ROM_out),
   .AlU_out(ALU_out_z)
  ); 
  
  multiplier
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  multiplier_inst (
   .A(reg_out_z),
   .B(16'b000111001_0100101), // 180/pi
   .mult_out(mult_out)
  ); 
  
  shift_right_var
  #(
   .WORD_LENGTH(WORD_LENGTH),
   .SHIFT_LENGTH(ITERATION_WIDTH)
  )
  shift_right_var_inst_x (
   .data_in(reg_out_x),
   .shift_amount(iteration_counter),
   .data_out(shift_out_x)
  ); 
  
  shift_right_var
  #(
   .WORD_LENGTH(WORD_LENGTH),
   .SHIFT_LENGTH(ITERATION_WIDTH)
  )
  shift_right_var_inst_y (
   .data_in(reg_out_y),
   .shift_amount(iteration_counter),
   .data_out(shift_out_y)
  ); 
  
  ROM
  #(
   .WORD_LENGTH(WORD_LENGTH),
   .ADDRESS_LENGTH(ITERATION_WIDTH)
  )
  ROM_inst (
   .address(iteration_counter),
   .data(ROM_out)
  );
  
  assign z_out = reg_out_z;

endmodule