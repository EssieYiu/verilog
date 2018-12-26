`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 17:28:03
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input clk,
    input[31:0] DAddr,
    input[31:0] DataIn,
    input RD,WR,
    output[31:0] DataOut
    );
    //´æ´¢Æ÷
    reg [7:0] rom [0:60];
    //¶Á
    assign DataOut[7:0] = (RD==0)?rom[DAddr + 3]:8'bz;//´ó¶Ë
    assign DataOut[15:8] = (RD==0)?rom[DAddr + 2]:8'bz;
    assign DataOut[23:16] = (RD==0)?rom[DAddr + 1]:8'bz;
    assign DataOut[31:24] = (RD==0)?rom[DAddr]:8'bz;
    //Ð´
    always@( negedge clk) begin//Ê±ÖÓÏÂ½µÑØ´¥·¢Ð´²Ù×÷
    if(WR==0)begin
        rom[DAddr] <= DataIn[31:24];
        rom[DAddr+1] <= DataIn[23:16];
        rom[DAddr+2] <= DataIn[15:8];
        rom[DAddr+3] <= DataIn[7:0];
        end
    end     
endmodule
