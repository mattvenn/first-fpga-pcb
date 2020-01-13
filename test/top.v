`default_nettype none
module top (
    input clk,
    input sw1,
    input sw2,
    output led1,
    output reg led2,

    output  pmod1_10,
    output  pmod1_4,
    output  pmod1_9,
    output  pmod1_3,
    output  pmod1_8,
    output  pmod1_2,
    output  pmod1_7,
    output  pmod1_1

    );

    wire clk60;
    initial led2 = 0;
    pll pll_0(.clock_in(clk), .clock_out(clk60));

    // use 60MHz PLL to flash led once per second
    reg [25:0] counter = 0;
    always @(posedge clk60) begin
        counter <= counter + 1;
        if(counter == 30000000) begin
            led2 <= !led2;
            counter <= 0;
        end
    end

    assign led1 = sw1;

    assign  pmod1_10 = counter[10];
    assign  pmod1_4  = counter[11];
    assign  pmod1_9  = counter[12];
    assign  pmod1_3  = counter[13];
    assign  pmod1_8  = counter[14];
    assign  pmod1_2  = counter[15];
    assign  pmod1_7  = counter[16];
    assign  pmod1_1  = counter[17];

endmodule
