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

//寄存器堆
module Register(
    input RST,
    input clk,
    //写使能信号 0：不写；1：写寄存器
    input RegWre,
    // rs,rt,目标寄存器（rt/rd），5位
    input[4:0] ReadReg1,
    input[4:0] ReadReg2,
    input[4:0] WriteReg,
    //写入的数据
    input[31:0] WriteData,
    //rs,rt数据的输出
    output[31:0] ReadData1,ReadData2
    );
    reg [31:0] registerf[1:31];//1-31号寄存器，32位
    integer i;
    //读
    assign ReadData1 = (ReadReg1==0)? 0: registerf[ReadReg1];//若读寄存器为0，直接赋值0
    assign ReadData2 = (ReadReg2==0)? 0: registerf[ReadReg2];
    //写
    always@(posedge clk or RST==1) begin
        if(RST==1'b0)begin
            for(i=0;i<32;i=i+1)
                registerf[i]<= 0;
        end
        else if((WriteReg!=0)&&(RegWre==1'b1))//写入的寄存器不是0寄存器，并且写入信号有效
            registerf[WriteReg]<=WriteData;//将data存入寄存器
     end
endmodule
