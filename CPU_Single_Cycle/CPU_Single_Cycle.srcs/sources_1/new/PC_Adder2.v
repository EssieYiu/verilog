`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 21:50:15
// Design Name: 
// Module Name: PC_Adder2
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

//ִ�� PC+4+ƫ����
module PC_Adder2(
    //���룺PC+4�Ľ��
    input [31:0] PCadd4,
    //���룺ƫ����
    input [31:0] Shift,
    //�����Ҫ��ת����PC
    output reg [31:0] PC_jump
    );
    //��ʱ����ֵ
    reg [31:0] tmp;
    always@(PCadd4 or Shift)begin//����߼�
        tmp = Shift<<2;
        PC_jump = PCadd4+tmp;//������ֵ����֤tmp��ֵ�Ѿ���������λ���ֵ
     end
endmodule
