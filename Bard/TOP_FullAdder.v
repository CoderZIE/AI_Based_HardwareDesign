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


module TOP_FullAdder(
  input wire a,
  input wire b,
  input wire cin,
  output wire sum,
  output wire cout
);

  wire x, y;

  HalfAdder ha1(a, b, x, y);

  assign sum = x ^ cin;
  assign cout = x & y | a & b;

endmodule

