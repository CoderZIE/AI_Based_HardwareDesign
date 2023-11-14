`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2023 00:57:35
// Design Name: 
// Module Name: Transmission
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

module uart_tx (
    input clk,            // 100 MHz Clock input
    input reset,          // Reset signal
    input [7:0] data_in,  // 8-bit data input
    output tx,            // UART TX output
    output reg tx_busy    // Transmit busy signal
);

// UART parameters
parameter BAUD_RATE = 9600; // Set the desired baud rate
parameter BAUD_DIVIDER = 100_000_000 / (BAUD_RATE * 16); // Calculate the baud divider for a 100 MHz clock

// Internal registers
reg [15:0] baud_counter = 16'b0; // Counter for baud rate generation
reg [3:0] bit_counter = 4'b0;    // Counter for bit transmission
reg start_bit = 1'b0;            // Start bit
reg stop_bit = 1'b1;             // Stop bit
reg [7:0] tx_data_reg = 8'b0;    // Data register for transmission
reg tx_reg = 1'b0;               // TX register for output

always @(posedge clk or posedge reset) begin
    if (reset) begin
        tx_busy <= 1'b0;
        baud_counter <= 16'b0;
        bit_counter <= 4'b0;
        start_bit <= 1'b0;
        stop_bit <= 1'b1;
        tx_data_reg <= 8'b0;
    end else if (baud_counter == BAUD_DIVIDER - 1) begin
        // Transmit logic
        if (tx_busy) begin
            if (bit_counter == 4'b0) begin
                tx_reg <= start_bit;
                bit_counter <= bit_counter + 1'b1;
            end
            else if (bit_counter == 4'b1001) begin
                tx_reg <= stop_bit;
                bit_counter <= bit_counter + 1'b1;
                tx_busy <= 1'b0; // Transmission complete
            end
            else begin
                tx_reg <= tx_data_reg[bit_counter - 1];
                bit_counter <= bit_counter + 1'b1;
            end
        end
        baud_counter <= 16'b0;
    end else begin
        baud_counter <= baud_counter + 1'b1;
    end
end

// Assign the output from the register
assign tx = tx_reg;

// Input data register
always @(posedge clk or posedge reset) begin
    if (reset) begin
        tx_data_reg <= 8'b0;
    end else begin
        if (!tx_busy) begin
            tx_data_reg <= data_in;
            tx_busy <= 1'b1; // Start transmission
        end
    end
end

endmodule
