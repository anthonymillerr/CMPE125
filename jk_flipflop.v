module jk_flipflop(J,K,clk,Q);
input J,K,clk;
output reg Q;

always @(posedge clk)
begin
if(J==0 & K==0)
Q<=Q;
else if (J==1 & K==0)
Q<=1;
else if (J==0 & K==1)
Q<=0;
else if (J==1 & K==1)
Q<=~Q;
end
endmodule 