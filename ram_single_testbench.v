module ram_single_testbench ();
reg [7:0] d; 
reg [6:0] a; 
reg we; 
reg clk;
wire [7:0] q;

ram_single dut(q, a, d, we, clk);
  initial begin
//Test Operation #1 Write 
    d = 8'b01010101;
    a = 7'b1111111;
    we = 1;
    clk = 0;
    #100;
	 clk =1;
	 #100
//Test Operation #1 Read
    we = 0;
    clk = 0;
    #100;
	 clk =1;
	 #100
	 if (q === 8'b01010101) $display("Read Value Correct");
    if (q !== 8'b01010101) $display("Read Value Incorrect");
//Test Operation #2 Write 
    d = 8'b10101010;
    a = 7'b0000000;
    we = 1;
    clk = 0;
    #100;
	 clk = 1;
	 #100
//Test Operation #2 Read
    we = 0;
    clk = 0;
    #100;
	 clk = 1;
	 if (q === 8'b10101010) $display("Read Value Correct");
    if (q !== 8'b10101010) $display("Read Value Incorrect");

  end
endmodule