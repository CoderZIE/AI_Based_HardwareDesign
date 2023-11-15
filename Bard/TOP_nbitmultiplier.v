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


module TOP_nbitmultiplier #(
    parameter N = 4
) (
    input [N-1:0] A,
    input [N-1:0] B,
    output [2*N-1:0] M
);

    wire [N-1:0] p[N-1:0];

    // Generate partial products
    for (int i = 0; i < N; i++) begin
        p[i] = A * B[i];
    end

    // Add the partial products
    assign M = p[0] + p[1] + p[2] + p[3];

endmodule


