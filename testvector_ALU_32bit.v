module testvector_ALU_32bit();

reg [31:0] A;
reg [31:0] B;
reg [2:0] F;
reg [31:0] ExpectedY;
reg ExpectedZero;
reg ExpectedOverflow;
wire [31:0] Y; 
wire Zero;
wire Overflow;

reg clk;

ALU_32bit dut(A, B, F, Y, Zero, Overflow);

reg [31:0] vectornum, errors;
reg [100:0] testvectors[13:0];

always
  begin
    clk = 1; #100; clk = 0; #100;
  end 

initial
  begin
    $readmemb("//vmware-host/Shared Folders/Desktop/SJSU/CMPE 125/Lab 7/testvector_ALU_32bit.tv.txt", testvectors);
    vectornum = 0; errors = 0;
  end 
 always @(posedge clk)
 begin 
 #1; {ExpectedOverflow, ExpectedZero, F, A, B, ExpectedY} = testvectors[vectornum];
 end 
 
 always @ (negedge clk)
 begin 
	if ({Y, Zero, Overflow} !== 
	{ExpectedY, ExpectedZero, ExpectedOverflow})
	begin
	$display("Error: inputs: F = %b, A = %b, B = %b", F, A, B);
	$display("Y = %b, Zero = %b Overflow = %b\n (Expected Y = %b, Expected Zero = %b, Expected Overflow = %b)",
				Y, Zero, Overflow, ExpectedY, ExpectedZero, ExpectedOverflow);
   errors = errors + 1;
   end
	else if({Y, Zero, Overflow} === 
	{ExpectedY, ExpectedZero, ExpectedOverflow})
	begin
	$display("Success!: inputs: F = %b, A = %b, B = %b", F, A, B);
	$display("Y = %b, Zero = %b Overflow = %b\n (Expected Y = %b, Expected Zero = %b, Expected Overflow = %b)",
				Y, Zero, Overflow, ExpectedY, ExpectedZero, ExpectedOverflow);
   end
     vectornum = vectornum + 1;
     if (testvectors[vectornum] === 101'bx)
       begin
         $display("%d tests completed with %d errors", vectornum, errors);
         $finish;
end 
end
endmodule
