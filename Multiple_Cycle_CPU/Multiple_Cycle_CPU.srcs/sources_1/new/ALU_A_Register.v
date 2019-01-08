`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 14:23:32
// Design Name: 
// Module Name: ALU_A_Register
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


module ALU_A_Register(
    input clk,
    input[31:0] RegData,
    output reg[31:0] AData
    );
    always@(negedge clk)begin
        AData = RegData;
    end
endmodule
