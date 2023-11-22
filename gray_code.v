module gray_code(clk,reset,gray);

parameter s0=3'b000,s1=3'b001,s2=3'b011,s3=3'b010,s4=3'b110,
				s5=3'b111,s6=3'b101,s7=3'b100;
				
input clk,reset;
output [2:0] gray;
reg [2:0] state,nextstate;

always @ (posedge clk,posedge reset) begin
	if(reset)
		state<=s0;
	else
		state<=nextstate;
end

always@(*) begin
	case(state)
		s0:	nextstate<=s1;
		s1:	nextstate<=s2;
		s2:	nextstate<=s3;
		s3:	nextstate<=s4;
		s4:	nextstate<=s5;
		s5:	nextstate<=s6;
		s6:	nextstate<=s7;
		s7:	nextstate<=s0;
		default:nextstate<=s0;
	endcase
end

assign gray = state;

endmodule 