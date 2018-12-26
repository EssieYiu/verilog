`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 11:52:22
// Design Name: 
// Module Name: Mux_1
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

//目的寄存器的选择
module Mux_1(
    input [4:0] rd,
    input [4:0] rt,
    input RegDst,
    //目的寄存器
    output [4:0] WriteReg
    );
    assign WriteReg = (RegDst == 1'b0)? rt:rd;
endmodule
