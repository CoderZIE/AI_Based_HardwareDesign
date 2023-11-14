`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2023 13:22:17
// Design Name: 
// Module Name: TOP_nbitCounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module up_counter #(parameter N=8) (
    input wire clk, // Clock input
    input wire rst, // Reset input
    output wire [N-1:0] count // Counter output
);

    reg [N-1:0] count_reg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            count_reg <= 0;
        else
            count_reg <= count_reg + 1;
    end

    assign count = count_reg;

endmodule

module down_counter #(parameter N=8) (
    input wire clk, // Clock input
    input wire rst, // Reset input
    output wire [N-1:0] count // Counter output
);

    reg [N-1:0] count_reg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            count_reg <= (2 ** N) - 1;
        else
            count_reg <= count_reg - 1;
    end

    assign count = count_reg;

endmodule

module TOP_nbitCounter #(parameter N=8) (
    input wire clk,   // Clock input
    input wire rst,   // Reset input
    input wire up,    // Up count control
    input wire down,  // Down count control
    output wire [N-1:0] count // Counter output
);

    reg [N-1:0] count_reg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            count_reg <= 0;
        else if (up)
            count_reg <= count_reg + 1;
        else if (down)
            count_reg <= count_reg - 1;
    end

    assign count = count_reg;

endmodule
