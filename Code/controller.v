module controller
#(
  parameter ITERATION_WIDTH = 4
)
(
  input                       clk,
  input                       rst,
  input                       start,
  input                       neg_x,
  input [ITERATION_WIDTH-1:0] n
);
  
  parameter IDLE        = 3'b000;
  parameter LOAD        = 3'b001;
  parameter NORMALIZE   = 3'b010;
  parameter LOOP        = 3'b011;
  parameter OPERATE     = 3'b100;
  parameter FINALIZE    = 3'b101;
  
  reg [2:0] next_state;
  reg [2:0] state;
  
  integer iteration_counter;
  
  always@(*) begin
    case(state)
      IDLE: begin
      end
      LOAD: begin
      end
      NORMALIZE: begin
      end
      LOOP: begin
      end
      OPERATE: begin
      end
      FINALIZE: begin
      end
      default: begin
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
    if(~rst)
      state <= IDLE;
    else
      state <= next_state;
  end
  
endmodule
