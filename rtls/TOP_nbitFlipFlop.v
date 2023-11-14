`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2023 13:22:17
// Design Name: 
// Module Name: TOP_nbitFlipFlop
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


module d_flip_flop (
    input wire clk,
    input wire reset,
    input wire d,
    output reg q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule

module TOP_nbitFlipFlop (
    input wire clk,
    input wire reset,
    input wire j,
    input wire k,
    output reg q
);

    reg q_temp;

    always @(posedge clk or posedge reset) begin
        if (reset)
            q_temp <= 1'b0;
        else begin
            if (j && k)
                q_temp <= ~q_temp;
            else if (j)
                q_temp <= 1'b1;
            else if (k)
                q_temp <= 1'b0;
        end
    end

    always @(posedge clk) begin
        q <= q_temp;
    end

endmodule

module sr_flip_flop (
    input wire clk,
    input wire reset,
    input wire s,
    input wire r,
    output reg q
);

    reg q_temp;

    always @(posedge clk or posedge reset) begin
        if (reset)
            q_temp <= 1'b0;
        else begin
            if (s && ~r)
                q_temp <= 1'b1;
            else if (~s && r)
                q_temp <= 1'b0;
        end
    end

    always @(posedge clk) begin
        q <= q_temp;
    end

endmodule

