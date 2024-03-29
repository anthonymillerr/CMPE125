module ram_dual(
  output reg [7:0] q1,
  output reg [7:0] q2,
  input [7:0] d1,
  input [7:0] d2,
  input [6:0] a1,
  input [6:0] a2,
  input we1,
  input we2,
  input clk1,
  input clk2
);
  reg [7:0] mem [127:0];

  always @(posedge clk1) begin
    q1 <= mem[a1];
  end


  always @(posedge clk1) begin
    if (we1)
      mem[a1] <= d1;
  end

  always @(posedge clk2) begin
    q2 <= mem[a2];
  end

  always @(posedge clk2) begin
    if (we2)
      mem[a2] <= d2;
  end
endmodule
