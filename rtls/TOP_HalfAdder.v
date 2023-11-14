`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2023 18:42:53
// Design Name: 
// Module Name: TOP_HalfAdder
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


module TOP_HalfAdder (
    input wire A,  // 1-bit input A
    input wire B,  // 1-bit input B
    output wire S, // 1-bit sum output
    output wire C  // 1-bit carry-out output
);

    assign S = A ^ B; // XOR operation for sum
    assign C = A & B; // AND operation for carry-out

endmodule

