`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2023 13:22:17
// Design Name: 
// Module Name: TOP_nbitRegister
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


module TOP_nbitRegister #(parameter N = 8) (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [N-1:0] data_in,
    output wire [N-1:0] data_out
);

    reg [N-1:0] reg_data;

    always @(posedge clk or posedge reset) begin
        if (reset)
            reg_data <= 0;
        else if (enable)
            reg_data <= data_in;
    end

    assign data_out = reg_data;

endmodule
