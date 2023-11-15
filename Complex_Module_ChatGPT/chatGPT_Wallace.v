`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2023 14:02:20
// Design Name: 
// Module Name: chatGPT_Wallace
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

module chatGPT_Wallace(
    input [7:0] A,
    input [7:0] B,
    output reg [15:0] P
);

    wire [7:0] PP [0:15];
    wire [7:0] A_shifted, B_shifted;
    wire [15:0] C [0:15];

    // Generate partial products
    genvar i, j, k;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                for (k = 0; k < 8; k = k + 1) begin
                    assign PP[i * 2 + k][j] = A[i] & B[j];
                end
            end
        end
    endgenerate

    // Generate columns
    generate
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                if (j + i < 16) begin
                    assign C[i][j] = PP[i][j];
                end else begin
                    assign C[i][j] = 0;
                end
            end
        end
    endgenerate

    // Wallace Tree Reduction
    generate
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                if ((j % 2) == 0) begin
                    assign C[j][i + 8] = C[j][i * 2] + C[j + 1][i * 2];
                end
            end
        end
    endgenerate

    // Final output
    always @* begin
        P = {C[15][11:8], C[14][7:0]};
    end

endmodule

