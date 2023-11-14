`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2023 00:57:17
// Design Name: 
// Module Name: TOP
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


module TOP (
    input clk,         // Clock input
    input reset,       // Reset signal
    input [7:0] data_in, // Data input
    input tx_enable,  // TX enable signal
    output tx,         // UART TX output
    output [7:0] data_out, // Received data
    output rx_ready // Receive data ready signal
);

// Instantiate UART TX and RX modules
uart_tx tx_inst (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .tx(tx),
    .tx_busy(tx_enable)
);

uart_rx rx_inst (
    .clk(clk),
    .reset(reset),
    .rx(rx), // Connect RX signal from your UART device here
    .data_out(data_out), // Connect data_out to an internal signal or register
    .rx_ready(rx_ready)
);

endmodule

