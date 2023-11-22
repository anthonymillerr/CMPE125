module ALU_32bit (
    input [31:0] A,
    input [31:0] B,
    input [2:0] F,
    output reg [31:0] Y,
    output wire Zero,
    output reg Overflow);
wire [31:0] S, Bout;

assign Bout = F[2] ? ~B : B;
assign S = A + Bout + F[2];

always @ (*) begin 
case (F[1:0])
	 2'b00: Y <= A & Bout;
	 2'b01: Y <= A | Bout;
	 2'b10: Y <= S;
	 2'b11: Y <= S[31];
endcase
end

assign Zero = (Y == 32'b0); 

always @ (*) begin
case (F[2])
	1'b0: Overflow <= A[31] & B[31] & ~S[31] |
							~A[31] & ~B[31] & S[31];
	1'b1: Overflow <= ~A[31] & B[31] & S[31] | 
							A[31] & ~B[31] & ~S[31];
	default: Overflow <= 1'b0;
endcase
end
endmodule 