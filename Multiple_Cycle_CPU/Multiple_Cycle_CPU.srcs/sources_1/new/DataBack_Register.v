`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 14:29:31
// Design Name: 
// Module Name: DataBack_Register
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


module DataBack_Register(
    input[31:0] DataIn,
    output reg[31:0] DataOut,
    input clk
    );
    always@(negedge clk)begin
        DataOut = DataIn;
    end
endmodule
