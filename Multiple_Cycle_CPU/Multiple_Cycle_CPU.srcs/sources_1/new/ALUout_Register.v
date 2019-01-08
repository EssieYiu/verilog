`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 13:56:02
// Design Name: 
// Module Name: ALUout_Register
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


module ALUout_Register(
    input[31:0] ALU_result,
    output reg [31:0] ALUout
    );
    always@(ALU_result)begin
        ALUout <= ALU_result;
        end
endmodule
