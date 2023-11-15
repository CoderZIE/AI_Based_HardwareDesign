`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2023 12:14:58
// Design Name: 
// Module Name: csa_dadda
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


module csa_dadda(A,B,Cin,Y,Cout);
input A,B,Cin;
output Y,Cout;
    
assign Y = A^B^Cin;
assign Cout = (A&B)|(A&Cin)|(B&Cin);
    
endmodule

