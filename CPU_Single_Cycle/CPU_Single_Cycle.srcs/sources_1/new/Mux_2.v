`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 11:52:34
// Design Name: 
// Module Name: Mux_2
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

//ALU的数据来源
module Mux_2(
    // 寄存器数据
    input [31:0] ReadData2,
    // 立即数
    input [31:0] DataExtend,
    input ALUSrcB,
    output [31:0] B
    );
    assign B = (ALUSrcB==1'b0) ? ReadData2 : DataExtend;
endmodule
