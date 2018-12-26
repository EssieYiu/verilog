`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 17:29:45
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
    input PCWre,//0 不更新 1 更新
    input [31:0]new_PC,
    output  reg[31:0]cur_PC
 );
  always @(posedge clk)begin//时序逻辑
      if(PCWre==1'b1)
         cur_PC<=new_PC;
  end
endmodule
