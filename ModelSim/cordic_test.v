`include "settings.h"  

module cordic_test;
  
integer file_x, file_y, file_z;
integer scan_x, scan_y;

parameter clock_period = `TEST_CASES;
parameter TEST_CASES = `TEST_CASES;

localparam sf = 2.0**-7.0;  //scaling factor is 2^-7

reg                            clk;
reg                            rst;
reg                            start;
wire                           done;
reg signed [`WORD_WIDTH-1:0]   x_in;
reg signed [`WORD_WIDTH-1:0]   y_in;
wire [`PHASE_WIDTH-1:0] z_out;

//-----instance of interface module
interface
  interface_inst (
  .clk(clk),
  .rst(rst),
  .start(start),
  .done(done),
  .x_in(x_in),
  .y_in(y_in),
  .z_out(z_out)
)
;

//generating clock for the test bench
initial
   begin
      clk = 0;
      forever clk = #(clock_period/2)  ~clk;
   end

initial begin
    file_x = $fopen("x_values.txt", "r");
    if (file_x == 1) begin
      $display("file_x handle was NULL");
      $finish;
    end
  end
  
initial begin
  file_y = $fopen("y_values.txt", "r");
  if (file_y == 1) begin
    $display("file_y handle was NULL");
    $finish;
  end
end

initial begin
  file_z = $fopen("verilog_phase.txt", "w");
  if (file_z == 1) begin
    $display("file_y handle was NULL");
    $finish;
  end
end

initial
   begin
      repeat(TEST_CASES)
        begin
          if(!$feof(file_x))
              scan_x = $fscanf(file_x, "%b\n", x_in);
            
          if(!$feof(file_y))
              scan_y = $fscanf(file_y, "%b\n", y_in);
              
          start  = 1;
          rst = 0;
          # clock_period;
          rst = 1;
          start = 0;
          # (100*clock_period);
          
          $fdisplay(file_z, "%0f", $itor(z_out)*sf);
                    
          $display("@%3tns: done = %0b, arctan(%0d/%0d) = %0f", 
              $time, done, y_in, x_in, $itor(z_out)*sf);
        end
        $stop;
   end
   
   initial begin
     $monitor("%d", done);
   end
    
endmodule