module modeZero(
input reg [15:0]count0,   //16 bits of data
input clk,		 //Clock pulse
input reg gate0,		 //Gate
input wire cs,		 //Chip select
input reg newCount0,	 //If an update happened
output reg out0	 //Output wire
);

reg [15:0] originalCount0;
wire[15:0] countWire;
reg [15:0] currentCount0;
reg nextGate0;
reg countdown0;

assign countWire = count0;

always @(count0) begin
	currentCount0 <= count0;
	out0<=0;
end

always @(posedge clk) begin 
if (!cs)begin
out0<=1;
end
else begin

if (gate0==1 && currentCount0!=0)begin
out0<=0;
currentCount0<=currentCount0-1;
end


if (currentCount0==0)begin
out0<=1;
end

end

end
endmodule
