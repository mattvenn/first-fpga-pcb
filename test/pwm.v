`default_nettype none
module pwm #(
    parameter WIDTH = 8
    ) (
    input wire clk,
    output wire pwm,
    input wire [WIDTH-1:0] level
    );

    reg [WIDTH-1:0] count = 0;

    always @(posedge clk)
        count <= count + 1;
    
    assign pwm = count < level;

endmodule
