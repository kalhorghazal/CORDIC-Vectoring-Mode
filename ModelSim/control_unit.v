module control_unit
#(
  parameter ITERATION_WIDTH = 4,
  parameter ITERATIONS = 16
)
(
  input      clk,
  input      rst,
  input      start,
  output reg done
);
  
  parameter IDLE      = 1'b0;
  parameter COMPUTE   = 1'b1;
  
  reg [ITERATION_WIDTH-1:0] iteration_counter;
  
  reg next_state;
  reg state;  
  
  always@(*) begin   
    done = 0;
    case(state)
      IDLE: begin
        done = 1;
      end
      COMPUTE: begin
      end
      default: begin
        done = 0;
      end
    endcase
  end
  
  always@(*) begin
    next_state = state;
    case(state)
      IDLE: begin
        next_state = (start) ? COMPUTE : IDLE;
      end
      COMPUTE: begin
        next_state = (iteration_counter < ITERATIONS-1) ? COMPUTE : IDLE;
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
    else if(state == COMPUTE) begin
      iteration_counter <= iteration_counter + 1;
    end
    else begin
      iteration_counter <= iteration_counter;
    end
  end
  
endmodule