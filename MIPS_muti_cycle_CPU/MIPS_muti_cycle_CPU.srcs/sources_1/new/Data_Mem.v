`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 18:39:17
// Design Name: 
// Module Name: Data_Mem
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


module Data_Mem(
    input [31:0] DataIn,
    input [31:0]Daddr,
    input RD,//0¶Á´æ´¢Æ÷ 1Êä³ö¸ß×èÌ¬
    input WR,//0Ð´´æ´¢Æ÷ 1ÎÞ²Ù×÷
    output reg [31:0] DataOut
    );
    reg [7:0] DataMem [0:31];
    always @(DataIn or Daddr or WR or RD) begin
        if(WR == 0) begin
            DataMem[Daddr*4] = DataIn[31:24];
            DataMem[Daddr*4+1] = DataIn[23:16];
            DataMem[Daddr*4+2] = DataIn[15:8];
            DataMem[Daddr*4+3] = DataIn[7:0];
        end
        if(RD == 0) begin
            DataOut[31:24] = DataMem[Daddr*4];
            DataOut[23:16] = DataMem[Daddr*4+1];
            DataOut[15:8] = DataMem[Daddr*4+2];
            DataOut[7:0] = DataMem[Daddr*4+3];
        end
        else 
            DataOut = 8'hzzzzzzzz;
    end
endmodule
