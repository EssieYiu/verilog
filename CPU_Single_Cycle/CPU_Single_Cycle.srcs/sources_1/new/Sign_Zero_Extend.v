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
    //16λimmediate
    input [15:0] imm_in,
    //0��zero-extend��1��sign-extend
    input ExtSel,
    //32λimmdiate
    output [31:0] imm_out
    );
    //���λΪ1��������չ��
    assign imm_out = (ExtSel && imm_in[15]==1'b1)? { 16'hffff, imm_in}: {16'b0, imm_in};//��ȡƴ�������
endmodule
