module modeOne(
input reg [15:0]count1,   //16 bits of data
input clk,		 //Clock pulse
input reg gate1,		 //Gate
input wire cs,		 //Chip select
input reg newCount1,	 //If an update happened
output reg out1,	 //Output wire
output reg[15:0] currentCount
);
reg countdown;

always @(posedge clk,negedge cs)begin 
if (!cs) begin
out1<=1'b0;
currentCount<=16'b0000000000000000;
countdown<=1'b0;
end
else begin
out1<=1'b1;
if (gate1)begin
countdown<=1'b1;
currentCount<=count1;
end
else if (countdown)
out1<=1'b0;
currentCount<=currentCount-1;
end	
if (currentCount==0) begin
out1<=1'b1;
countdown<=1'b0;
end
end
endmodule



