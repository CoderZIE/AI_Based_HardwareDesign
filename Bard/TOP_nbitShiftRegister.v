`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2023 13:22:17
// Design Name: 
// Module Name: TOP_nbitShiftRegister
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

module TOP_nbitShiftRegister #(parameter WIDTH = 4) (
  input clk,
  input rst,
  input [WIDTH-1:0] din,
  input [1:0] sel,
  output reg [WIDTH-1:0] dout
);

  reg [WIDTH-1:0] q;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      q <= 0;
    end else begin
      case (sel)
        2'b00: q <= q << 1;
        2'b01: q <= q >> 1;
        2'b10: q <= din;
        default: q <= q;
      endcase
    end
  end

  assign dout = q;

endmodule
