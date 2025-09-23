module LFSR_6bit (
  input  logic clk, rst_n,
  input  logic sel,
  input  logic [5:0] parallel_in,
  output logic [5:0] parallel_out
);
  // …
  // Add your description here
  // …
logic [5:0] regs;

always_ff @(posedge clk or negedge rst_n) begin : shift_reg
  if (!rst_n) begin
    regs <= '0;
  end
  else begin
    if (sel) begin
      regs[0] <= regs[5];
      regs[1] <= regs[0]^regs[5];
      regs[2] <= regs[1];
      regs[3] <= regs[2]^regs[5];
      regs[4] <= regs[3];
      regs[5] <= regs[4];
    end
    else begin
      regs <= parallel_in;
    end
  end
end

assign parallel_out = regs;

endmodule
