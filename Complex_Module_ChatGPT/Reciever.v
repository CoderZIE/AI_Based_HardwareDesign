`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2023 00:57:52
// Design Name: 
// Module Name: Reciever
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


module uart_rx (
    input clk,            // 100 MHz Clock input
    input reset,          // Reset signal
    input rx,             // UART RX input
    output [7:0] data_out, // 8-bit received data (output)
    output rx_ready       // Receive data ready signal (output)
);

// UART parameters
parameter BAUD_RATE = 9600; // Set the desired baud rate
parameter BAUD_DIVIDER = 100_000_000 / (BAUD_RATE * 16); // Calculate the baud divider for a 100 MHz clock

// Internal registers
reg [15:0] baud_counter = 16'b0; // Counter for baud rate generation
reg [3:0] bit_counter = 4'b0;    // Counter for bit reception
reg start_bit = 1'b0;            // Start bit
reg stop_bit = 1'b1;             // Stop bit
reg [7:0] rx_data_reg = 8'b0;    // Data register for reception
reg rx_ready_reg = 1'b0;         // RX ready register for output

always @(posedge clk or posedge reset) begin
    if (reset) begin
        rx_ready_reg <= 1'b0;
        baud_counter <= 16'b0;
        bit_counter <= 4'b0;
        start_bit <= 1'b0;
        stop_bit <= 1'b1;
        rx_data_reg <= 8'b0;
    end else if (baud_counter == BAUD_DIVIDER - 1) begin
        // Receive logic
        if (rx == start_bit && !rx_ready_reg) begin
            bit_counter <= 4'b0;
            start_bit <= 1'b0;
            rx_ready_reg <= 1'b1;
        end else if (rx_ready_reg) begin
            if (bit_counter == 4'b0) begin
                start_bit <= rx;
                bit_counter <= bit_counter + 1'b1;
            end
            else if (bit_counter == 4'b1001) begin
                stop_bit <= rx;
                bit_counter <= bit_counter + 1'b1;
                rx_ready_reg <= 1'b0; // Data reception complete
            end
            else begin
                rx_data_reg[bit_counter - 1] <= rx;
                bit_counter <= bit_counter + 1'b1;
            end
        end
        baud_counter <= 16'b0;
    end else begin
        baud_counter <= baud_counter + 1'b1;
    end
end

// Assign the outputs from registers to output ports
assign data_out = rx_data_reg;
assign rx_ready = rx_ready_reg;

endmodule


