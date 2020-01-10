`default_nettype none
module top (
    input clk,
    input sw1,
    input sw2,
    output led1,
    output led2
    );

    reg [22:0] counter = 0;
    always @(posedge clk)
        counter <= counter + 1;

    assign led2 = counter[22];

    assign led2 = sw2;

endmodule
