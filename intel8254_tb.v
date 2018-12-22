module intel8254_tb();
    
    reg clk0, clk1, clk2;
    reg gate0, gate1, gate2;
    reg [7:0] data;
    reg A0, A1;
    reg CS, WR, RD;
    wire out0, out1, out2;
    
    intel8254 chip (data, clk0, clk1, clk2, gate0, gate1, gate2, out0, out1, out2, A0, A1, RD, CS, WR);
    
    initial begin
      clk0 = 0;
      clk1 = 0;
      clk2 = 0;
      gate0 = 0;
      gate1 = 0;
      gate2 = 0;
      CS = 1;
      A0 = 0;
      A1 = 0;
      // Control word.
      data = 8'b00010000;
      #10
      CS = 0;
      A0 = 1;
      A1 = 1;
      #5
      data = 8'b01010010;
      #5
      data = 8'b10010100;
      #10
      gate0 = 1;
      data = 5;
      // Address data to counter 0;
      A0 = 0;
      A1 = 0;
      #5 
      A0 = 1;
      A1 = 0;
      gate2 = 1;
      data = 10;
      #5
      A0 = 0;
      A1 = 1;
      data = 4;
      #5
      gate1 = 1;
      #5
      gate1 = 0;
      #10
      A0 = 1;
      A1 = 1;
      data = 8'b00010010;
      #5
      gate0 = 0;
      A0 = 0;
      A1 = 0;
      data = 10;
      #10
      gate0 = 1;
      #5
      gate0 = 0;
      #5
      A0 = 1;
      A1 = 0;
      data = 5;
      #5
      gate2 = 0;
      #20
      A0 = 0;
      A1 = 1;
      data = 12;
      #5
      gate2 = 1;
    end

    always begin
      #5
      clk0 = ~clk0;
      clk1 = ~clk1;
      clk2 = ~clk2;
    end

endmodule