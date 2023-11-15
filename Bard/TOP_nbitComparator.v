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


module TOP_nbitComparator #(parameter N = 4) (
  output reg [N-1:0] out,
  input [N-1:0] a,
  input [N-1:0] b
);

  always @(*) begin
    if (a > b) begin
      out <= 1;
    end else if (a < b) begin
      out <= -1;
    end else begin
      out <= 0;
    end
  end

endmodule
