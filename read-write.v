module RW(
    input CS, 
    // input RD, not needed
    // input WR, not needed
    input A0,
    input A1,
    output [3:0] enable // enable[0] for counter 0 , enable[1] for counter 1, enable[2] for counter 2, and enable[3] for control
);

// CS has to be low for any operations.

// Assign the enable.
assign enable = CS == 1'b0 ? 4'b0000 :
                {A0, A1} == 2'b00 ? 4'b0001 : 
                {A0, A1} == 2'b01 ? 4'b0010 : 
                {A0, A1} == 2'b10 ? 4'b0100 :
                {A0, A1} == 2'B11 ? 4'b1000 : 4'b0000;

endmodule