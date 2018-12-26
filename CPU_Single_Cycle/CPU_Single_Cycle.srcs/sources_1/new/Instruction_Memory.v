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
    //指令存储器读写控制信号 0：读；1：写
    input RW,
    //地址输入端口
    input [31:0]IAddr,
    //数据输出端口
    output [31:0]IDataOut
    );
    //声明100个8位的存储器
    reg [7:0] storage[99:0];
    
    initial begin
    //读取指令
        $readmemb("E:/codes/Vivado/CPU_Single_Cycle/Instruction.txt",storage);//将所有指令读进storage
    end
    assign IDataOut = { storage[IAddr],storage[IAddr+1],storage[IAddr+2],storage[IAddr+3] };
endmodule
