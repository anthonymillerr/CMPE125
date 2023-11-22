module VendingMachineFSM(input clk, input reset,input N,input D,input Q,output Dispense, 
output ReturnNickel,output ReturnDime,output ReturnTwoDimes);

reg [9:0] state, nextstate;

parameter S0=10'b0000000001, S1=10'b0000000010, S2=10'b0000000100, 
			S3=10'b0000001000, S4=10'b0000010000, S5=10'b0000100000, 
			S6=10'b0001000000, S7=10'b0010000000, S8=10'b0100000000, 
			S9=10'b1000000000;

always @(posedge clk, posedge reset) begin
    if (reset) state <= S0;
	else state <= nextstate;
end

always @(*) begin
    case (state)
         S0: begin
			if(N==0 & D == 0 & Q == 0) nextstate = S0;
			else if (N==0 & D == 0 & Q == 1) nextstate = S3;
			else if (N==0 & D == 1 & Q == 0) nextstate = S2;
			else if (N==1 & D == 0 & Q == 0) nextstate = S1;
			end 
			
			S1: begin
			if(N==0 & D == 0 & Q == 0) nextstate = S1;
			else if (N==0 & D == 0 & Q == 1) nextstate = S4;
			else if (N==0 & D == 1 & Q == 0) nextstate = S5;
			else if (N==1 & D == 0 & Q == 0) nextstate = S2;
			end
			
			S2: begin
			if(N==0 & D == 0 & Q == 0) nextstate = S2;
			else if (N==0 & D == 0 & Q == 1) nextstate = S7;
			else if (N==0 & D == 1 & Q == 0) nextstate = S6;
			else if (N==1 & D == 0 & Q == 0) nextstate = S5;
			end 
			
			S3: begin 
			nextstate = S0;
			end
			
			S4: begin
			nextstate = S0;
			end
			
			S5: begin
			if(N==0 & D == 0 & Q == 0) nextstate = S5;
			else if (N==0 & D == 0 & Q == 1) nextstate = S8;
			else if (N==0 & D == 1 & Q == 0) nextstate = S3;
			else if (N==1 & D == 0 & Q == 0) nextstate = S6;
			end 
			
			S6: begin
			if(N==0 & D == 0 & Q == 0) nextstate <= S6;
			else if (N==0 & D == 0 & Q == 1) nextstate = S9;
			else if (N==0 & D == 1 & Q == 0) nextstate = S4;
			else if (N==1 & D == 0 & Q == 0) nextstate = S3;
			end 
			
			S7: begin
			nextstate = S0;
			end
		
			S8: begin
			nextstate = S0;
			end
			
			S9: begin
			nextstate = S0;
			end
        
		  
        default: nextstate = S0;
    endcase
end

assign Dispense = (nextstate == S3) | (nextstate == S4) | (nextstate == S7) 
						| (nextstate == S8) | (nextstate == S9);
assign ReturnNickel = (nextstate == S4) | (nextstate == S8);
assign ReturnDime = (nextstate == S7) | (nextstate == S8);
assign ReturnTwoDimes = (nextstate == S9);

endmodule
