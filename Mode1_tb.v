module mode1TB;

reg clk,cs;
reg [15:0]countreg;
reg gate;
reg newCount;
wire out;
wire [15:0] currentCountr;
wire gateCk;
modeOne modeUnit(countreg,clk,gate,cs,out,currentCountr,gateCk);
initial begin 
$monitor ("%g\tcountreg:%b,gate%b,cs:%b,out:%b,currentCount:%b,gateCheck:%b",$time,countreg,gate,cs,out,currentCountr,gateCk);
clk=1'b0;
cs=1'b0;
#30;
cs=1;
countreg=4;
#10
gate=1'b1;
#10
gate=1'b0;
#20
gate=1'b1;
#10
gate=1'b0;
#300
$finish;
end
always begin #5 clk=~clk;
end
endmodule 
