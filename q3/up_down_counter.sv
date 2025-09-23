module up_down_counter #(parameter N = 4)
                       (input  logic clk,
                        input  logic rst_n,
                        input  logic up_down,
                        input  logic load,
                        input  logic [N-1:0] input_load,
                        output logic [N-1:0] count_out,
                        output logic carry_out);
  
  // complete here
logic [N-1:0] counter;

always_ff @(posedge clk or negedge rst_n) begin : shift_reg
  if (!rst_n) begin
    counter <= '0;
    carry_out <= 0;
  end
  else begin
    carry_out <= 0;
    if (load) begin
      counter <= input_load;
    end
    else begin
      if (up_down) begin
        counter <= counter + 1;
        if (&counter)
          carry_out <= 1;
      end
      else begin
        counter <= counter - 1;
        if (!(|counter))
          carry_out <= 1;
      end
    end
  end
end

assign count_out = counter;

endmodule
