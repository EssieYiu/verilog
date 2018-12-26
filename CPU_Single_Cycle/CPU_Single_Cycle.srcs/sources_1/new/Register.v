`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 17:28:23
// Design Name: 
// Module Name: Register_File
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

//�Ĵ�����
module Register(
    input RST,
    input clk,
    //дʹ���ź� 0����д��1��д�Ĵ���
    input RegWre,
    // rs,rt,Ŀ��Ĵ�����rt/rd����5λ
    input[4:0] ReadReg1,
    input[4:0] ReadReg2,
    input[4:0] WriteReg,
    //д�������
    input[31:0] WriteData,
    //rs,rt���ݵ����
    output[31:0] ReadData1,ReadData2
    );
    reg [31:0] registerf[1:31];//1-31�żĴ�����32λ
    integer i;
    //��
    assign ReadData1 = (ReadReg1==0)? 0: registerf[ReadReg1];//�����Ĵ���Ϊ0��ֱ�Ӹ�ֵ0
    assign ReadData2 = (ReadReg2==0)? 0: registerf[ReadReg2];
    //д
    always@(posedge clk or RST==1) begin
        if(RST==1'b0)begin
            for(i=0;i<32;i=i+1)
                registerf[i]<= 0;
        end
        else if((WriteReg!=0)&&(RegWre==1'b1))//д��ļĴ�������0�Ĵ���������д���ź���Ч
            registerf[WriteReg]<=WriteData;//��data����Ĵ���
     end
endmodule
