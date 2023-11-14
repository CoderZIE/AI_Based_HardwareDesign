`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2023 19:13:32
// Design Name: 
// Module Name: TOP_FullAdder
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


module TOP_FullAdder (
    input wire A,    // 1-bit input A
    input wire B,    // 1-bit input B
    input wire Cin,  // 1-bit carry-in
    output wire S,   // 1-bit sum output
    output wire Cout // 1-bit carry-out output
);

    wire S1, C1, C2;

    // First half adder
    TOP_HalfAdder HA1 (
        .A(A),
        .B(B),
        .S(S1),
        .C(C1)
    );

    // Second half adder
    TOP_HalfAdder HA2 (
        .A(S1),
        .B(Cin),
        .S(S),
        .C(C2)
    );

    assign Cout = C1 | C2; // OR operation for carry-out

endmodule

