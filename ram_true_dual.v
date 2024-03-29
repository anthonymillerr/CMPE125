module ram_true_dual(
  output reg [7:0] q1,
  output reg [7:0] q2,
  input [7:0] d1,
  input [7:0] d2,
  input [6:0] a1,
  input [6:0] a2,
  input we1,
  input we2,
  input clk
);
  reg [7:0] mem [127:0];


  always @(posedge clk) begin
    q1 <= mem[a1];
  end

  always @(posedge clk) begin
    if (we1)
      mem[a1] <= d1;
  end

  always @(posedge clk) begin
    q2 <= mem[a2];
  end

  always @(posedge clk) begin
    if (we2)
      mem[a2] <= d2;
  end
endmodule
