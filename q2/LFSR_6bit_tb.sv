`timescale 1ns/1ns

module LFSR_6bit_tb;

// complete here
  logic        clk;
  logic        rst_n;
  logic        sel;
  logic [5:0]  parallel_in;
  logic [5:0]  parallel_out;

  LFSR_6bit dut (
    .clk(clk),
    .rst_n(rst_n),
    .sel(sel),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst_n = 0;
    sel = 0;
    parallel_in = 6'b0;
    #10 rst_n = 1;
    #10 sel = 0; parallel_in = 6'b101011;
    #10 sel = 1; 
    #100;
    $finish;
  end

  initial begin
    $monitor("T=%0t | rst_n=%b | sel=%b | parallel_in=%b | parallel_out=%b",
             $time, rst_n, sel, parallel_in, parallel_out);
  end
endmodule
