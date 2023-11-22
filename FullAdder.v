module FullAdder(A,B,Cin,S,Cout);
input A,B,Cin;
output S, Cout;
assign S = (A ^ B ^ Cin);
assign Cout = (A & Cin)|(A & B)|(B & Cin);
endmodule 