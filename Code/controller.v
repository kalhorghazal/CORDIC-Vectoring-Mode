module controller
#(
  parameter ITERATION_WIDTH = 4
)
(
  input                       clk,
  input                       rst,
  input                       start,
  input                       neg_x,
  input [ITERATION_WIDTH-1:0] n,
  output reg                  done,
  output reg                  load_x,
  output reg                  load_y,
  output reg                  load_z,
  output reg                  load_d,
  output reg                  load_d0,
  output reg [1:0]            sel_x,
  output reg [1:0]            sel_y,
  output reg [1:0]            sel_z,
  output reg                  clear_z
);
  
  parameter IDLE        = 3'b000;
  parameter LOAD        = 3'b001;
  parameter NORMALIZE   = 3'b010;
  parameter LOOP        = 3'b011;
  parameter OPERATE     = 3'b100;
  parameter FINALIZE    = 3'b101;
  
  reg [2:0] next_state;
  reg [2:0] state;  
  reg iteration_counter;
  
  always@(*) begin   
    {done, load_x, load_y, load_z, load_d, load_d0, clear_z} = 7'd0;
    
    case(state)
      IDLE: begin
        done = 1'd1;
      end
      LOAD: begin
        clear_z = 1'd1;
        load_d0 = 1'd1;
        load_x = 1'd1;
        load_y = 1'd1;
        sel_x = 2'd0;
        sel_y = 2'd0;
      end
      NORMALIZE: begin
        load_x = 1'd1;
        load_y = 1'd1;
        load_z = 1'd1;
        sel_x = 2'd1;
        sel_y = 2'd1;
        sel_z = 2'd0;
      end
      LOOP: begin
        load_d = 1'd1;
      end
      OPERATE: begin
        load_x = 1'd1;
        load_y = 1'd1;
        load_z = 1'd1;
        sel_x = 2'd2;
        sel_y = 2'd2;
        sel_z = 2'd1;
      end
      FINALIZE: begin
        load_z = 1'd1;
        sel_z = 2'd2;
      end
      default: begin
        {done, load_x, load_y, load_z, load_d, load_d0, clear_z} = 7'd0;
      end
    endcase
  end
  
  always@(*) begin
    next_state = state;
    case(state)
      IDLE: begin
        next_state = (start) ? LOAD : IDLE;
      end
      LOAD: begin
        next_state = (neg_x) ? NORMALIZE : LOOP;
      end
      NORMALIZE: begin
        next_state = LOOP;
      end
      LOOP: begin
        next_state = OPERATE;
      end
      OPERATE: begin
        next_state = (iteration_counter < n) ? LOOP : FINALIZE;
      end
      FINALIZE: begin
        next_state = IDLE;
      end
      default: begin
        next_state = IDLE;
      end
    endcase
  end
  
  always@(posedge clk or negedge rst) begin
    if(~rst) begin
      state <= IDLE;
    end
    else begin
      state <= next_state;
    end
  end
  
  always@(posedge clk or negedge rst) begin
    if(~rst) begin
      iteration_counter <= 0;
    end
    else if(state == OPERATE) begin
      iteration_counter <= iteration_counter + 1;
    end
    else begin
      iteration_counter <= iteration_counter;
    end
  end
  
endmodule
