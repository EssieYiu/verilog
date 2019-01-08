`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/09 17:20:25
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
    input[31:0] DAddr,
    input RD,WR,
    input[31:0] DataIn,
    output[31:0] DataOut
    );
    reg[7:0] mem[63:0];
    assign DataOut[7:0]= (RD==0)?mem[DAddr*4+3]:8'bz;
    assign DataOut[15:8]= (RD==0)?mem[DAddr*4+2]:8'bz;
    assign DataOut[23:16]= (RD==0)?mem[DAddr*4+1]:8'bz;
    assign DataOut[31:24]= (RD==0)?mem[DAddr*4]:8'bz;
    
    always@(WR)begin
    if(WR==1'b0)begin
        mem[DAddr*4]<= DataIn[31:24];
        mem[DAddr*4+1]<=DataIn[23:16];
        mem[DAddr*4+2]<=DataIn[15:8];
        mem[DAddr*4+3]<=DataIn[7:0];
        end
     end
endmodule
