module test_vector_FSM();

reg clk, reset;
reg N, D, Q;
reg expected_Dispense, expected_ReturnNickel, expected_ReturnDime, expected_ReturnTwoDimes;
wire Dispense, ReturnNickel, ReturnDime, ReturnTwoDimes;

VendingMachineFSM dut(clk, reset, N, D, Q, Dispense, ReturnNickel, ReturnDime, ReturnTwoDimes);

reg [31:0] vectornum, errors;
reg [8:0] testvectors[25:0];

always
  begin
    clk = 1; #100; clk = 0; #100;
  end

  initial
  begin
    $readmemb("//vmware-host/Shared Folders/Desktop/SJSU/CMPE 125/Lab 6/test_vector_FSM.tv.txt", testvectors);
    vectornum = 0; errors = 0;
    reset = 1; #0; reset = 0;
  end
  
  always @(posedge clk)
  begin
    #1; {clk, reset, N, D, Q, expected_Dispense, expected_ReturnNickel, 
	 expected_ReturnDime, expected_ReturnTwoDimes} = testvectors[vectornum];
  end

 always @(negedge clk)
    if (~reset) begin
      if (Dispense !== expected_Dispense || ReturnNickel !== expected_ReturnNickel ||
          ReturnDime !== expected_ReturnDime || ReturnTwoDimes !== expected_ReturnTwoDimes)
		begin
			$display("Error: inputs = %b %b %b", N, D, Q);
			$display("outputs = %b %b %b %b (%b %b %b %b Is Expected)", Dispense, ReturnNickel, ReturnDime, ReturnTwoDimes, 
			expected_Dispense, expected_ReturnNickel, expected_ReturnDime, expected_ReturnTwoDimes);
		  errors = errors + 1;
		end
		
		if(Dispense == expected_Dispense)begin
		$display("Success: inputs N = %b D = %b Q = %b", N, D, Q);
      $display("Outputs = %b %b %b %b (%b %b %b %b Is Expected)", Dispense, ReturnNickel, ReturnDime, ReturnTwoDimes,
						expected_Dispense, expected_ReturnNickel, expected_ReturnDime, expected_ReturnTwoDimes);
		end
		
		vectornum = vectornum + 1;
		if (testvectors[vectornum] === 9'bx)
		begin
      $display("%d tests completed with %d errors", vectornum, errors);
		$finish;
   end
 end

endmodule
