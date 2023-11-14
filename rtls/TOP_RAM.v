`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2023 13:38:40
// Design Name: 
// Module Name: TOP_RAM
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


module TOP_RAM #(
    parameter address_width = 4, // Change this to desired address width
    parameter data_width = 8     // Change this to desired data width
) (
    input wire clk,
    input wire [address_width - 1:0] address,
    input wire [data_width - 1:0] data_in,
    input wire write_enable,
    output wire [data_width - 1:0] data_out
);
    
    reg [data_width - 1:0] memory [0: (1 << address_width) - 1];

    always @(posedge clk) begin
        if (write_enable)
            memory[address] <= data_in;
    end

    assign data_out = memory[address];

endmodule

