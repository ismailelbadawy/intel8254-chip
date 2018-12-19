`include "read-write.v"
module rw_tb();

    // we need to test this.
    reg A0;
    reg A1;
    reg CS;
    wire [3:0] enable;

    initial begin 
        $display("time\tA0\tA1\tCS\tenable");
        $monitor("%g\t%b\t%b\t%b\t%b", $time, A0, A1, CS, enable);
        
        CS = 1;
        A0 = 0;
        A1 = 0;
        #5 
        CS = 0;
        #5
        A0 = 1;
        A1 = 0;
        #5
        A0 = 0;
        A1 = 1;
        #5
        A0 = 1;
        A1 = 1;
    end

    RW Rw(CS, A0, A1, enable);

endmodule