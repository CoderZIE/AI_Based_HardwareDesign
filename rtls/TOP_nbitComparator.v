`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2023 13:22:17
// Design Name: 
// Module Name: TOP_nbitComparator
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


module TOP_nbitComparator #(
    parameter N = 8
)(
    input [N-1:0] A,
    input [N-1:0] B,
    output reg equal,
    output reg greater,
    output reg less
);

    always @(*) begin
        equal = (A == B);
        greater = (A > B);
        less = (A < B);
    end

endmodule
