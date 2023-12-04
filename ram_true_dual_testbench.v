module ram_true_dual_testbench;

  reg [7:0] d1, d2;
  reg [6:0] a1, a2;
  reg we1, we2, clk;
  wire [7:0] q1, q2;
  
  ram_true_dual dut(q1, q2, d1, d2, a1, a2, we1, we2, clk);

  initial begin
    // Test Operation #1 Write
    d1 = 8'b01010101;
    a1 = 7'b1111111;
    we1 = 1;
    d2 = 8'b11111111;
    a2 = 7'b1010101;
    we2 = 1;
    clk = 0;
    #100;  
    clk = 1;
    #100; 
	 // Test Operation #1 Read
    we1 = 0;
    we2 = 0;
    clk = 0;
    #100; 
    clk = 1;
    #100; 

    if (q1 === 8'b01010101) $display("Read Value d1 Correct");
    else $display("Read Value d1 Incorrect");
    if (q2 === 8'b11111111) $display("Read Value d2 Correct");
    else $display("Read Value d2 Incorrect");

    // Test Operation #2 Write
    d1 = 8'b11110000;
    a1 = 7'b0000000;
    we1 = 1;
    d2 = 8'b00000000;
    a2 = 7'b0101010;
    we2 = 1;
    clk = 0;
    #100; 
    clk = 1;
    #100;
	 // Test Operation #2 Read
    we1 = 0;
    we2 = 0;
    clk = 0;
    #100; 
    clk = 1;
    #100; 

    if (q1 === 8'b11110000) $display("Read Value d1 Correct");
    else $display("Read Value d2 Incorrect");
    if (q2 === 8'b00000000) $display("Read Value d2 Correct");
    else $display("Read Value d2 Incorrect");

  end

endmodule
