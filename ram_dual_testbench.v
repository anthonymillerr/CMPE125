module ram_dual_testbench;

  reg [7:0] d1, d2;
  reg [6:0] a1, a2;
  reg we1, we2, clk1, clk2;
  wire [7:0] q1, q2;

  ram_dual dut(q1, q2, d1, d2, a1, a2, we1, we2, clk1, clk2);

  initial begin
    // Test Operation #1 Write
    d1 = 8'b01010101;
	 d2 = 8'b10101010; 
    a1 = 7'b1111111;
	 a2 = 7'b0000000;
    we1 = 1;
	 we2 = 1;
    clk1 = 0;
	 clk2 = 0;
    #100;
    clk1 = 1;
	 clk2 = 1;
    #100;

    // Test Operation #1 Read
    we1 = 0;
	 we2 = 0;
    clk1 = 0;
	 clk2 = 0;
    #100;
    clk1 = 1;
	 clk2 = 1;
    #100;
    if (q1 === 8'b01010101) $display("Read Value d1 Correct");
    else $display("Read Value d1 Incorrect");
	 if (q2 === 8'b10101010) $display("Read Value d2 Correct");
    else $display("Read Value d2 Incorrect");
	 
	 // Test Operation #2 Write
    d1 = 8'b11001100;
    d2 = 8'b00110011;
    a1 = 7'b0101010;
    a2 = 7'b0000111;
    we1 = 1;
    we2 = 1;
    clk1 = 0;
    clk2 = 0;
    #100;
    clk1 = 1;
    clk2 = 1;
    #100;

    // Test Operation #2 Read
    we1 = 0;
    we2 = 0;
    clk1 = 0;
    clk2 = 0;
    #100;
    clk1 = 1;
    clk2 = 1;
    #100;
    if (q1 === 8'b11001100) $display("Read Value d1 Correct");
    else $display("Read Value d1 Incorrect");
    if (q2 === 8'b00110011) $display("Read Value d2 Correct");
    else $display("Read Value d2 Incorrect");

  end

endmodule
