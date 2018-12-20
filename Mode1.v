module modeOne(
input reg [15:0]count1,   //16 bits of data
input clk,		 //Clock pulse
input reg gate1,		 //Gate
input wire cs,		 //Chip select
input reg newCount1,	 //If an update happened
output reg out1	 //Output wire
);

reg [15:0] originalCount;
reg [15:0] currentCount;
reg nextGate;
reg countdown;

always@(posedge clk) begin
end

always @(gate1,nextGate,newCount1,posedge clk)begin 
out1<=0;
originalCount<=16'b0;
countdown<=0;
currentCount<=originalCount;
if (!cs) begin
out1<=1'b0;
originalCount<=16'b0;
end
else begin

if (gate1)begin
countdown<=1;
currentCount=originalCount;
end
else if (countdown)
currentCount<=currentCount-1;
end	
if (currentCount==16'b0)
out1<=1;
end
endmodule



