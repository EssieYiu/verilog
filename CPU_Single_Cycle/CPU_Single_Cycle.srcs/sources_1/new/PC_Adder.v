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

//ִ��PC+4�ļӷ���
module PC_Adder(
    //���룺��ǰPC
    input [31:0] cur_PC,
    //�����˳��ִ���µ���һ��PC
    output reg [31:0] PC_sequence
    );
    always@(cur_PC) begin//����߼�
        PC_sequence = cur_PC + 4;
     end
endmodule
