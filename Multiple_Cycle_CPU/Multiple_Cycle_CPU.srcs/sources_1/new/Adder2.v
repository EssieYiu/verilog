`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 14:34:08
// Design Name: 
// Module Name: Adder2
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


module Adder2(
    input[31:0]imm,
    input[31:0]pc4,
    output reg[31:0]pc_branch
    );
    reg[31:0] i;
    always@(pc4 or imm)begin
        i = imm<<2;
        pc_branch = i + pc4;
    end
endmodule
