`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 17:27:32
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
    //ָ��洢����д�����ź� 0������1��д
    input RW,
    //��ַ����˿�
    input [31:0]IAddr,
    //��������˿�
    output [31:0]IDataOut
    );
    //����100��8λ�Ĵ洢��
    reg [7:0] storage[99:0];
    
    initial begin
    //��ȡָ��
        $readmemb("E:/codes/Vivado/CPU_Single_Cycle/Instruction.txt",storage);//������ָ�����storage
    end
    assign IDataOut = { storage[IAddr],storage[IAddr+1],storage[IAddr+2],storage[IAddr+3] };
endmodule
