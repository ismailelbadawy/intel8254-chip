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

//TODO: Instantiate read write module

//TODO: Instantiate 3 counters

//TODO: Instantiate Control Register.

// Pass wires to the counters and to the control register to affect counters.

endmodule