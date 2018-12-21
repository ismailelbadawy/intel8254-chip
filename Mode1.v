module modeOne(
input reg [15:0]count1,   //16 bits of data
input clk,		 //Clock pulse
input reg gate1,		 //Gate
input wire cs,		 //Chip select
output reg out1,	 //Output wire
output reg[15:0] currentCount,
output reg gateCheck
);

reg [1:0]currentState;
reg [1:0]nextState;    //2= couting but a new gate signal arrived 	1=counting  0=idle
reg gate;

reg countGate=0;

always @(posedge gate1)begin
countGate=1;
end

always@ (negedge clk) begin
if (countGate==1)begin
gate=1;
countGate=0;
gateCheck=1;
end
end

always @(posedge clk,cs) begin
if (cs==1'b0) begin 
	currentState<=2'b00;
	out1<=1'b0;
	gate<=1'b0;
end
else begin 
out1=1'b1;
if(currentState==2'b00) begin
		if (gate==1)begin
			gate=0;
			currentState=2'b01;					
			out1=1'b0;
			currentCount=count1+1;
		end
		else begin
			currentState=2'b00;		
			out1=1'b1;
		end
end
if(currentState==2'b01)begin
		if (gate==1) begin
			gate=0;
			currentState=2'b01;
			currentCount=count1;
		end			       
		else begin 
			if (currentCount==0)begin
				out1=1;
				currentState<=2'b00;
			end
			else begin 
				out1=0;
				currentCount=currentCount-1;
				currentState<=2'b01;
			end		
		end	       
end
end
end //End Alywas	

endmodule



