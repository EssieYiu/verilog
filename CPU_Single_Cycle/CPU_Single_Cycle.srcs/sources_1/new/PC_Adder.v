`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 21:49:41
// Design Name: 
// Module Name: PC_Adder
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

//执行PC+4的加法器
module PC_Adder(
    //输入：当前PC
    input [31:0] cur_PC,
    //输出：顺序执行下的下一个PC
    output reg [31:0] PC_sequence
    );
    always@(cur_PC) begin//组合逻辑
        PC_sequence = cur_PC + 4;
     end
endmodule
