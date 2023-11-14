`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2023 13:00:40
// Design Name: 
// Module Name: TOP_Nbit_subractor
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


module TOP_Nbit_subtractor #(
    parameter N = 8
) (
    input wire [N-1:0] A,
    input wire [N-1:0] B,
    output wire [N-1:0] difference
);

    wire [N:0] temp;
    wire borrow;

    assign temp = {1'b0, A} - {1'b0, B};
    assign borrow = ~temp[N];

    assign difference = temp[N-1:0];

endmodule

