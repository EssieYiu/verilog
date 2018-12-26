`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 17:31:10
// Design Name: 
// Module Name: Sign_Zero_Extend
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


module Sign_Zero_Extend(
    //16位immediate
    input [15:0] imm_in,
    //0：zero-extend；1：sign-extend
    input ExtSel,
    //32位immdiate
    output [31:0] imm_out
    );
    //最高位为1：符号拓展；
    assign imm_out = (ExtSel && imm_in[15]==1'b1)? { 16'hffff, imm_in}: {16'b0, imm_in};//采取拼接运算符
endmodule
