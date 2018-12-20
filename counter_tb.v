`include "counter0.v"
module test_counter();
 reg [15:0]count0;   //16 bits of data
reg clk;		 //Clock pulse
 reg gate0;		 //Gate
 reg cs;		 //Chip select
 reg newCount0;	 //If an update happened
 wire out0;	 //Output wire



initial begin
$display("time\t clk\t gate\t cs\t newCount\t out\t");
$monitor("%g\t %b\t    %b\t     %b\t%b\t%b\t",$time, clk,gate0,cs,newCount0,out0);
clk = 1'b1;
count0 = 5;
cs=1;
gate0=1;
newCount0=1;
#5
newCount0=0;
count0=8;
#5
gate0=0;
#10
gate0=1;
#10
#10
#70
count0=10;
end

always begin
#5 clk=~clk;
end
modeZero m(count0,clk,gate0,cs, newCount0,out0);
endmodule
