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


module TOP_NbitAdder(
  input wire [3:0] a,
  input wire [3:0] b,
  input wire cin,
  output wire [3:0] sum,
  output wire cout
);

  wire [3:0] c;
  TOP_FullAdder fa0(a[0], b[0], cin, sum[0], c[0]);
  TOP_FullAdder fa1(a[1], b[1], c[0], sum[1], c[1]);
  TOP_FullAdder fa2(a[2], b[2], c[1], sum[2], c[2]);
  TOP_FullAdder fa3(a[3], b[3], c[2], sum[3], cout);

endmodule


