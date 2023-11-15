`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 13:00:55
// Design Name: 
// Module Name: main
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


module main(
input clk_fpga, //100100MHz FPGA Basys 3 Board Clock
input reset, //reset button
input RxD, //input signal wire
input start,
 output   o_TX_Active,
 output   o_TX_Serial,
 output   o_TX_Done
);
wire [7:0]data;
wire [15:0]out;
//wire [15:0]mul=data*5;
UART_TX t1(finish,clk_fpga,out, o_TX_Active,o_TX_Serial,o_TX_Done);
mul m(out,data,8'b10101010,clk,start,reset,finish);
Receiver_RxD r1(clk_fpga,reset,RxD,data);
endmodule
