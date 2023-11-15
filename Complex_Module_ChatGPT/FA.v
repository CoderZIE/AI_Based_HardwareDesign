`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2023 12:27:24
// Design Name: 
// Module Name: FA
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


module FA(
  output carry,
  output sum,
  input a,
  input b,
  input cin
);
  wire s1, c1, s2;
  
  HA HA1(.a(a), .b(b), .Sum(s1), .Cout(c1));
  HA HA2(.a(s1), .b(cin), .Sum(sum), .Cout(s2));
  assign carry = c1 | s2;
endmodule
