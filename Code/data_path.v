module data_path
#(
  parameter WORD_LENGTH = 16
)
(
  input                    clk,
  input                    rst,          
  input                    load_x,
  input                    load_y,
  input                    load_z,
  input                    load_d,
  input                    load_d0,
  input [1:0]              sel_x,
  input [1:0]              sel_y,
  input [1:0]              sel_z,
  input                    clear_z,
  input [WORD_LENGTH-1:0]  x_in, 
  input [WORD_LENGTH-1:0]  y_in, 
  output [WORD_LENGTH-1:0] z_out
);
  
  wire [WORD_LENGTH-1:0] reg_out_x;
  wire [WORD_LENGTH-1:0] reg_out_y;
  
  wire [WORD_LENGTH-1:0] mux_out_x;
  wire [WORD_LENGTH-1:0] mux_out_y;
  wire [WORD_LENGTH-1:0] mux_out_z;
  
  wire [WORD_LENGTH-1:0] ALU_out_x;
  wire [WORD_LENGTH-1:0] ALU_out_y;
  wire [WORD_LENGTH-1:0] ALU_out_z;
  
  mux_3_to_1
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  mux_3_to_1_inst_x (
   .sel(sel_x),
   .in1(x_in),
   .in2(),
   .in3(),
   .out(mux_out_x)
  ); 
  
  mux_3_to_1
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  mux_3_to_1_inst_y (
   .sel(sel_y),
   .in1(y_in),
   .in2(),
   .in3(),
   .out(mux_out_y)
  ); 
  
  mux_3_to_1
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  mux_3_to_1_inst_z (
   .sel(sel_z),
   .in1(),
   .in2(),
   .in3(),
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
   .out(z_out)
  ); 
  
  register
  #(
   .WORD_LENGTH(1)
  )
  register_inst_d0 (
   .clk(clk),
   .rst(rst),
   .load(load_d0),
   .in(),
   .out()
  ); 
  
  register
  #(
   .WORD_LENGTH(1)
  )
  register_inst_d (
   .clk(clk),
   .rst(rst),
   .load(load_d),
   .in(),
   .out()
  ); 

  ALU
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  ALU_inst_x (
   .ALU_operation(),
   .A(),
   .B(),
   .AlU_out(ALU_out_x)
  );   
  
  ALU
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  ALU_inst_y (
   .ALU_operation(),
   .A(),
   .B(),
   .AlU_out(ALU_out_y)
  ); 
  
  ALU
  #(
   .WORD_LENGTH(WORD_LENGTH)
  )
  ALU_inst_z (
   .ALU_operation(),
   .A(),
   .B(),
   .AlU_out(ALU_out_z)
  ); 

endmodule
