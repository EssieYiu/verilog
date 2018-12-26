`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 15:16:11
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input reset,
    input PCWre,//0 pc 不更改(halt)，1 pc更改
    input [31:0] newPC,
    output reg [31:0] cur_PC
    );
    always@(posedge clk or negedge reset) begin
        if(reset == 0) cur_PC = 0;
        if(PCWre == 1) 
            cur_PC <= newPC;
    end
endmodule
