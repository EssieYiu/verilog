`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 14:28:03
// Design Name: 
// Module Name: ALU_B_Register
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


module ALU_B_Register(
    input clk,
    input[31:0] RegData,
    output reg[31:0] BData
    );
    always@(negedge clk)begin
        BData = RegData;
    end
endmodule
