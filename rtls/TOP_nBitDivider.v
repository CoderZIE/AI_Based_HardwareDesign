`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2023 13:14:18
// Design Name: 
// Module Name: Top_nBitDivider
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


module TOP_nBitDivider #(parameter N = 8)
(
    input wire clk,
    input wire rst,
    input wire [N-1:0] dividend,
    input wire [N-1:0] divisor,
    output wire [N-1:0] quotient,
    output wire [N-1:0] remainder,
    output wire division_complete
);

    reg [N-1:0] dividend_reg;
    reg [N-1:0] remainder_reg;
    reg [N-1:0] quotient_reg;
    reg [N:0] count_reg;
    reg division_started;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dividend_reg <= 0;
            remainder_reg <= 0;
            quotient_reg <= 0;
            count_reg <= 0;
            division_started <= 0;
        end else if (division_started) begin
            dividend_reg <= dividend_reg - divisor;
            remainder_reg <= dividend_reg;
            quotient_reg <= quotient_reg + 1'b1;
            count_reg <= count_reg + 1'b1;
        end else if (dividend != 0 && divisor != 0) begin
            dividend_reg <= dividend;
            division_started <= 1;
        end
    end
    
    assign division_complete = (count_reg >= N) ? 1 : 0;
    assign quotient = quotient_reg;
    assign remainder = remainder_reg;

endmodule


