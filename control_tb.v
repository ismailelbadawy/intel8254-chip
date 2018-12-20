`include "control.v"
module cw_tb();
    reg [7:0] data;
    reg enable;
    reg [5:0] counter0old;
    reg [5:0] counter1old;
    reg [5:0] counter2old;
    wire [5:0] counter0Control;
    wire [5:0] counter1Control;
    wire [5:0] counter2Control;

    initial begin
        $display("time\t\tdata\tcounter0\tcounter1\tcounter2");
        $monitor("%g\t%b\t%b\t%b\t%b\t%b", $time, enable, data, counter0Control, counter1Control, counter2Control);

        data = 8'b01110011;
        enable = 1;
        #5
        data = 0;
        #2
        enable = 1;
        #5
        data = 8'b00110111;
        #5
        data = 8'b10001100;

    end

    ControlRegister CR(data, enable, counter0old, counter1old, 
        counter2old, counter0Control, counter1Control, counter2Control);

endmodule