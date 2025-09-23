`timescale 1ns/1ns
module up_down_counter_tb;

// complete here
parameter N = 4;

  logic              clk;
  logic              rst_n;
  logic              up_down;
  logic              load;
  logic [N-1:0]      input_load;
  logic [N-1:0]      count_out;
  logic              carry_out;

  up_down_counter #(N) dut (
    .clk(clk),
    .rst_n(rst_n),
    .up_down(up_down),
    .load(load),
    .input_load(input_load),
    .count_out(count_out),
    .carry_out(carry_out)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst_n = 0;
    up_down = 1;      
    load = 0;
    input_load = '0;
    #10 rst_n = 1;
    #10 load = 1; input_load = 4'b1010;  
    #10 load = 0;
    #100;
    up_down = 0;
    #100;
    load = 1; input_load = 4'b0011; 
    #10 load = 0;
    #100;
    $finish;
  end

  initial begin
    $monitor("T=%0t | rst_n=%b | up_down=%b | load=%b | input_load=%b | count_out=%b | carry_out=%b",
             $time, rst_n, up_down, load, input_load, count_out, carry_out);
  end

endmodule
