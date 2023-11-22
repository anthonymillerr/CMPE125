module CLA4_tb;

  reg [3:0] A, B;
  reg Ci;
  wire [3:0] S;
  wire Co, PG, GG;
  CLA4 dut(A, B, Ci, S, Co, PG, GG);

  initial begin

    A = 4'b0101;
    B = 4'b0011;
    Ci = 1;
    #10;
    if (S !== 4'b1001 || Co !== 0 || PG !== 0 || GG !== 0)
      $display("Operation 1 Failed");

    A = 4'b1100;
    B = 4'b1010;
    Ci = 0;
    #10;
    if (S !== 4'b0110 || Co !== 1 || PG !== 0 || GG !== 1)
      $display("Operation 2 Failed");

    A = 4'b0011;
    B = 4'b1111;
    Ci = 1;
    #10;
    if (S !== 4'b0011 || Co !== 1 || PG !== 0 || GG !== 1)
      $display("Operation 3 Failed");

    A = 4'b1010;
    B = 4'b0101;
    Ci = 0;
    #10;
    if (S !== 4'b1111 || Co !== 0 || PG !== 1 || GG !== 0)
      $display("Operation 4 Failed");
  end

endmodule