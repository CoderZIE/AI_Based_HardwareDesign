`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2023 19:42:37
// Design Name: 
// Module Name: TOP_NbitAdder
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


module TOP_NbitAdder #(
    parameter N = 4 // Number of bits
) (
    input wire [N-1:0] A,   // n-bit input A
    input wire [N-1:0] B,   // n-bit input B
    input wire [N-1:0] Cin, // n-bit carry-in
    output wire [N-1:0] S,  // n-bit sum output
    output wire Cout       // 1-bit carry-out output
);

    wire [N:0] Carry;
    assign Carry[0] = Cin;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : ADDER_LOOP
            TOP_FullAdder FA (
                .A(A[i]),
                .B(B[i]),
                .Cin(Carry[i]),
                .S(S[i]),
                .Cout(Carry[i+1])
            );
        end
    endgenerate

    assign Cout = Carry[N];

endmodule


