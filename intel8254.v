module intel8254(
    input [7:0] data,
    input clk0,
    input clk1,
    input clk2,
    input gate0,
    input gate1,
    input gate2,
    output out0,
    output out1,
    output out2,
    input A0,
    input A1,
    input RD,
    input CS, //Remember this is CS bar.
    input WR //Remember this is also WR bar.
);

wire [3:0] enable; // enable[0] for counter 0 , enable[1] for counter 1, enable[2] for counter 2, and enable[3] for control

//Instantiate read write module
RW RW(CS, A0, A1, enable,);

//TODO: Instantiate 3 counters

//TODO: Instantiate Control Register.

// Pass wires to the counters and to the control register to affect counters.

endmodule