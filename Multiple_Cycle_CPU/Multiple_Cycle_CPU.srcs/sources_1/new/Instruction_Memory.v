`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/09 17:16:50
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    input[31:0] IAddr,
    input RW,
    output[31:0] IDataOut
    );
    reg[7:0] InsMem[99:0];
    initial begin
            {InsMem[0],InsMem[1],InsMem[2],InsMem[3]}=32'b00001000000000010000000000001000;
            {InsMem[4],InsMem[5],InsMem[6],InsMem[7]}=32'b01001000001000100000000000000010;
            {InsMem[8],InsMem[9],InsMem[10],InsMem[11]}=32'b01000100010000010001100000000000;
            {InsMem[12],InsMem[13],InsMem[14],InsMem[15]}=32'b01000000011000010010000000000000;
            {InsMem[16],InsMem[17],InsMem[18],InsMem[19]}=32'b00000100010000110010100000000000;
            {InsMem[20],InsMem[21],InsMem[22],InsMem[23]}=32'b01100000000001010010100010000000;
            {InsMem[24],InsMem[25],InsMem[26],InsMem[27]}=32'b11010000101000011111111111111110;
            {InsMem[28],InsMem[29],InsMem[30],InsMem[31]}=32'b11101000000000000000000000010000;
            {InsMem[32],InsMem[33],InsMem[34],InsMem[35]}=32'b10011000110000010100000000000000;
            {InsMem[36],InsMem[37],InsMem[38],InsMem[39]}=32'b00001000000011101111111111111111;
            {InsMem[40],InsMem[41],InsMem[42],InsMem[43]}=32'b10011001000011100100100000000000;
            {InsMem[44],InsMem[45],InsMem[46],InsMem[47]}=32'b10011101001000100101000000000000;
            {InsMem[48],InsMem[49],InsMem[50],InsMem[51]}=32'b10011101010010100101100000000000;
            {InsMem[52],InsMem[53],InsMem[54],InsMem[55]}=32'b00000001110010100111000000000000;
            {InsMem[56],InsMem[57],InsMem[58],InsMem[59]}=32'b11010101110010101111111111111110;
            {InsMem[60],InsMem[61],InsMem[62],InsMem[63]}=32'b11100000000000000000000000010011;
            {InsMem[64],InsMem[65],InsMem[66],InsMem[67]}=32'b11000000001000100000000000000010;
            {InsMem[68],InsMem[69],InsMem[70],InsMem[71]}=32'b11000100001001100000000000000010;
            {InsMem[72],InsMem[73],InsMem[74],InsMem[75]}=32'b11100111111000000000000000000000;
            {InsMem[76],InsMem[77],InsMem[78],InsMem[79]}=32'b11111100000000000000000000000000;
        end
    assign IDataOut=(RW==1'b1)?{InsMem[IAddr],InsMem[IAddr+1],InsMem[IAddr+2],InsMem[IAddr+3]}:32'b0;
endmodule
