module shift_register_tb;

// complete here
parameter N = 4;

  logic              clk;
  logic              rst_n;
  logic              serial_parallel;
  logic              load_enable;
  logic              serial_in;
  logic [N-1:0]      parallel_in;
  logic [N-1:0]      parallel_out;
  logic              serial_out;

  shift_register #(N) dut (
    .clk(clk),
    .rst_n(rst_n),
    .serial_parallel(serial_parallel),
    .load_enable(load_enable),
    .serial_in(serial_in),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out),
    .serial_out(serial_out)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst_n = 0;
    serial_parallel = 0;
    load_enable = 0;
    serial_in = 0;
    parallel_in = '0;

    #10 rst_n = 1;

    #10 load_enable = 1;
        serial_parallel = 1;
        parallel_in = 4'b1010;
    #10 load_enable = 0;

    #10 load_enable = 1;
        serial_parallel = 0; serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;

    #30 $finish;
  end

  initial begin
    $monitor("T=%0t | rst_n=%b | load_enable=%b | mode(serial_parallel)=%b | serial_in=%b | parallel_in=%b | parallel_out=%b | serial_out=%b",
              $time, rst_n, load_enable, serial_parallel, serial_in, parallel_in, parallel_out, serial_out);
  end

endmodule
