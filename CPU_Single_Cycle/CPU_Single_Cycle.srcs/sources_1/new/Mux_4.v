`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 11:52:59
// Design Name: 
// Module Name: Mux_4
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

//��ؼĴ�������ALU�Ľ�� or ���ݴ洢�������
module Mux_4(
    //���ݴ洢���е�����
    input [31:0] DataOut,
    //ALU�Ľ��
    input [31:0] ALUResult,
    input DBDataSrc,
    output [31:0] DB
    );
    assign DB = (DBDataSrc==1'b0)? ALUResult: DataOut;
endmodule
